import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vitapmate/core/utils/general_utils.dart';
import 'package:vitapmate/features/social/presentation/providers/message_chat.dart';
import 'package:vitapmate/features/social/presentation/providers/msg_utils.dart';
import 'package:vitapmate/features/social/presentation/providers/pocketbase.dart';

bool Function() useIsMounted() {
  final isMountedRef = useRef(true);

  useEffect(() {
    return () {
      isMountedRef.value = false;
    };
  }, []);

  return () => isMountedRef.value;
}

final editingMessageProvider = StateProvider<RecordModel?>((ref) => null);
final replyingMessageProvider = StateProvider<RecordModel?>((ref) => null);

class MessageCard extends HookConsumerWidget {
  final RecordModel model;
  final ScrollController? scrollController;

  const MessageCard({super.key, required this.model, this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDeleting = useState(false);
    final showActions = useState(false);
    final currentUserId = ref.watch(pbProvider).value?.authStore.record?.id;
    final userRole = ref.watch(getRoleProvider(currentUserId ?? ''));
    final editingMessage = ref.watch(editingMessageProvider);
    final isMounted = useIsMounted();

    final canModify =
        currentUserId == model.getStringValue("user") ||
        userRole.value == "developer";

    final isBeingEdited = editingMessage?.id == model.id;

    void showSnackBarSafely(BuildContext context, SnackBar snackBar) {
      try {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } catch (e) {
        log('Could not show SnackBar: ${snackBar.content}');
      }
    }

    Future<void> editMessage() async {
      if (!context.mounted) return;

      HapticFeedback.lightImpact();
      ref.read(editingMessageProvider.notifier).state = model;
    }

    Future<void> replyToMessage() async {
      if (!context.mounted) return;

      HapticFeedback.lightImpact();
      ref.read(replyingMessageProvider.notifier).state = model;
    }

    Future<void> deleteMessage() async {
      if (!context.mounted || isDeleting.value || !isMounted()) return;

      try {
        isDeleting.value = true;
        HapticFeedback.mediumImpact();

        await ref.read(messageChatProvider.notifier).deleteMessage(model.id);

        if (context.mounted && isMounted()) {
          showSnackBarSafely(
            context,
            const SnackBar(
              content: Text('Message deleted'),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (context.mounted && isMounted()) {
          showSnackBarSafely(
            context,
            SnackBar(
              content: Text('Failed to delete message: $e'),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      } finally {
        if (isMounted()) {
          isDeleting.value = false;
        }
      }
    }

    Future<void> showContextMenu() async {
      if (!context.mounted) return;

      HapticFeedback.mediumImpact();

      final overlay =
          Overlay.of(context).context.findRenderObject() as RenderBox?;
      final box = context.findRenderObject() as RenderBox?;

      if (overlay == null || box == null) return;

      final offset = box.localToGlobal(Offset.zero, ancestor: overlay);

      final List<PopupMenuEntry<String>> menuItems = [
        const PopupMenuItem(
          value: 'reply',
          child: Row(
            children: [
              Icon(Icons.reply, size: 18, color: Colors.blue),
              SizedBox(width: 8),
              Text('Reply'),
            ],
          ),
        ),
      ];

      if (canModify) {
        menuItems.addAll([
          const PopupMenuItem(
            value: 'edit',
            child: Row(
              children: [
                Icon(Icons.edit, size: 18, color: Colors.orange),
                SizedBox(width: 8),
                Text('Edit'),
              ],
            ),
          ),
          const PopupMenuItem(
            value: 'delete',
            child: Row(
              children: [
                Icon(Icons.delete, size: 18, color: Colors.red),
                SizedBox(width: 8),
                Text('Delete', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ]);
      }

      final result = await showMenu<String>(
        color: context.theme.colors.primaryForeground,
        context: context,
        position: RelativeRect.fromLTRB(offset.dx, offset.dy, 0, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        items: menuItems,
      );

      if (!context.mounted) return;

      switch (result) {
        case 'reply':
          await replyToMessage();
          break;
        case 'edit':
          await editMessage();
          break;
        case 'delete':
          if (context.mounted) {
            await deleteMessage();
          }
          break;
      }
    }

    final messageText = model.getStringValue("text");
    final files = model.getListValue("files");
    final createdTime = model.getStringValue("created");
    final updatedTime = model.getStringValue("updated");
    final userId = model.getStringValue("user");
    final replyToId = model.getStringValue("reply_to");
    final isEdited = createdTime != updatedTime;

    return AnimatedContainer(
      key: ValueKey('message_${model.id}'),
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color:
            isBeingEdited
                ? Colors.blue.withValues(alpha: 0.1)
                : isDeleting.value
                ? Colors.red.withValues(alpha: .1)
                : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border:
            isBeingEdited
                ? Border.all(
                  color: Colors.blue.withValues(alpha: 0.3),
                  width: 2,
                )
                : isDeleting.value
                ? Border.all(color: Colors.red.withValues(alpha: 0.3))
                : null,
      ),
      child: FTappable(
        onPress: () {},
        onLongPress: showContextMenu,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAvatar(userId: userId),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MessageHeader(userId: userId, timestamp: createdTime),

                  const SizedBox(height: 6),

                  if (isBeingEdited) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.blue.withValues(alpha: .3),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.edit, size: 14, color: Colors.blue[700]),
                          const SizedBox(width: 4),
                          Text(
                            'Editing this message...',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],

                  if (replyToId.isNotEmpty) ...[
                    ReplyPreview(
                      replyToId: replyToId,
                      scrollController: scrollController,
                    ),
                    const SizedBox(height: 8),
                  ],

                  if (messageText.isNotEmpty) MessageBubble(text: messageText),

                  if (isEdited)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.edit, size: 12, color: Colors.grey[500]),
                          const SizedBox(width: 4),
                          Text(
                            "edited",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[500],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),

                  if (files.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    MessageAttachments(model: model, files: files),
                  ],

                  // Message Actions Row
                  const SizedBox(height: 8),

                  // MessageActions(
                  //   onReply: replyToMessage,
                  //   onEdit: canModify ? editMessage : null,
                  //   onDelete:
                  //       canModify
                  //           ? () async {

                  //             if (context.mounted) {
                  //               await deleteMessage();
                  //             }
                  //           }
                  //           : null,
                  //   showActions: showActions.value,
                  // ),
                  if (isDeleting.value)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.red[400],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Deleting...",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red[400],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageActions extends StatelessWidget {
  final VoidCallback onReply;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final bool showActions;

  const MessageActions({
    super.key,
    required this.onReply,
    this.onEdit,
    this.onDelete,
    required this.showActions,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: showActions ? 1.0 : 0.3,
      child: Row(
        children: [
          // Reply button (always visible)
          MessageActionButton(
            icon: Icons.reply,
            label: 'Reply',
            onTap: onReply,
            color: Colors.blue,
          ),

          if (onEdit != null) ...[
            const SizedBox(width: 8),
            MessageActionButton(
              icon: Icons.edit,
              label: 'Edit',
              onTap: onEdit!,
              color: Colors.orange,
            ),
          ],

          if (onDelete != null) ...[
            const SizedBox(width: 8),
            MessageActionButton(
              icon: Icons.delete,
              label: 'Delete',
              onTap: onDelete!,
              color: Colors.red,
            ),
          ],
        ],
      ),
    );
  }
}

class MessageActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color;

  const MessageActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FTappable(
      onPress: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: .3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReplyPreview extends HookConsumerWidget {
  final String replyToId;
  final ScrollController? scrollController;

  const ReplyPreview({
    super.key,
    required this.replyToId,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final replyMessageAsync = useState<AsyncValue<RecordModel?>>(
      const AsyncLoading(),
    );
    final messageChatNotifier = ref.read(messageChatProvider.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      void loadReplyMessage() async {
        try {
          if (!isMounted()) return;
          replyMessageAsync.value = const AsyncLoading();

          final message = await messageChatNotifier.fetchMessageById(replyToId);

          if (!isMounted()) return;
          replyMessageAsync.value = AsyncData(message);
        } catch (e) {
          if (!isMounted()) return;
          replyMessageAsync.value = AsyncError(e, StackTrace.current);
        }
      }

      loadReplyMessage();
      return null;
    }, [replyToId]);

    void showSnackBarSafely(BuildContext context, SnackBar snackBar) {
      try {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } catch (e) {
        log('Could not show SnackBar: ${snackBar.content}');
      }
    }

    void scrollToMessage(
      String messageId,
      WidgetRef ref,
      BuildContext context,
    ) async {
      if (scrollController == null || !scrollController!.hasClients) return;

      if (!context.mounted) return;

      HapticFeedback.lightImpact();

      try {
        showSnackBarSafely(
          context,
          const SnackBar(
            content: Row(
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 12),
                Text('Finding message...'),
              ],
            ),
            duration: Duration(seconds: 2),
          ),
        );

        final messageChatNotifier = ref.read(messageChatProvider.notifier);
        final messageIndex = await messageChatNotifier.findMessageIndex(
          messageId,
        );

        if (!context.mounted) return;

        if (messageIndex == null) {
          showSnackBarSafely(
            context,
            const SnackBar(
              content: Text('Message not found or too old'),
              backgroundColor: Colors.orange,
              duration: Duration(seconds: 3),
            ),
          );
          return;
        }

        const double estimatedMessageHeight = 120.0;
        const double headerHeight = 60.0;

        final targetOffset =
            headerHeight + (messageIndex * estimatedMessageHeight);

        await scrollController!.animateTo(
          targetOffset.clamp(0.0, scrollController!.position.maxScrollExtent),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );

        if (!context.mounted) return;

        HapticFeedback.selectionClick();
        showSnackBarSafely(
          context,
          const SnackBar(
            content: Text('Message found!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 1),
          ),
        );

        log(
          'Scrolled to message $messageId at index $messageIndex, offset: $targetOffset',
        );
      } catch (e) {
        log('Error scrolling to message: $e');
        if (context.mounted) {
          showSnackBarSafely(
            context,
            const SnackBar(
              content: Text('Failed to find message'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 3),
            ),
          );
        }
      }
    }

    return replyMessageAsync.value.when(
      data: (replyMessage) {
        if (replyMessage == null) {
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.reply, size: 14, color: Colors.grey[600]),
                          const SizedBox(width: 6),
                          Text(
                            'Replying to unknown message',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'This message is no longer available',
                        style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        final replyText = replyMessage.getStringValue("text");
        final replyUserId = replyMessage.getStringValue("user");
        final replyFiles = replyMessage.getListValue("files");

        return FTappable(
          onPress: () => scrollToMessage(replyToId, ref, context),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.withValues(alpha: .2)),
            ),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.reply, size: 14, color: Colors.blue[700]),
                          const SizedBox(width: 6),
                          Text(
                            'Replying to',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue[700],
                            ),
                          ),
                          const SizedBox(width: 4),
                          Flexible(child: UserName(userId: replyUserId)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      if (replyText.isNotEmpty)
                        Text(
                          replyText.length > 100
                              ? '${replyText.substring(0, 100)}...'
                              : replyText,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blue[600],
                            height: 1.3,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      if (replyFiles.isNotEmpty && replyText.isEmpty)
                        Row(
                          children: [
                            Icon(
                              Icons.attach_file,
                              size: 14,
                              color: Colors.blue[600],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${replyFiles.length} file${replyFiles.length > 1 ? 's' : ''}',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.blue[600],
                              ),
                            ),
                          ],
                        ),
                      if (replyFiles.isNotEmpty && replyText.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                            children: [
                              Icon(
                                Icons.attach_file,
                                size: 12,
                                color: Colors.blue[500],
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${replyFiles.length} attachment${replyFiles.length > 1 ? 's' : ''}',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Colors.blue[400],
                ),
              ],
            ),
          ),
        );
      },
      loading:
          () => Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: .1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 12,
                            height: 12,
                            child: CircularProgressIndicator(strokeWidth: 1),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Loading reply...',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      error:
          (error, stack) => Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.red.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.error, size: 14, color: Colors.red[600]),
                          const SizedBox(width: 6),
                          Text(
                            'Failed to load reply',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red[600],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

class MessageHeader extends ConsumerWidget {
  final String userId;
  final String timestamp;

  const MessageHeader({
    super.key,
    required this.userId,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Flexible(
          child: Row(
            children: [
              Flexible(child: UserName(userId: userId)),
              const SizedBox(width: 6),
              UserRole(userId: userId),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(
          formatPocketBaseTimestamp(timestamp),
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String text;

  const MessageBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.theme.colors.primaryForeground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.1), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text.rich(
        _buildTextSpans(text),
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black87,
          height: 1.4,
        ),
        // contextMenuBuilder: (context, editableTextState) {
        //   return AdaptiveTextSelectionToolbar.editableText(
        //     editableTextState: editableTextState,
        //   );
        // },
      ),
    );
  }

  TextSpan _buildTextSpans(String text) {
    final List<TextSpan> spans = [];
    final RegExp urlRegex = RegExp(
      r'https?://(?:[-\w.])+(?:\:[0-9]+)?(?:/(?:[\w/_.])*(?:\?(?:[\w&=%.])*)?(?:\#(?:[\w.])*)?)?',
      caseSensitive: false,
    );
    final RegExp emailRegex = RegExp(
      r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b',
    );
    final RegExp mentionRegex = RegExp(r'\B@(\w+)');
    final RegExp boldRegex = RegExp(r'\*\*(.*?)\*\*');
    final RegExp italicRegex = RegExp(r'\*(.*?)\*');

    int lastEnd = 0;
    final List<_MatchWithType> allMatches = [];

    allMatches.addAll(
      urlRegex.allMatches(text).map((m) => _MatchWithType(m, 'url')),
    );
    allMatches.addAll(
      emailRegex.allMatches(text).map((m) => _MatchWithType(m, 'email')),
    );
    allMatches.addAll(
      mentionRegex.allMatches(text).map((m) => _MatchWithType(m, 'mention')),
    );
    allMatches.addAll(
      boldRegex.allMatches(text).map((m) => _MatchWithType(m, 'bold')),
    );
    allMatches.addAll(
      italicRegex.allMatches(text).map((m) => _MatchWithType(m, 'italic')),
    );

    allMatches.sort((a, b) => a.match.start.compareTo(b.match.start));

    for (final matchWithType in allMatches) {
      final match = matchWithType.match;
      final type = matchWithType.type;

      if (match.start < lastEnd) continue;

      if (match.start > lastEnd) {
        spans.add(TextSpan(text: text.substring(lastEnd, match.start)));
      }

      switch (type) {
        case 'url':
          spans.add(
            TextSpan(
              text: match.group(0),
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () => _launchUrl(match.group(0)!),
            ),
          );
          break;
        case 'email':
          spans.add(
            TextSpan(
              text: match.group(0),
              style: const TextStyle(
                color: Colors.green,
                decoration: TextDecoration.underline,
              ),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () => _launchEmail(match.group(0)!),
            ),
          );
          break;
        case 'mention':
          spans.add(
            TextSpan(
              text: match.group(0),
              style: const TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.w500,
              ),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () => log("Mentioned user: ${match.group(0)}"),
            ),
          );
          break;
        case 'bold':
          spans.add(
            TextSpan(
              text: match.group(1),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
          break;
        case 'italic':
          spans.add(
            TextSpan(
              text: match.group(1),
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          );
          break;
      }

      lastEnd = match.end;
    }

    if (lastEnd < text.length) {
      spans.add(TextSpan(text: text.substring(lastEnd)));
    }

    return TextSpan(children: spans);
  }

  void _launchUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _launchEmail(String email) async {
    final uri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

class _MatchWithType {
  final Match match;
  final String type;
  _MatchWithType(this.match, this.type);
}

class MessageAttachments extends ConsumerWidget {
  final RecordModel model;
  final List files;

  const MessageAttachments({
    super.key,
    required this.model,
    required this.files,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pb = ref.watch(pbProvider).value;
    if (pb == null) return const SizedBox.shrink();

    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: files.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final filename = files[index];
          final fileUrl = pb.files.getUrl(model, filename).toString();

          return AttachmentThumbnail(fileUrl: fileUrl, filename: filename);
        },
      ),
    );
  }
}

class AttachmentThumbnail extends StatelessWidget {
  final String fileUrl;
  final String filename;

  const AttachmentThumbnail({
    super.key,
    required this.fileUrl,
    required this.filename,
  });

  bool get isImage {
    final ext = filename.toLowerCase().split('.').last;
    return ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp'].contains(ext);
  }

  bool get isVideo {
    final ext = filename.toLowerCase().split('.').last;
    return ['mp4', 'avi', 'mov', 'wmv', 'flv', 'webm', 'mkv'].contains(ext);
  }

  bool get isAudio {
    final ext = filename.toLowerCase().split('.').last;
    return ['mp3', 'wav', 'flac', 'aac', 'ogg', 'm4a'].contains(ext);
  }

  bool get isDocument {
    final ext = filename.toLowerCase().split('.').last;
    return ['pdf', 'doc', 'docx', 'txt', 'rtf', 'odt'].contains(ext);
  }

  IconData get fileIcon {
    if (isImage) return Icons.image;
    if (isVideo) return Icons.video_file;
    if (isAudio) return Icons.audio_file;
    if (isDocument) return Icons.description;
    return Icons.insert_drive_file;
  }

  Color get fileColor {
    if (isImage) return Colors.green;
    if (isVideo) return Colors.red;
    if (isAudio) return Colors.purple;
    if (isDocument) return Colors.blue;
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return FTappable(
      onPress: () => _showFileDialog(context),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.withValues(alpha: 0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              if (isImage)
                Image.network(
                  fileUrl,
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 120,
                      width: 120,
                      color: Colors.grey[200],
                      child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return _buildFilePreview();
                  },
                )
              else
                _buildFilePreview(),

              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    isImage ? Icons.fullscreen : Icons.open_in_new,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilePreview() {
    return Container(
      height: 120,
      width: 120,
      color: fileColor.withValues(alpha: 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(fileIcon, size: 40, color: fileColor),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              filename.length > 15
                  ? '${filename.substring(0, 12)}...'
                  : filename,
              style: TextStyle(
                fontSize: 10,
                color: fileColor,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  void _showFileDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder:
          (dialogContext) => Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(dialogContext).size.height * 0.8,
                maxWidth: MediaQuery.of(dialogContext).size.width * 0.9,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.withValues(alpha: 0.2),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(fileIcon, color: fileColor),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            filename,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.of(dialogContext).pop(),
                          icon: const Icon(Icons.close),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ),

                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child:
                          isImage
                              ? InteractiveViewer(
                                minScale: 0.5,
                                maxScale: 3.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    fileUrl,
                                    fit: BoxFit.contain,
                                    loadingBuilder: (
                                      context,
                                      child,
                                      loadingProgress,
                                    ) {
                                      if (loadingProgress == null) return child;
                                      return const SizedBox(
                                        height: 200,
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return const SizedBox(
                                        height: 200,
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.broken_image,
                                                size: 64,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                'Failed to load image',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                              : SizedBox(
                                height: 200,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        fileIcon,
                                        size: 64,
                                        color: fileColor,
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        filename,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Tap download to save this file',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.grey.withValues(alpha: 0.2),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FButton(
                          style: FButtonStyle.outline,
                          onPress: () => Navigator.of(dialogContext).pop(),
                          child: const Text('Close'),
                        ),
                        const SizedBox(width: 8),
                        FButton(
                          onPress: () {
                            Navigator.of(dialogContext).pop();
                            downloadFile(fileUrl, "");
                          },
                          child: const Text('Download'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

class UserAvatar extends HookConsumerWidget {
  final String userId;
  const UserAvatar({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDataAsync = ref.watch(getUserrecordProvider(userId));

    return userDataAsync.when(
      data: (data) {
        final record = data.$1;
        final pb = data.$2;
        final avatarFilename = record.getStringValue('avatar');

        if (avatarFilename.isEmpty) {
          return FAvatar(
            image: const NetworkImage(""),
            size: 40,
            fallback: Text(
              record.getStringValue('name').isNotEmpty
                  ? record.getStringValue('name')[0].toUpperCase()
                  : 'U',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        }

        final imageUrl = pb.files.getUrl(record, avatarFilename).toString();
        return FAvatar(
          size: 40,
          image: NetworkImage(imageUrl),
          fallback: Text(
            record.getStringValue('name').isNotEmpty
                ? record.getStringValue('name')[0].toUpperCase()
                : 'U',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      },
      error:
          (_, __) => FAvatar(
            image: NetworkImage(""),
            size: 40,
            fallback: Icon(Icons.person, color: Colors.grey),
          ),
      loading:
          () => FAvatar(
            image: NetworkImage(""),
            size: 40,
            fallback: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
    );
  }
}

class UserName extends HookConsumerWidget {
  final String userId;
  const UserName({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDataAsync = ref.watch(getUserrecordProvider(userId));

    return userDataAsync.when(
      data: (data) {
        final record = data.$1;
        final name = record.getStringValue('name');
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.5,
          ),
          child: Text(
            name.isNotEmpty ? name : 'Unknown User',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        );
      },
      error:
          (_, __) => const Text(
            'Error',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.red,
            ),
          ),
      loading:
          () => Container(
            width: 80,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
    );
  }
}

class UserRole extends HookConsumerWidget {
  final String userId;
  const UserRole({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roleAsync = ref.watch(getRoleProvider(userId));

    return roleAsync.when(
      data: (role) {
        if (role == null || role == "student") {
          return const SizedBox.shrink();
        }
        return FBadge(
          style: FBadgeStyle.outline,
          child: Text(role, style: const TextStyle(fontSize: 11)),
        );
      },
      error: (_, __) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}

String formatPocketBaseTimestamp(String raw) {
  try {
    final dateTime = DateTime.parse(raw).toLocal();
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    }

    final isToday =
        now.year == dateTime.year &&
        now.month == dateTime.month &&
        now.day == dateTime.day;

    if (isToday) {
      return DateFormat.jm().format(dateTime);
    } else {
      final isThisYear = now.year == dateTime.year;
      if (isThisYear) {
        return "${DateFormat('MMM dd').format(dateTime)} ${DateFormat.jm().format(dateTime)}";
      } else {
        return "${DateFormat('MMM dd, yyyy').format(dateTime)} ${DateFormat.jm().format(dateTime)}";
      }
    }
  } catch (e) {
    return 'Invalid date';
  }
}
