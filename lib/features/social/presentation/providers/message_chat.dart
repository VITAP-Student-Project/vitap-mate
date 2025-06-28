import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:http/http.dart' as http;
import 'package:pocketbase/pocketbase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:vitapmate/features/social/presentation/providers/pocketbase.dart';

part 'message_chat.g.dart';

@riverpod
class MessageChat extends _$MessageChat {
  int _page = 1;
  int _totalPages = 0;
  final int _perpage = 10;
  List<RecordModel> _messages = [];
  bool _isLoading = false;
  Timer? _debounceTimer;

  final Set<String> _processedMessageIds = <String>{};
  final Set<String> _optimisticMessageIds = <String>{};
  final Uuid _uuid = const Uuid();

  @override
  Future<List<RecordModel>> build() async {
    try {
      PocketBase pb = await ref.watch(pbProvider.future);

      final resultList = await pb
          .collection('chat_messages')
          .getList(
            page: 1,
            perPage: _perpage,
            sort: '-created',
            expand: 'reply_to',
          );

      _messages = resultList.items.reversed.toList();
      _totalPages = resultList.totalPages;
      _page = 1;

      _processedMessageIds.clear();
      _optimisticMessageIds.clear();
      _processedMessageIds.addAll(_messages.map((msg) => msg.id));

      await _setupRealtimeSubscription(pb);

      return _messages;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _setupRealtimeSubscription(PocketBase pb) async {
    try {
      await pb.collection('chat_messages').subscribe('*', (e) {
        if (state.isLoading) return;

        final recordId = e.record?.id;
        if (recordId == null) return;

        switch (e.action) {
          case 'create':
            _handleCreateEvent(e.record!);
            break;
          case 'update':
            _handleUpdateEvent(e.record!);
            break;
          case 'delete':
            _handleDeleteEvent(e.record!);
            break;
        }
      });

      ref.onDispose(() {
        pb.collection('chat_messages').unsubscribe('*');
        _debounceTimer?.cancel();
      });
    } catch (e) {
      log('Failed to setup real-time subscription: $e');
    }
  }

  void _handleCreateEvent(RecordModel record) {
    if (_processedMessageIds.contains(record.id)) {
      return;
    }

    final optimisticIndex = _messages.indexWhere((msg) => msg.id == record.id);
    if (optimisticIndex != -1) {
      _messages[optimisticIndex] = record;
      _optimisticMessageIds.remove(record.id);
    } else {
      _messages.add(record);
    }

    _processedMessageIds.add(record.id);
    _updateState();
  }

  void _handleUpdateEvent(RecordModel record) {
    final index = _messages.indexWhere((msg) => msg.id == record.id);
    if (index != -1) {
      _messages[index] = record;
      _updateState();
    }
  }

  void _handleDeleteEvent(RecordModel record) {
    final initialLength = _messages.length;
    _messages.removeWhere((msg) => msg.id == record.id);
    _processedMessageIds.remove(record.id);
    _optimisticMessageIds.remove(record.id);

    if (_messages.length != initialLength) {
      _updateState();
    }
  }

  void _updateState() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 50), () {
      state = AsyncData([..._messages]);
    });
  }

  Future<void> refreshMessages() async {
    if (_isLoading) return;

    try {
      _isLoading = true;
      final pb = await ref.read(pbProvider.future);
      final resultList = await pb
          .collection('chat_messages')
          .getList(
            page: 1,
            perPage: _perpage,
            sort: '-created',
            expand: 'reply_to',
          );

      _page = 1;
      _totalPages = resultList.totalPages;
      _messages = resultList.items.reversed.toList();

      _processedMessageIds.clear();
      _optimisticMessageIds.clear();
      _processedMessageIds.addAll(_messages.map((msg) => msg.id));

      state = AsyncData([..._messages]);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    } finally {
      _isLoading = false;
    }
  }

  Future<void> create(
    String text, {
    required List<File> files,
    String? replyToMessageId,
  }) async {
    if (text.trim().isEmpty) return;

    final pb = await ref.read(pbProvider.future);
    final messageId = _uuid.v4().replaceAll('-', '').substring(0, 15);
    RecordModel? optimisticMessage;

    try {
      if (pb.authStore.record != null) {
        final now = DateTime.now().toIso8601String();

        final optimisticData = {
          'id': messageId,
          'text': text.trim(),
          'user': pb.authStore.record!.id,
          'created': now,
          'updated': now,
          'files': files.map((f) => p.basename(f.path)).toList(),
          'reply_to': replyToMessageId ?? '',
          'collectionId': 'chat_messages',
          'collectionName': 'chat_messages',
        };

        optimisticMessage = RecordModel.fromJson(optimisticData);
        _messages.add(optimisticMessage);
        _optimisticMessageIds.add(messageId);
        state = AsyncData([..._messages]);
      }

      final body = <String, dynamic>{
        "id": messageId,
        "text": text.trim(),
        "user": pb.authStore.record!.id,
      };

      if (replyToMessageId != null && replyToMessageId.isNotEmpty) {
        body["reply_to"] = replyToMessageId;
      }

      var sfiles = [
        for (final file in files)
          http.MultipartFile.fromBytes(
            "files",
            await file.readAsBytes(),
            filename: p.basename(file.path),
          ),
      ];

      final newRecord = await pb
          .collection('chat_messages')
          .create(body: body, files: sfiles);
    } catch (e) {
      if (optimisticMessage != null) {
        _messages.removeWhere((msg) => msg.id == messageId);
        _optimisticMessageIds.remove(messageId);
        state = AsyncData([..._messages]);
      }

      throw Exception('Failed to send message: $e');
    }
  }

  Future<bool> loadMoreMessages() async {
    if (_isLoading || _page >= _totalPages) return false;

    try {
      _isLoading = true;
      final pb = await ref.read(pbProvider.future);

      final nextPage = _page + 1;
      final resultList = await pb
          .collection('chat_messages')
          .getList(
            page: nextPage,
            perPage: _perpage,
            sort: '-created',
            expand: 'reply_to',
          );

      final olderMessages = resultList.items.reversed.toList();

      for (final msg in olderMessages) {
        _processedMessageIds.add(msg.id);
      }

      _messages = [...olderMessages, ..._messages];
      _page = nextPage;

      state = AsyncData([..._messages]);
      return true;
    } catch (e) {
      log('Failed to load more messages: $e');
      return false;
    } finally {
      _isLoading = false;
    }
  }

  RecordModel? getMessageById(String id) {
    try {
      return _messages.firstWhere((msg) => msg.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<RecordModel?> fetchMessageById(String id) async {
    try {
      final localMessage = getMessageById(id);
      if (localMessage != null) return localMessage;

      final pb = await ref.read(pbProvider.future);
      final record = await pb
          .collection('chat_messages')
          .getOne(id, expand: 'reply_to');

      return record;
    } catch (e) {
      log('Failed to fetch message $id: $e');
      return null;
    }
  }

  int? getMessageIndexById(String id) {
    try {
      return _messages.indexWhere((msg) => msg.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<int?> findMessageIndex(String messageId) async {
    int? index = getMessageIndexById(messageId);
    if (index != null && index != -1) {
      return index;
    }

    while (_page < _totalPages) {
      final hasMore = await loadMoreMessages();
      if (!hasMore) break;

      index = getMessageIndexById(messageId);
      if (index != null && index != -1) {
        return index;
      }
    }

    return null;
  }

  // ignore: avoid_public_notifier_properties
  bool get hasMoreMessages => _page < _totalPages;

  // ignore: avoid_public_notifier_properties
  bool get isLoadingMore => _isLoading;

  Future<void> deleteMessage(String messageId) async {
    try {
      final pb = await ref.read(pbProvider.future);

      final messageToRemove = _messages.firstWhere(
        (msg) => msg.id == messageId,
      );
      _messages.removeWhere((msg) => msg.id == messageId);
      _processedMessageIds.remove(messageId);
      _optimisticMessageIds.remove(messageId);
      state = AsyncData([..._messages]);

      try {
        await pb.collection('chat_messages').delete(messageId);
      } catch (e) {
        _messages.add(messageToRemove);
        _processedMessageIds.add(messageId);
        _messages.sort(
          (a, b) => DateTime.parse(
            a.getStringValue('created'),
          ).compareTo(DateTime.parse(b.getStringValue('created'))),
        );
        state = AsyncData([..._messages]);
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateMessage(
    String messageId,
    String newText, {
    List<File>? files,
  }) async {
    if (newText.trim().isEmpty && (files == null || files.isEmpty)) return;

    try {
      final pb = await ref.read(pbProvider.future);

      final messageIndex = _messages.indexWhere((msg) => msg.id == messageId);
      RecordModel? originalMessage;

      if (messageIndex != -1) {
        originalMessage = _messages[messageIndex];

        final updatedData = Map<String, dynamic>.from(originalMessage.toJson());
        updatedData['text'] = newText.trim();
        updatedData['updated'] = DateTime.now().toIso8601String();

        if (files != null) {
          updatedData['files'] = files.map((f) => p.basename(f.path)).toList();
        }

        _messages[messageIndex] = RecordModel.fromJson(updatedData);
        state = AsyncData([..._messages]);
      }

      try {
        final body = <String, dynamic>{"text": newText.trim()};

        List<http.MultipartFile> sfiles = [];
        if (files != null && files.isNotEmpty) {
          sfiles = [
            for (final file in files)
              http.MultipartFile.fromBytes(
                "files",
                await file.readAsBytes(),
                filename: p.basename(file.path),
              ),
          ];
        }

        final updatedRecord = await pb
            .collection('chat_messages')
            .update(
              messageId,
              body: body,
              files: sfiles.isNotEmpty ? sfiles : [],
            );

        if (messageIndex != -1) {
          _messages[messageIndex] = updatedRecord;
          state = AsyncData([..._messages]);
        }
      } catch (e) {
        if (originalMessage != null && messageIndex != -1) {
          _messages[messageIndex] = originalMessage;
          state = AsyncData([..._messages]);
        }
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  bool isOptimisticMessage(RecordModel message) {
    return _optimisticMessageIds.contains(message.id);
  }

  // Future<void> retryOptimisticMessage(RecordModel optimisticMessage) async {
  //   try {
  //     final text = optimisticMessage.getStringValue('text');
  //     final replyToId = optimisticMessage.getStringValue('reply_to');
  //     final files = <File>[];

  //     _messages.removeWhere((msg) => msg.id == optimisticMessage.id);
  //     _optimisticMessageIds.remove(optimisticMessage.id);
  //     state = AsyncData([..._messages]);

  //     await create(
  //       text,
  //       files: files,
  //       replyToMessageId: replyToId.isNotEmpty ? replyToId : null,
  //     );
  //   } catch (e) {
  //     log('Failed to retry optimistic message: $e');
  //     rethrow;
  //   }
  // }

  void clearOptimisticMessages() {
    final hadOptimistic = _optimisticMessageIds.isNotEmpty;
    if (hadOptimistic) {
      _messages.removeWhere((msg) => _optimisticMessageIds.contains(msg.id));
      _optimisticMessageIds.clear();
      state = AsyncData([..._messages]);
    }
  }

  // ignore: avoid_public_notifier_properties
  int get optimisticMessageCount {
    return _optimisticMessageIds.length;
  }
}
