// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SemesterTableTable extends SemesterTable
    with TableInfo<$SemesterTableTable, SemesterTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SemesterTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _semidMeta = const VerificationMeta('semid');
  @override
  late final GeneratedColumn<String> semid = GeneratedColumn<String>(
    'semid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _semNameMeta = const VerificationMeta(
    'semName',
  );
  @override
  late final GeneratedColumn<String> semName = GeneratedColumn<String>(
    'sem_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [semid, semName, time];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'semester_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SemesterTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('semid')) {
      context.handle(
        _semidMeta,
        semid.isAcceptableOrUnknown(data['semid']!, _semidMeta),
      );
    } else if (isInserting) {
      context.missing(_semidMeta);
    }
    if (data.containsKey('sem_name')) {
      context.handle(
        _semNameMeta,
        semName.isAcceptableOrUnknown(data['sem_name']!, _semNameMeta),
      );
    } else if (isInserting) {
      context.missing(_semNameMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {semid};
  @override
  SemesterTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SemesterTableData(
      semid:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}semid'],
          )!,
      semName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sem_name'],
          )!,
      time:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}time'],
          )!,
    );
  }

  @override
  $SemesterTableTable createAlias(String alias) {
    return $SemesterTableTable(attachedDatabase, alias);
  }
}

class SemesterTableData extends DataClass
    implements Insertable<SemesterTableData> {
  final String semid;
  final String semName;
  final int time;
  const SemesterTableData({
    required this.semid,
    required this.semName,
    required this.time,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['semid'] = Variable<String>(semid);
    map['sem_name'] = Variable<String>(semName);
    map['time'] = Variable<int>(time);
    return map;
  }

  SemesterTableCompanion toCompanion(bool nullToAbsent) {
    return SemesterTableCompanion(
      semid: Value(semid),
      semName: Value(semName),
      time: Value(time),
    );
  }

  factory SemesterTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SemesterTableData(
      semid: serializer.fromJson<String>(json['semid']),
      semName: serializer.fromJson<String>(json['semName']),
      time: serializer.fromJson<int>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'semid': serializer.toJson<String>(semid),
      'semName': serializer.toJson<String>(semName),
      'time': serializer.toJson<int>(time),
    };
  }

  SemesterTableData copyWith({String? semid, String? semName, int? time}) =>
      SemesterTableData(
        semid: semid ?? this.semid,
        semName: semName ?? this.semName,
        time: time ?? this.time,
      );
  SemesterTableData copyWithCompanion(SemesterTableCompanion data) {
    return SemesterTableData(
      semid: data.semid.present ? data.semid.value : this.semid,
      semName: data.semName.present ? data.semName.value : this.semName,
      time: data.time.present ? data.time.value : this.time,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SemesterTableData(')
          ..write('semid: $semid, ')
          ..write('semName: $semName, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(semid, semName, time);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SemesterTableData &&
          other.semid == this.semid &&
          other.semName == this.semName &&
          other.time == this.time);
}

class SemesterTableCompanion extends UpdateCompanion<SemesterTableData> {
  final Value<String> semid;
  final Value<String> semName;
  final Value<int> time;
  final Value<int> rowid;
  const SemesterTableCompanion({
    this.semid = const Value.absent(),
    this.semName = const Value.absent(),
    this.time = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SemesterTableCompanion.insert({
    required String semid,
    required String semName,
    required int time,
    this.rowid = const Value.absent(),
  }) : semid = Value(semid),
       semName = Value(semName),
       time = Value(time);
  static Insertable<SemesterTableData> custom({
    Expression<String>? semid,
    Expression<String>? semName,
    Expression<int>? time,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (semid != null) 'semid': semid,
      if (semName != null) 'sem_name': semName,
      if (time != null) 'time': time,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SemesterTableCompanion copyWith({
    Value<String>? semid,
    Value<String>? semName,
    Value<int>? time,
    Value<int>? rowid,
  }) {
    return SemesterTableCompanion(
      semid: semid ?? this.semid,
      semName: semName ?? this.semName,
      time: time ?? this.time,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (semid.present) {
      map['semid'] = Variable<String>(semid.value);
    }
    if (semName.present) {
      map['sem_name'] = Variable<String>(semName.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SemesterTableCompanion(')
          ..write('semid: $semid, ')
          ..write('semName: $semName, ')
          ..write('time: $time, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TimetableTableTable extends TimetableTable
    with TableInfo<$TimetableTableTable, TimetableTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimetableTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serialMeta = const VerificationMeta('serial');
  @override
  late final GeneratedColumn<int> serial = GeneratedColumn<int>(
    'serial',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<String> day = GeneratedColumn<String>(
    'day',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _slotMeta = const VerificationMeta('slot');
  @override
  late final GeneratedColumn<String> slot = GeneratedColumn<String>(
    'slot',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseCodeMeta = const VerificationMeta(
    'courseCode',
  );
  @override
  late final GeneratedColumn<String> courseCode = GeneratedColumn<String>(
    'course_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseTypeMeta = const VerificationMeta(
    'courseType',
  );
  @override
  late final GeneratedColumn<String> courseType = GeneratedColumn<String>(
    'course_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseNameMeta = const VerificationMeta(
    'courseName',
  );
  @override
  late final GeneratedColumn<String> courseName = GeneratedColumn<String>(
    'course_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roomNoMeta = const VerificationMeta('roomNo');
  @override
  late final GeneratedColumn<String> roomNo = GeneratedColumn<String>(
    'room_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _blockMeta = const VerificationMeta('block');
  @override
  late final GeneratedColumn<String> block = GeneratedColumn<String>(
    'block',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<String> startTime = GeneratedColumn<String>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<String> endTime = GeneratedColumn<String>(
    'end_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _semIdMeta = const VerificationMeta('semId');
  @override
  late final GeneratedColumn<String> semId = GeneratedColumn<String>(
    'sem_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES semester_table (semid)',
    ),
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serial,
    day,
    slot,
    courseCode,
    courseType,
    courseName,
    roomNo,
    block,
    startTime,
    endTime,
    semId,
    time,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'timetable_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TimetableTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('serial')) {
      context.handle(
        _serialMeta,
        serial.isAcceptableOrUnknown(data['serial']!, _serialMeta),
      );
    } else if (isInserting) {
      context.missing(_serialMeta);
    }
    if (data.containsKey('day')) {
      context.handle(
        _dayMeta,
        day.isAcceptableOrUnknown(data['day']!, _dayMeta),
      );
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    if (data.containsKey('slot')) {
      context.handle(
        _slotMeta,
        slot.isAcceptableOrUnknown(data['slot']!, _slotMeta),
      );
    } else if (isInserting) {
      context.missing(_slotMeta);
    }
    if (data.containsKey('course_code')) {
      context.handle(
        _courseCodeMeta,
        courseCode.isAcceptableOrUnknown(data['course_code']!, _courseCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_courseCodeMeta);
    }
    if (data.containsKey('course_type')) {
      context.handle(
        _courseTypeMeta,
        courseType.isAcceptableOrUnknown(data['course_type']!, _courseTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_courseTypeMeta);
    }
    if (data.containsKey('course_name')) {
      context.handle(
        _courseNameMeta,
        courseName.isAcceptableOrUnknown(data['course_name']!, _courseNameMeta),
      );
    } else if (isInserting) {
      context.missing(_courseNameMeta);
    }
    if (data.containsKey('room_no')) {
      context.handle(
        _roomNoMeta,
        roomNo.isAcceptableOrUnknown(data['room_no']!, _roomNoMeta),
      );
    } else if (isInserting) {
      context.missing(_roomNoMeta);
    }
    if (data.containsKey('block')) {
      context.handle(
        _blockMeta,
        block.isAcceptableOrUnknown(data['block']!, _blockMeta),
      );
    } else if (isInserting) {
      context.missing(_blockMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('sem_id')) {
      context.handle(
        _semIdMeta,
        semId.isAcceptableOrUnknown(data['sem_id']!, _semIdMeta),
      );
    } else if (isInserting) {
      context.missing(_semIdMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {semId, startTime, day},
  ];
  @override
  TimetableTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimetableTableData(
      serial:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}serial'],
          )!,
      day:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}day'],
          )!,
      slot:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}slot'],
          )!,
      courseCode:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}course_code'],
          )!,
      courseType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}course_type'],
          )!,
      courseName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}course_name'],
          )!,
      roomNo:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}room_no'],
          )!,
      block:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}block'],
          )!,
      startTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}start_time'],
          )!,
      endTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}end_time'],
          )!,
      semId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sem_id'],
          )!,
      time:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}time'],
          )!,
    );
  }

  @override
  $TimetableTableTable createAlias(String alias) {
    return $TimetableTableTable(attachedDatabase, alias);
  }
}

class TimetableTableData extends DataClass
    implements Insertable<TimetableTableData> {
  final int serial;
  final String day;
  final String slot;
  final String courseCode;
  final String courseType;
  final String courseName;
  final String roomNo;
  final String block;
  final String startTime;
  final String endTime;
  final String semId;
  final int time;
  const TimetableTableData({
    required this.serial,
    required this.day,
    required this.slot,
    required this.courseCode,
    required this.courseType,
    required this.courseName,
    required this.roomNo,
    required this.block,
    required this.startTime,
    required this.endTime,
    required this.semId,
    required this.time,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['serial'] = Variable<int>(serial);
    map['day'] = Variable<String>(day);
    map['slot'] = Variable<String>(slot);
    map['course_code'] = Variable<String>(courseCode);
    map['course_type'] = Variable<String>(courseType);
    map['course_name'] = Variable<String>(courseName);
    map['room_no'] = Variable<String>(roomNo);
    map['block'] = Variable<String>(block);
    map['start_time'] = Variable<String>(startTime);
    map['end_time'] = Variable<String>(endTime);
    map['sem_id'] = Variable<String>(semId);
    map['time'] = Variable<int>(time);
    return map;
  }

  TimetableTableCompanion toCompanion(bool nullToAbsent) {
    return TimetableTableCompanion(
      serial: Value(serial),
      day: Value(day),
      slot: Value(slot),
      courseCode: Value(courseCode),
      courseType: Value(courseType),
      courseName: Value(courseName),
      roomNo: Value(roomNo),
      block: Value(block),
      startTime: Value(startTime),
      endTime: Value(endTime),
      semId: Value(semId),
      time: Value(time),
    );
  }

  factory TimetableTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimetableTableData(
      serial: serializer.fromJson<int>(json['serial']),
      day: serializer.fromJson<String>(json['day']),
      slot: serializer.fromJson<String>(json['slot']),
      courseCode: serializer.fromJson<String>(json['courseCode']),
      courseType: serializer.fromJson<String>(json['courseType']),
      courseName: serializer.fromJson<String>(json['courseName']),
      roomNo: serializer.fromJson<String>(json['roomNo']),
      block: serializer.fromJson<String>(json['block']),
      startTime: serializer.fromJson<String>(json['startTime']),
      endTime: serializer.fromJson<String>(json['endTime']),
      semId: serializer.fromJson<String>(json['semId']),
      time: serializer.fromJson<int>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serial': serializer.toJson<int>(serial),
      'day': serializer.toJson<String>(day),
      'slot': serializer.toJson<String>(slot),
      'courseCode': serializer.toJson<String>(courseCode),
      'courseType': serializer.toJson<String>(courseType),
      'courseName': serializer.toJson<String>(courseName),
      'roomNo': serializer.toJson<String>(roomNo),
      'block': serializer.toJson<String>(block),
      'startTime': serializer.toJson<String>(startTime),
      'endTime': serializer.toJson<String>(endTime),
      'semId': serializer.toJson<String>(semId),
      'time': serializer.toJson<int>(time),
    };
  }

  TimetableTableData copyWith({
    int? serial,
    String? day,
    String? slot,
    String? courseCode,
    String? courseType,
    String? courseName,
    String? roomNo,
    String? block,
    String? startTime,
    String? endTime,
    String? semId,
    int? time,
  }) => TimetableTableData(
    serial: serial ?? this.serial,
    day: day ?? this.day,
    slot: slot ?? this.slot,
    courseCode: courseCode ?? this.courseCode,
    courseType: courseType ?? this.courseType,
    courseName: courseName ?? this.courseName,
    roomNo: roomNo ?? this.roomNo,
    block: block ?? this.block,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    semId: semId ?? this.semId,
    time: time ?? this.time,
  );
  TimetableTableData copyWithCompanion(TimetableTableCompanion data) {
    return TimetableTableData(
      serial: data.serial.present ? data.serial.value : this.serial,
      day: data.day.present ? data.day.value : this.day,
      slot: data.slot.present ? data.slot.value : this.slot,
      courseCode:
          data.courseCode.present ? data.courseCode.value : this.courseCode,
      courseType:
          data.courseType.present ? data.courseType.value : this.courseType,
      courseName:
          data.courseName.present ? data.courseName.value : this.courseName,
      roomNo: data.roomNo.present ? data.roomNo.value : this.roomNo,
      block: data.block.present ? data.block.value : this.block,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      semId: data.semId.present ? data.semId.value : this.semId,
      time: data.time.present ? data.time.value : this.time,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TimetableTableData(')
          ..write('serial: $serial, ')
          ..write('day: $day, ')
          ..write('slot: $slot, ')
          ..write('courseCode: $courseCode, ')
          ..write('courseType: $courseType, ')
          ..write('courseName: $courseName, ')
          ..write('roomNo: $roomNo, ')
          ..write('block: $block, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('semId: $semId, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    serial,
    day,
    slot,
    courseCode,
    courseType,
    courseName,
    roomNo,
    block,
    startTime,
    endTime,
    semId,
    time,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimetableTableData &&
          other.serial == this.serial &&
          other.day == this.day &&
          other.slot == this.slot &&
          other.courseCode == this.courseCode &&
          other.courseType == this.courseType &&
          other.courseName == this.courseName &&
          other.roomNo == this.roomNo &&
          other.block == this.block &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.semId == this.semId &&
          other.time == this.time);
}

class TimetableTableCompanion extends UpdateCompanion<TimetableTableData> {
  final Value<int> serial;
  final Value<String> day;
  final Value<String> slot;
  final Value<String> courseCode;
  final Value<String> courseType;
  final Value<String> courseName;
  final Value<String> roomNo;
  final Value<String> block;
  final Value<String> startTime;
  final Value<String> endTime;
  final Value<String> semId;
  final Value<int> time;
  final Value<int> rowid;
  const TimetableTableCompanion({
    this.serial = const Value.absent(),
    this.day = const Value.absent(),
    this.slot = const Value.absent(),
    this.courseCode = const Value.absent(),
    this.courseType = const Value.absent(),
    this.courseName = const Value.absent(),
    this.roomNo = const Value.absent(),
    this.block = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.semId = const Value.absent(),
    this.time = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TimetableTableCompanion.insert({
    required int serial,
    required String day,
    required String slot,
    required String courseCode,
    required String courseType,
    required String courseName,
    required String roomNo,
    required String block,
    required String startTime,
    required String endTime,
    required String semId,
    required int time,
    this.rowid = const Value.absent(),
  }) : serial = Value(serial),
       day = Value(day),
       slot = Value(slot),
       courseCode = Value(courseCode),
       courseType = Value(courseType),
       courseName = Value(courseName),
       roomNo = Value(roomNo),
       block = Value(block),
       startTime = Value(startTime),
       endTime = Value(endTime),
       semId = Value(semId),
       time = Value(time);
  static Insertable<TimetableTableData> custom({
    Expression<int>? serial,
    Expression<String>? day,
    Expression<String>? slot,
    Expression<String>? courseCode,
    Expression<String>? courseType,
    Expression<String>? courseName,
    Expression<String>? roomNo,
    Expression<String>? block,
    Expression<String>? startTime,
    Expression<String>? endTime,
    Expression<String>? semId,
    Expression<int>? time,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serial != null) 'serial': serial,
      if (day != null) 'day': day,
      if (slot != null) 'slot': slot,
      if (courseCode != null) 'course_code': courseCode,
      if (courseType != null) 'course_type': courseType,
      if (courseName != null) 'course_name': courseName,
      if (roomNo != null) 'room_no': roomNo,
      if (block != null) 'block': block,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (semId != null) 'sem_id': semId,
      if (time != null) 'time': time,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TimetableTableCompanion copyWith({
    Value<int>? serial,
    Value<String>? day,
    Value<String>? slot,
    Value<String>? courseCode,
    Value<String>? courseType,
    Value<String>? courseName,
    Value<String>? roomNo,
    Value<String>? block,
    Value<String>? startTime,
    Value<String>? endTime,
    Value<String>? semId,
    Value<int>? time,
    Value<int>? rowid,
  }) {
    return TimetableTableCompanion(
      serial: serial ?? this.serial,
      day: day ?? this.day,
      slot: slot ?? this.slot,
      courseCode: courseCode ?? this.courseCode,
      courseType: courseType ?? this.courseType,
      courseName: courseName ?? this.courseName,
      roomNo: roomNo ?? this.roomNo,
      block: block ?? this.block,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      semId: semId ?? this.semId,
      time: time ?? this.time,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serial.present) {
      map['serial'] = Variable<int>(serial.value);
    }
    if (day.present) {
      map['day'] = Variable<String>(day.value);
    }
    if (slot.present) {
      map['slot'] = Variable<String>(slot.value);
    }
    if (courseCode.present) {
      map['course_code'] = Variable<String>(courseCode.value);
    }
    if (courseType.present) {
      map['course_type'] = Variable<String>(courseType.value);
    }
    if (courseName.present) {
      map['course_name'] = Variable<String>(courseName.value);
    }
    if (roomNo.present) {
      map['room_no'] = Variable<String>(roomNo.value);
    }
    if (block.present) {
      map['block'] = Variable<String>(block.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<String>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<String>(endTime.value);
    }
    if (semId.present) {
      map['sem_id'] = Variable<String>(semId.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimetableTableCompanion(')
          ..write('serial: $serial, ')
          ..write('day: $day, ')
          ..write('slot: $slot, ')
          ..write('courseCode: $courseCode, ')
          ..write('courseType: $courseType, ')
          ..write('courseName: $courseName, ')
          ..write('roomNo: $roomNo, ')
          ..write('block: $block, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('semId: $semId, ')
          ..write('time: $time, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FullAttendanceTableTable extends FullAttendanceTable
    with TableInfo<$FullAttendanceTableTable, FullAttendanceTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FullAttendanceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serialMeta = const VerificationMeta('serial');
  @override
  late final GeneratedColumn<int> serial = GeneratedColumn<int>(
    'serial',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _slotMeta = const VerificationMeta('slot');
  @override
  late final GeneratedColumn<String> slot = GeneratedColumn<String>(
    'slot',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dayTimeMeta = const VerificationMeta(
    'dayTime',
  );
  @override
  late final GeneratedColumn<String> dayTime = GeneratedColumn<String>(
    'day_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseTypeMeta = const VerificationMeta(
    'courseType',
  );
  @override
  late final GeneratedColumn<String> courseType = GeneratedColumn<String>(
    'course_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseIdMeta = const VerificationMeta(
    'courseId',
  );
  @override
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
    'course_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _semIdMeta = const VerificationMeta('semId');
  @override
  late final GeneratedColumn<String> semId = GeneratedColumn<String>(
    'sem_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES semester_table (semid)',
    ),
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serial,
    date,
    slot,
    dayTime,
    status,
    remark,
    courseType,
    courseId,
    semId,
    time,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'full_attendance_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<FullAttendanceTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('serial')) {
      context.handle(
        _serialMeta,
        serial.isAcceptableOrUnknown(data['serial']!, _serialMeta),
      );
    } else if (isInserting) {
      context.missing(_serialMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('slot')) {
      context.handle(
        _slotMeta,
        slot.isAcceptableOrUnknown(data['slot']!, _slotMeta),
      );
    } else if (isInserting) {
      context.missing(_slotMeta);
    }
    if (data.containsKey('day_time')) {
      context.handle(
        _dayTimeMeta,
        dayTime.isAcceptableOrUnknown(data['day_time']!, _dayTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_dayTimeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    } else if (isInserting) {
      context.missing(_remarkMeta);
    }
    if (data.containsKey('course_type')) {
      context.handle(
        _courseTypeMeta,
        courseType.isAcceptableOrUnknown(data['course_type']!, _courseTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_courseTypeMeta);
    }
    if (data.containsKey('course_id')) {
      context.handle(
        _courseIdMeta,
        courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('sem_id')) {
      context.handle(
        _semIdMeta,
        semId.isAcceptableOrUnknown(data['sem_id']!, _semIdMeta),
      );
    } else if (isInserting) {
      context.missing(_semIdMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  FullAttendanceTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FullAttendanceTableData(
      serial:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}serial'],
          )!,
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}date'],
          )!,
      slot:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}slot'],
          )!,
      dayTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}day_time'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
      remark:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}remark'],
          )!,
      courseType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}course_type'],
          )!,
      courseId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}course_id'],
          )!,
      semId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sem_id'],
          )!,
      time:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}time'],
          )!,
    );
  }

  @override
  $FullAttendanceTableTable createAlias(String alias) {
    return $FullAttendanceTableTable(attachedDatabase, alias);
  }
}

class FullAttendanceTableData extends DataClass
    implements Insertable<FullAttendanceTableData> {
  final int serial;
  final String date;
  final String slot;
  final String dayTime;
  final String status;
  final String remark;
  final String courseType;
  final String courseId;
  final String semId;
  final int time;
  const FullAttendanceTableData({
    required this.serial,
    required this.date,
    required this.slot,
    required this.dayTime,
    required this.status,
    required this.remark,
    required this.courseType,
    required this.courseId,
    required this.semId,
    required this.time,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['serial'] = Variable<int>(serial);
    map['date'] = Variable<String>(date);
    map['slot'] = Variable<String>(slot);
    map['day_time'] = Variable<String>(dayTime);
    map['status'] = Variable<String>(status);
    map['remark'] = Variable<String>(remark);
    map['course_type'] = Variable<String>(courseType);
    map['course_id'] = Variable<String>(courseId);
    map['sem_id'] = Variable<String>(semId);
    map['time'] = Variable<int>(time);
    return map;
  }

  FullAttendanceTableCompanion toCompanion(bool nullToAbsent) {
    return FullAttendanceTableCompanion(
      serial: Value(serial),
      date: Value(date),
      slot: Value(slot),
      dayTime: Value(dayTime),
      status: Value(status),
      remark: Value(remark),
      courseType: Value(courseType),
      courseId: Value(courseId),
      semId: Value(semId),
      time: Value(time),
    );
  }

  factory FullAttendanceTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FullAttendanceTableData(
      serial: serializer.fromJson<int>(json['serial']),
      date: serializer.fromJson<String>(json['date']),
      slot: serializer.fromJson<String>(json['slot']),
      dayTime: serializer.fromJson<String>(json['dayTime']),
      status: serializer.fromJson<String>(json['status']),
      remark: serializer.fromJson<String>(json['remark']),
      courseType: serializer.fromJson<String>(json['courseType']),
      courseId: serializer.fromJson<String>(json['courseId']),
      semId: serializer.fromJson<String>(json['semId']),
      time: serializer.fromJson<int>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serial': serializer.toJson<int>(serial),
      'date': serializer.toJson<String>(date),
      'slot': serializer.toJson<String>(slot),
      'dayTime': serializer.toJson<String>(dayTime),
      'status': serializer.toJson<String>(status),
      'remark': serializer.toJson<String>(remark),
      'courseType': serializer.toJson<String>(courseType),
      'courseId': serializer.toJson<String>(courseId),
      'semId': serializer.toJson<String>(semId),
      'time': serializer.toJson<int>(time),
    };
  }

  FullAttendanceTableData copyWith({
    int? serial,
    String? date,
    String? slot,
    String? dayTime,
    String? status,
    String? remark,
    String? courseType,
    String? courseId,
    String? semId,
    int? time,
  }) => FullAttendanceTableData(
    serial: serial ?? this.serial,
    date: date ?? this.date,
    slot: slot ?? this.slot,
    dayTime: dayTime ?? this.dayTime,
    status: status ?? this.status,
    remark: remark ?? this.remark,
    courseType: courseType ?? this.courseType,
    courseId: courseId ?? this.courseId,
    semId: semId ?? this.semId,
    time: time ?? this.time,
  );
  FullAttendanceTableData copyWithCompanion(FullAttendanceTableCompanion data) {
    return FullAttendanceTableData(
      serial: data.serial.present ? data.serial.value : this.serial,
      date: data.date.present ? data.date.value : this.date,
      slot: data.slot.present ? data.slot.value : this.slot,
      dayTime: data.dayTime.present ? data.dayTime.value : this.dayTime,
      status: data.status.present ? data.status.value : this.status,
      remark: data.remark.present ? data.remark.value : this.remark,
      courseType:
          data.courseType.present ? data.courseType.value : this.courseType,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      semId: data.semId.present ? data.semId.value : this.semId,
      time: data.time.present ? data.time.value : this.time,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FullAttendanceTableData(')
          ..write('serial: $serial, ')
          ..write('date: $date, ')
          ..write('slot: $slot, ')
          ..write('dayTime: $dayTime, ')
          ..write('status: $status, ')
          ..write('remark: $remark, ')
          ..write('courseType: $courseType, ')
          ..write('courseId: $courseId, ')
          ..write('semId: $semId, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    serial,
    date,
    slot,
    dayTime,
    status,
    remark,
    courseType,
    courseId,
    semId,
    time,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FullAttendanceTableData &&
          other.serial == this.serial &&
          other.date == this.date &&
          other.slot == this.slot &&
          other.dayTime == this.dayTime &&
          other.status == this.status &&
          other.remark == this.remark &&
          other.courseType == this.courseType &&
          other.courseId == this.courseId &&
          other.semId == this.semId &&
          other.time == this.time);
}

class FullAttendanceTableCompanion
    extends UpdateCompanion<FullAttendanceTableData> {
  final Value<int> serial;
  final Value<String> date;
  final Value<String> slot;
  final Value<String> dayTime;
  final Value<String> status;
  final Value<String> remark;
  final Value<String> courseType;
  final Value<String> courseId;
  final Value<String> semId;
  final Value<int> time;
  final Value<int> rowid;
  const FullAttendanceTableCompanion({
    this.serial = const Value.absent(),
    this.date = const Value.absent(),
    this.slot = const Value.absent(),
    this.dayTime = const Value.absent(),
    this.status = const Value.absent(),
    this.remark = const Value.absent(),
    this.courseType = const Value.absent(),
    this.courseId = const Value.absent(),
    this.semId = const Value.absent(),
    this.time = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FullAttendanceTableCompanion.insert({
    required int serial,
    required String date,
    required String slot,
    required String dayTime,
    required String status,
    required String remark,
    required String courseType,
    required String courseId,
    required String semId,
    required int time,
    this.rowid = const Value.absent(),
  }) : serial = Value(serial),
       date = Value(date),
       slot = Value(slot),
       dayTime = Value(dayTime),
       status = Value(status),
       remark = Value(remark),
       courseType = Value(courseType),
       courseId = Value(courseId),
       semId = Value(semId),
       time = Value(time);
  static Insertable<FullAttendanceTableData> custom({
    Expression<int>? serial,
    Expression<String>? date,
    Expression<String>? slot,
    Expression<String>? dayTime,
    Expression<String>? status,
    Expression<String>? remark,
    Expression<String>? courseType,
    Expression<String>? courseId,
    Expression<String>? semId,
    Expression<int>? time,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serial != null) 'serial': serial,
      if (date != null) 'date': date,
      if (slot != null) 'slot': slot,
      if (dayTime != null) 'day_time': dayTime,
      if (status != null) 'status': status,
      if (remark != null) 'remark': remark,
      if (courseType != null) 'course_type': courseType,
      if (courseId != null) 'course_id': courseId,
      if (semId != null) 'sem_id': semId,
      if (time != null) 'time': time,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FullAttendanceTableCompanion copyWith({
    Value<int>? serial,
    Value<String>? date,
    Value<String>? slot,
    Value<String>? dayTime,
    Value<String>? status,
    Value<String>? remark,
    Value<String>? courseType,
    Value<String>? courseId,
    Value<String>? semId,
    Value<int>? time,
    Value<int>? rowid,
  }) {
    return FullAttendanceTableCompanion(
      serial: serial ?? this.serial,
      date: date ?? this.date,
      slot: slot ?? this.slot,
      dayTime: dayTime ?? this.dayTime,
      status: status ?? this.status,
      remark: remark ?? this.remark,
      courseType: courseType ?? this.courseType,
      courseId: courseId ?? this.courseId,
      semId: semId ?? this.semId,
      time: time ?? this.time,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serial.present) {
      map['serial'] = Variable<int>(serial.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (slot.present) {
      map['slot'] = Variable<String>(slot.value);
    }
    if (dayTime.present) {
      map['day_time'] = Variable<String>(dayTime.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (courseType.present) {
      map['course_type'] = Variable<String>(courseType.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<String>(courseId.value);
    }
    if (semId.present) {
      map['sem_id'] = Variable<String>(semId.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FullAttendanceTableCompanion(')
          ..write('serial: $serial, ')
          ..write('date: $date, ')
          ..write('slot: $slot, ')
          ..write('dayTime: $dayTime, ')
          ..write('status: $status, ')
          ..write('remark: $remark, ')
          ..write('courseType: $courseType, ')
          ..write('courseId: $courseId, ')
          ..write('semId: $semId, ')
          ..write('time: $time, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AttendanceTableTable extends AttendanceTable
    with TableInfo<$AttendanceTableTable, AttendanceTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttendanceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serialMeta = const VerificationMeta('serial');
  @override
  late final GeneratedColumn<int> serial = GeneratedColumn<int>(
    'serial',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseNameMeta = const VerificationMeta(
    'courseName',
  );
  @override
  late final GeneratedColumn<String> courseName = GeneratedColumn<String>(
    'course_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseCodeMeta = const VerificationMeta(
    'courseCode',
  );
  @override
  late final GeneratedColumn<String> courseCode = GeneratedColumn<String>(
    'course_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseTypeMeta = const VerificationMeta(
    'courseType',
  );
  @override
  late final GeneratedColumn<String> courseType = GeneratedColumn<String>(
    'course_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _facultyDetailMeta = const VerificationMeta(
    'facultyDetail',
  );
  @override
  late final GeneratedColumn<String> facultyDetail = GeneratedColumn<String>(
    'faculty_detail',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _classesAttendedMeta = const VerificationMeta(
    'classesAttended',
  );
  @override
  late final GeneratedColumn<String> classesAttended = GeneratedColumn<String>(
    'classes_attended',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalClassesMeta = const VerificationMeta(
    'totalClasses',
  );
  @override
  late final GeneratedColumn<String> totalClasses = GeneratedColumn<String>(
    'total_classes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _attendancePercentageMeta =
      const VerificationMeta('attendancePercentage');
  @override
  late final GeneratedColumn<String> attendancePercentage =
      GeneratedColumn<String>(
        'attendance_percentage',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _attendenceFatCatMeta = const VerificationMeta(
    'attendenceFatCat',
  );
  @override
  late final GeneratedColumn<String> attendenceFatCat = GeneratedColumn<String>(
    'attendence_fat_cat',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _debarStatusMeta = const VerificationMeta(
    'debarStatus',
  );
  @override
  late final GeneratedColumn<String> debarStatus = GeneratedColumn<String>(
    'debar_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseIdMeta = const VerificationMeta(
    'courseId',
  );
  @override
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
    'course_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _semIdMeta = const VerificationMeta('semId');
  @override
  late final GeneratedColumn<String> semId = GeneratedColumn<String>(
    'sem_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES semester_table (semid)',
    ),
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serial,
    category,
    courseName,
    courseCode,
    courseType,
    facultyDetail,
    classesAttended,
    totalClasses,
    attendancePercentage,
    attendenceFatCat,
    debarStatus,
    courseId,
    semId,
    time,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attendance_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AttendanceTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('serial')) {
      context.handle(
        _serialMeta,
        serial.isAcceptableOrUnknown(data['serial']!, _serialMeta),
      );
    } else if (isInserting) {
      context.missing(_serialMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('course_name')) {
      context.handle(
        _courseNameMeta,
        courseName.isAcceptableOrUnknown(data['course_name']!, _courseNameMeta),
      );
    } else if (isInserting) {
      context.missing(_courseNameMeta);
    }
    if (data.containsKey('course_code')) {
      context.handle(
        _courseCodeMeta,
        courseCode.isAcceptableOrUnknown(data['course_code']!, _courseCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_courseCodeMeta);
    }
    if (data.containsKey('course_type')) {
      context.handle(
        _courseTypeMeta,
        courseType.isAcceptableOrUnknown(data['course_type']!, _courseTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_courseTypeMeta);
    }
    if (data.containsKey('faculty_detail')) {
      context.handle(
        _facultyDetailMeta,
        facultyDetail.isAcceptableOrUnknown(
          data['faculty_detail']!,
          _facultyDetailMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_facultyDetailMeta);
    }
    if (data.containsKey('classes_attended')) {
      context.handle(
        _classesAttendedMeta,
        classesAttended.isAcceptableOrUnknown(
          data['classes_attended']!,
          _classesAttendedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_classesAttendedMeta);
    }
    if (data.containsKey('total_classes')) {
      context.handle(
        _totalClassesMeta,
        totalClasses.isAcceptableOrUnknown(
          data['total_classes']!,
          _totalClassesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalClassesMeta);
    }
    if (data.containsKey('attendance_percentage')) {
      context.handle(
        _attendancePercentageMeta,
        attendancePercentage.isAcceptableOrUnknown(
          data['attendance_percentage']!,
          _attendancePercentageMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_attendancePercentageMeta);
    }
    if (data.containsKey('attendence_fat_cat')) {
      context.handle(
        _attendenceFatCatMeta,
        attendenceFatCat.isAcceptableOrUnknown(
          data['attendence_fat_cat']!,
          _attendenceFatCatMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_attendenceFatCatMeta);
    }
    if (data.containsKey('debar_status')) {
      context.handle(
        _debarStatusMeta,
        debarStatus.isAcceptableOrUnknown(
          data['debar_status']!,
          _debarStatusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_debarStatusMeta);
    }
    if (data.containsKey('course_id')) {
      context.handle(
        _courseIdMeta,
        courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('sem_id')) {
      context.handle(
        _semIdMeta,
        semId.isAcceptableOrUnknown(data['sem_id']!, _semIdMeta),
      );
    } else if (isInserting) {
      context.missing(_semIdMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {semId, courseId, courseType},
  ];
  @override
  AttendanceTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttendanceTableData(
      serial:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}serial'],
          )!,
      category:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}category'],
          )!,
      courseName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}course_name'],
          )!,
      courseCode:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}course_code'],
          )!,
      courseType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}course_type'],
          )!,
      facultyDetail:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}faculty_detail'],
          )!,
      classesAttended:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}classes_attended'],
          )!,
      totalClasses:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}total_classes'],
          )!,
      attendancePercentage:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}attendance_percentage'],
          )!,
      attendenceFatCat:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}attendence_fat_cat'],
          )!,
      debarStatus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}debar_status'],
          )!,
      courseId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}course_id'],
          )!,
      semId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sem_id'],
          )!,
      time:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}time'],
          )!,
    );
  }

  @override
  $AttendanceTableTable createAlias(String alias) {
    return $AttendanceTableTable(attachedDatabase, alias);
  }
}

class AttendanceTableData extends DataClass
    implements Insertable<AttendanceTableData> {
  final int serial;
  final String category;
  final String courseName;
  final String courseCode;
  final String courseType;
  final String facultyDetail;
  final String classesAttended;
  final String totalClasses;
  final String attendancePercentage;
  final String attendenceFatCat;
  final String debarStatus;
  final String courseId;
  final String semId;
  final int time;
  const AttendanceTableData({
    required this.serial,
    required this.category,
    required this.courseName,
    required this.courseCode,
    required this.courseType,
    required this.facultyDetail,
    required this.classesAttended,
    required this.totalClasses,
    required this.attendancePercentage,
    required this.attendenceFatCat,
    required this.debarStatus,
    required this.courseId,
    required this.semId,
    required this.time,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['serial'] = Variable<int>(serial);
    map['category'] = Variable<String>(category);
    map['course_name'] = Variable<String>(courseName);
    map['course_code'] = Variable<String>(courseCode);
    map['course_type'] = Variable<String>(courseType);
    map['faculty_detail'] = Variable<String>(facultyDetail);
    map['classes_attended'] = Variable<String>(classesAttended);
    map['total_classes'] = Variable<String>(totalClasses);
    map['attendance_percentage'] = Variable<String>(attendancePercentage);
    map['attendence_fat_cat'] = Variable<String>(attendenceFatCat);
    map['debar_status'] = Variable<String>(debarStatus);
    map['course_id'] = Variable<String>(courseId);
    map['sem_id'] = Variable<String>(semId);
    map['time'] = Variable<int>(time);
    return map;
  }

  AttendanceTableCompanion toCompanion(bool nullToAbsent) {
    return AttendanceTableCompanion(
      serial: Value(serial),
      category: Value(category),
      courseName: Value(courseName),
      courseCode: Value(courseCode),
      courseType: Value(courseType),
      facultyDetail: Value(facultyDetail),
      classesAttended: Value(classesAttended),
      totalClasses: Value(totalClasses),
      attendancePercentage: Value(attendancePercentage),
      attendenceFatCat: Value(attendenceFatCat),
      debarStatus: Value(debarStatus),
      courseId: Value(courseId),
      semId: Value(semId),
      time: Value(time),
    );
  }

  factory AttendanceTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttendanceTableData(
      serial: serializer.fromJson<int>(json['serial']),
      category: serializer.fromJson<String>(json['category']),
      courseName: serializer.fromJson<String>(json['courseName']),
      courseCode: serializer.fromJson<String>(json['courseCode']),
      courseType: serializer.fromJson<String>(json['courseType']),
      facultyDetail: serializer.fromJson<String>(json['facultyDetail']),
      classesAttended: serializer.fromJson<String>(json['classesAttended']),
      totalClasses: serializer.fromJson<String>(json['totalClasses']),
      attendancePercentage: serializer.fromJson<String>(
        json['attendancePercentage'],
      ),
      attendenceFatCat: serializer.fromJson<String>(json['attendenceFatCat']),
      debarStatus: serializer.fromJson<String>(json['debarStatus']),
      courseId: serializer.fromJson<String>(json['courseId']),
      semId: serializer.fromJson<String>(json['semId']),
      time: serializer.fromJson<int>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serial': serializer.toJson<int>(serial),
      'category': serializer.toJson<String>(category),
      'courseName': serializer.toJson<String>(courseName),
      'courseCode': serializer.toJson<String>(courseCode),
      'courseType': serializer.toJson<String>(courseType),
      'facultyDetail': serializer.toJson<String>(facultyDetail),
      'classesAttended': serializer.toJson<String>(classesAttended),
      'totalClasses': serializer.toJson<String>(totalClasses),
      'attendancePercentage': serializer.toJson<String>(attendancePercentage),
      'attendenceFatCat': serializer.toJson<String>(attendenceFatCat),
      'debarStatus': serializer.toJson<String>(debarStatus),
      'courseId': serializer.toJson<String>(courseId),
      'semId': serializer.toJson<String>(semId),
      'time': serializer.toJson<int>(time),
    };
  }

  AttendanceTableData copyWith({
    int? serial,
    String? category,
    String? courseName,
    String? courseCode,
    String? courseType,
    String? facultyDetail,
    String? classesAttended,
    String? totalClasses,
    String? attendancePercentage,
    String? attendenceFatCat,
    String? debarStatus,
    String? courseId,
    String? semId,
    int? time,
  }) => AttendanceTableData(
    serial: serial ?? this.serial,
    category: category ?? this.category,
    courseName: courseName ?? this.courseName,
    courseCode: courseCode ?? this.courseCode,
    courseType: courseType ?? this.courseType,
    facultyDetail: facultyDetail ?? this.facultyDetail,
    classesAttended: classesAttended ?? this.classesAttended,
    totalClasses: totalClasses ?? this.totalClasses,
    attendancePercentage: attendancePercentage ?? this.attendancePercentage,
    attendenceFatCat: attendenceFatCat ?? this.attendenceFatCat,
    debarStatus: debarStatus ?? this.debarStatus,
    courseId: courseId ?? this.courseId,
    semId: semId ?? this.semId,
    time: time ?? this.time,
  );
  AttendanceTableData copyWithCompanion(AttendanceTableCompanion data) {
    return AttendanceTableData(
      serial: data.serial.present ? data.serial.value : this.serial,
      category: data.category.present ? data.category.value : this.category,
      courseName:
          data.courseName.present ? data.courseName.value : this.courseName,
      courseCode:
          data.courseCode.present ? data.courseCode.value : this.courseCode,
      courseType:
          data.courseType.present ? data.courseType.value : this.courseType,
      facultyDetail:
          data.facultyDetail.present
              ? data.facultyDetail.value
              : this.facultyDetail,
      classesAttended:
          data.classesAttended.present
              ? data.classesAttended.value
              : this.classesAttended,
      totalClasses:
          data.totalClasses.present
              ? data.totalClasses.value
              : this.totalClasses,
      attendancePercentage:
          data.attendancePercentage.present
              ? data.attendancePercentage.value
              : this.attendancePercentage,
      attendenceFatCat:
          data.attendenceFatCat.present
              ? data.attendenceFatCat.value
              : this.attendenceFatCat,
      debarStatus:
          data.debarStatus.present ? data.debarStatus.value : this.debarStatus,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      semId: data.semId.present ? data.semId.value : this.semId,
      time: data.time.present ? data.time.value : this.time,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceTableData(')
          ..write('serial: $serial, ')
          ..write('category: $category, ')
          ..write('courseName: $courseName, ')
          ..write('courseCode: $courseCode, ')
          ..write('courseType: $courseType, ')
          ..write('facultyDetail: $facultyDetail, ')
          ..write('classesAttended: $classesAttended, ')
          ..write('totalClasses: $totalClasses, ')
          ..write('attendancePercentage: $attendancePercentage, ')
          ..write('attendenceFatCat: $attendenceFatCat, ')
          ..write('debarStatus: $debarStatus, ')
          ..write('courseId: $courseId, ')
          ..write('semId: $semId, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    serial,
    category,
    courseName,
    courseCode,
    courseType,
    facultyDetail,
    classesAttended,
    totalClasses,
    attendancePercentage,
    attendenceFatCat,
    debarStatus,
    courseId,
    semId,
    time,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttendanceTableData &&
          other.serial == this.serial &&
          other.category == this.category &&
          other.courseName == this.courseName &&
          other.courseCode == this.courseCode &&
          other.courseType == this.courseType &&
          other.facultyDetail == this.facultyDetail &&
          other.classesAttended == this.classesAttended &&
          other.totalClasses == this.totalClasses &&
          other.attendancePercentage == this.attendancePercentage &&
          other.attendenceFatCat == this.attendenceFatCat &&
          other.debarStatus == this.debarStatus &&
          other.courseId == this.courseId &&
          other.semId == this.semId &&
          other.time == this.time);
}

class AttendanceTableCompanion extends UpdateCompanion<AttendanceTableData> {
  final Value<int> serial;
  final Value<String> category;
  final Value<String> courseName;
  final Value<String> courseCode;
  final Value<String> courseType;
  final Value<String> facultyDetail;
  final Value<String> classesAttended;
  final Value<String> totalClasses;
  final Value<String> attendancePercentage;
  final Value<String> attendenceFatCat;
  final Value<String> debarStatus;
  final Value<String> courseId;
  final Value<String> semId;
  final Value<int> time;
  final Value<int> rowid;
  const AttendanceTableCompanion({
    this.serial = const Value.absent(),
    this.category = const Value.absent(),
    this.courseName = const Value.absent(),
    this.courseCode = const Value.absent(),
    this.courseType = const Value.absent(),
    this.facultyDetail = const Value.absent(),
    this.classesAttended = const Value.absent(),
    this.totalClasses = const Value.absent(),
    this.attendancePercentage = const Value.absent(),
    this.attendenceFatCat = const Value.absent(),
    this.debarStatus = const Value.absent(),
    this.courseId = const Value.absent(),
    this.semId = const Value.absent(),
    this.time = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AttendanceTableCompanion.insert({
    required int serial,
    required String category,
    required String courseName,
    required String courseCode,
    required String courseType,
    required String facultyDetail,
    required String classesAttended,
    required String totalClasses,
    required String attendancePercentage,
    required String attendenceFatCat,
    required String debarStatus,
    required String courseId,
    required String semId,
    required int time,
    this.rowid = const Value.absent(),
  }) : serial = Value(serial),
       category = Value(category),
       courseName = Value(courseName),
       courseCode = Value(courseCode),
       courseType = Value(courseType),
       facultyDetail = Value(facultyDetail),
       classesAttended = Value(classesAttended),
       totalClasses = Value(totalClasses),
       attendancePercentage = Value(attendancePercentage),
       attendenceFatCat = Value(attendenceFatCat),
       debarStatus = Value(debarStatus),
       courseId = Value(courseId),
       semId = Value(semId),
       time = Value(time);
  static Insertable<AttendanceTableData> custom({
    Expression<int>? serial,
    Expression<String>? category,
    Expression<String>? courseName,
    Expression<String>? courseCode,
    Expression<String>? courseType,
    Expression<String>? facultyDetail,
    Expression<String>? classesAttended,
    Expression<String>? totalClasses,
    Expression<String>? attendancePercentage,
    Expression<String>? attendenceFatCat,
    Expression<String>? debarStatus,
    Expression<String>? courseId,
    Expression<String>? semId,
    Expression<int>? time,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serial != null) 'serial': serial,
      if (category != null) 'category': category,
      if (courseName != null) 'course_name': courseName,
      if (courseCode != null) 'course_code': courseCode,
      if (courseType != null) 'course_type': courseType,
      if (facultyDetail != null) 'faculty_detail': facultyDetail,
      if (classesAttended != null) 'classes_attended': classesAttended,
      if (totalClasses != null) 'total_classes': totalClasses,
      if (attendancePercentage != null)
        'attendance_percentage': attendancePercentage,
      if (attendenceFatCat != null) 'attendence_fat_cat': attendenceFatCat,
      if (debarStatus != null) 'debar_status': debarStatus,
      if (courseId != null) 'course_id': courseId,
      if (semId != null) 'sem_id': semId,
      if (time != null) 'time': time,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AttendanceTableCompanion copyWith({
    Value<int>? serial,
    Value<String>? category,
    Value<String>? courseName,
    Value<String>? courseCode,
    Value<String>? courseType,
    Value<String>? facultyDetail,
    Value<String>? classesAttended,
    Value<String>? totalClasses,
    Value<String>? attendancePercentage,
    Value<String>? attendenceFatCat,
    Value<String>? debarStatus,
    Value<String>? courseId,
    Value<String>? semId,
    Value<int>? time,
    Value<int>? rowid,
  }) {
    return AttendanceTableCompanion(
      serial: serial ?? this.serial,
      category: category ?? this.category,
      courseName: courseName ?? this.courseName,
      courseCode: courseCode ?? this.courseCode,
      courseType: courseType ?? this.courseType,
      facultyDetail: facultyDetail ?? this.facultyDetail,
      classesAttended: classesAttended ?? this.classesAttended,
      totalClasses: totalClasses ?? this.totalClasses,
      attendancePercentage: attendancePercentage ?? this.attendancePercentage,
      attendenceFatCat: attendenceFatCat ?? this.attendenceFatCat,
      debarStatus: debarStatus ?? this.debarStatus,
      courseId: courseId ?? this.courseId,
      semId: semId ?? this.semId,
      time: time ?? this.time,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serial.present) {
      map['serial'] = Variable<int>(serial.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (courseName.present) {
      map['course_name'] = Variable<String>(courseName.value);
    }
    if (courseCode.present) {
      map['course_code'] = Variable<String>(courseCode.value);
    }
    if (courseType.present) {
      map['course_type'] = Variable<String>(courseType.value);
    }
    if (facultyDetail.present) {
      map['faculty_detail'] = Variable<String>(facultyDetail.value);
    }
    if (classesAttended.present) {
      map['classes_attended'] = Variable<String>(classesAttended.value);
    }
    if (totalClasses.present) {
      map['total_classes'] = Variable<String>(totalClasses.value);
    }
    if (attendancePercentage.present) {
      map['attendance_percentage'] = Variable<String>(
        attendancePercentage.value,
      );
    }
    if (attendenceFatCat.present) {
      map['attendence_fat_cat'] = Variable<String>(attendenceFatCat.value);
    }
    if (debarStatus.present) {
      map['debar_status'] = Variable<String>(debarStatus.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<String>(courseId.value);
    }
    if (semId.present) {
      map['sem_id'] = Variable<String>(semId.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceTableCompanion(')
          ..write('serial: $serial, ')
          ..write('category: $category, ')
          ..write('courseName: $courseName, ')
          ..write('courseCode: $courseCode, ')
          ..write('courseType: $courseType, ')
          ..write('facultyDetail: $facultyDetail, ')
          ..write('classesAttended: $classesAttended, ')
          ..write('totalClasses: $totalClasses, ')
          ..write('attendancePercentage: $attendancePercentage, ')
          ..write('attendenceFatCat: $attendenceFatCat, ')
          ..write('debarStatus: $debarStatus, ')
          ..write('courseId: $courseId, ')
          ..write('semId: $semId, ')
          ..write('time: $time, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExamScheduleTableTable extends ExamScheduleTable
    with TableInfo<$ExamScheduleTableTable, ExamScheduleTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExamScheduleTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serialMeta = const VerificationMeta('serial');
  @override
  late final GeneratedColumn<int> serial = GeneratedColumn<int>(
    'serial',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _slotMeta = const VerificationMeta('slot');
  @override
  late final GeneratedColumn<String> slot = GeneratedColumn<String>(
    'slot',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseNameMeta = const VerificationMeta(
    'courseName',
  );
  @override
  late final GeneratedColumn<String> courseName = GeneratedColumn<String>(
    'course_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseCodeMeta = const VerificationMeta(
    'courseCode',
  );
  @override
  late final GeneratedColumn<String> courseCode = GeneratedColumn<String>(
    'course_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseTypeMeta = const VerificationMeta(
    'courseType',
  );
  @override
  late final GeneratedColumn<String> courseType = GeneratedColumn<String>(
    'course_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseIdMeta = const VerificationMeta(
    'courseId',
  );
  @override
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
    'course_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _examTypeMeta = const VerificationMeta(
    'examType',
  );
  @override
  late final GeneratedColumn<String> examType = GeneratedColumn<String>(
    'exam_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _examDateMeta = const VerificationMeta(
    'examDate',
  );
  @override
  late final GeneratedColumn<String> examDate = GeneratedColumn<String>(
    'exam_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _examSessionMeta = const VerificationMeta(
    'examSession',
  );
  @override
  late final GeneratedColumn<String> examSession = GeneratedColumn<String>(
    'exam_session',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reportingTimeMeta = const VerificationMeta(
    'reportingTime',
  );
  @override
  late final GeneratedColumn<String> reportingTime = GeneratedColumn<String>(
    'reporting_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _examTimeMeta = const VerificationMeta(
    'examTime',
  );
  @override
  late final GeneratedColumn<String> examTime = GeneratedColumn<String>(
    'exam_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _venueMeta = const VerificationMeta('venue');
  @override
  late final GeneratedColumn<String> venue = GeneratedColumn<String>(
    'venue',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seatLocationMeta = const VerificationMeta(
    'seatLocation',
  );
  @override
  late final GeneratedColumn<String> seatLocation = GeneratedColumn<String>(
    'seat_location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seatNoMeta = const VerificationMeta('seatNo');
  @override
  late final GeneratedColumn<String> seatNo = GeneratedColumn<String>(
    'seat_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _semIdMeta = const VerificationMeta('semId');
  @override
  late final GeneratedColumn<String> semId = GeneratedColumn<String>(
    'sem_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES semester_table (semid)',
    ),
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serial,
    slot,
    courseName,
    courseCode,
    courseType,
    courseId,
    examType,
    examDate,
    examSession,
    reportingTime,
    examTime,
    venue,
    seatLocation,
    seatNo,
    semId,
    time,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exam_schedule_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExamScheduleTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('serial')) {
      context.handle(
        _serialMeta,
        serial.isAcceptableOrUnknown(data['serial']!, _serialMeta),
      );
    } else if (isInserting) {
      context.missing(_serialMeta);
    }
    if (data.containsKey('slot')) {
      context.handle(
        _slotMeta,
        slot.isAcceptableOrUnknown(data['slot']!, _slotMeta),
      );
    } else if (isInserting) {
      context.missing(_slotMeta);
    }
    if (data.containsKey('course_name')) {
      context.handle(
        _courseNameMeta,
        courseName.isAcceptableOrUnknown(data['course_name']!, _courseNameMeta),
      );
    } else if (isInserting) {
      context.missing(_courseNameMeta);
    }
    if (data.containsKey('course_code')) {
      context.handle(
        _courseCodeMeta,
        courseCode.isAcceptableOrUnknown(data['course_code']!, _courseCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_courseCodeMeta);
    }
    if (data.containsKey('course_type')) {
      context.handle(
        _courseTypeMeta,
        courseType.isAcceptableOrUnknown(data['course_type']!, _courseTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_courseTypeMeta);
    }
    if (data.containsKey('course_id')) {
      context.handle(
        _courseIdMeta,
        courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('exam_type')) {
      context.handle(
        _examTypeMeta,
        examType.isAcceptableOrUnknown(data['exam_type']!, _examTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_examTypeMeta);
    }
    if (data.containsKey('exam_date')) {
      context.handle(
        _examDateMeta,
        examDate.isAcceptableOrUnknown(data['exam_date']!, _examDateMeta),
      );
    } else if (isInserting) {
      context.missing(_examDateMeta);
    }
    if (data.containsKey('exam_session')) {
      context.handle(
        _examSessionMeta,
        examSession.isAcceptableOrUnknown(
          data['exam_session']!,
          _examSessionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_examSessionMeta);
    }
    if (data.containsKey('reporting_time')) {
      context.handle(
        _reportingTimeMeta,
        reportingTime.isAcceptableOrUnknown(
          data['reporting_time']!,
          _reportingTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_reportingTimeMeta);
    }
    if (data.containsKey('exam_time')) {
      context.handle(
        _examTimeMeta,
        examTime.isAcceptableOrUnknown(data['exam_time']!, _examTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_examTimeMeta);
    }
    if (data.containsKey('venue')) {
      context.handle(
        _venueMeta,
        venue.isAcceptableOrUnknown(data['venue']!, _venueMeta),
      );
    } else if (isInserting) {
      context.missing(_venueMeta);
    }
    if (data.containsKey('seat_location')) {
      context.handle(
        _seatLocationMeta,
        seatLocation.isAcceptableOrUnknown(
          data['seat_location']!,
          _seatLocationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_seatLocationMeta);
    }
    if (data.containsKey('seat_no')) {
      context.handle(
        _seatNoMeta,
        seatNo.isAcceptableOrUnknown(data['seat_no']!, _seatNoMeta),
      );
    } else if (isInserting) {
      context.missing(_seatNoMeta);
    }
    if (data.containsKey('sem_id')) {
      context.handle(
        _semIdMeta,
        semId.isAcceptableOrUnknown(data['sem_id']!, _semIdMeta),
      );
    } else if (isInserting) {
      context.missing(_semIdMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {courseCode, examDate, examTime, semId, courseType},
  ];
  @override
  ExamScheduleTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExamScheduleTableData(
      serial:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}serial'],
          )!,
      slot:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}slot'],
          )!,
      courseName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}course_name'],
          )!,
      courseCode:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}course_code'],
          )!,
      courseType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}course_type'],
          )!,
      courseId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}course_id'],
          )!,
      examType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}exam_type'],
          )!,
      examDate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}exam_date'],
          )!,
      examSession:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}exam_session'],
          )!,
      reportingTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}reporting_time'],
          )!,
      examTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}exam_time'],
          )!,
      venue:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}venue'],
          )!,
      seatLocation:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}seat_location'],
          )!,
      seatNo:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}seat_no'],
          )!,
      semId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sem_id'],
          )!,
      time:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}time'],
          )!,
    );
  }

  @override
  $ExamScheduleTableTable createAlias(String alias) {
    return $ExamScheduleTableTable(attachedDatabase, alias);
  }
}

class ExamScheduleTableData extends DataClass
    implements Insertable<ExamScheduleTableData> {
  final int serial;
  final String slot;
  final String courseName;
  final String courseCode;
  final String courseType;
  final String courseId;
  final String examType;
  final String examDate;
  final String examSession;
  final String reportingTime;
  final String examTime;
  final String venue;
  final String seatLocation;
  final String seatNo;
  final String semId;
  final int time;
  const ExamScheduleTableData({
    required this.serial,
    required this.slot,
    required this.courseName,
    required this.courseCode,
    required this.courseType,
    required this.courseId,
    required this.examType,
    required this.examDate,
    required this.examSession,
    required this.reportingTime,
    required this.examTime,
    required this.venue,
    required this.seatLocation,
    required this.seatNo,
    required this.semId,
    required this.time,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['serial'] = Variable<int>(serial);
    map['slot'] = Variable<String>(slot);
    map['course_name'] = Variable<String>(courseName);
    map['course_code'] = Variable<String>(courseCode);
    map['course_type'] = Variable<String>(courseType);
    map['course_id'] = Variable<String>(courseId);
    map['exam_type'] = Variable<String>(examType);
    map['exam_date'] = Variable<String>(examDate);
    map['exam_session'] = Variable<String>(examSession);
    map['reporting_time'] = Variable<String>(reportingTime);
    map['exam_time'] = Variable<String>(examTime);
    map['venue'] = Variable<String>(venue);
    map['seat_location'] = Variable<String>(seatLocation);
    map['seat_no'] = Variable<String>(seatNo);
    map['sem_id'] = Variable<String>(semId);
    map['time'] = Variable<int>(time);
    return map;
  }

  ExamScheduleTableCompanion toCompanion(bool nullToAbsent) {
    return ExamScheduleTableCompanion(
      serial: Value(serial),
      slot: Value(slot),
      courseName: Value(courseName),
      courseCode: Value(courseCode),
      courseType: Value(courseType),
      courseId: Value(courseId),
      examType: Value(examType),
      examDate: Value(examDate),
      examSession: Value(examSession),
      reportingTime: Value(reportingTime),
      examTime: Value(examTime),
      venue: Value(venue),
      seatLocation: Value(seatLocation),
      seatNo: Value(seatNo),
      semId: Value(semId),
      time: Value(time),
    );
  }

  factory ExamScheduleTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExamScheduleTableData(
      serial: serializer.fromJson<int>(json['serial']),
      slot: serializer.fromJson<String>(json['slot']),
      courseName: serializer.fromJson<String>(json['courseName']),
      courseCode: serializer.fromJson<String>(json['courseCode']),
      courseType: serializer.fromJson<String>(json['courseType']),
      courseId: serializer.fromJson<String>(json['courseId']),
      examType: serializer.fromJson<String>(json['examType']),
      examDate: serializer.fromJson<String>(json['examDate']),
      examSession: serializer.fromJson<String>(json['examSession']),
      reportingTime: serializer.fromJson<String>(json['reportingTime']),
      examTime: serializer.fromJson<String>(json['examTime']),
      venue: serializer.fromJson<String>(json['venue']),
      seatLocation: serializer.fromJson<String>(json['seatLocation']),
      seatNo: serializer.fromJson<String>(json['seatNo']),
      semId: serializer.fromJson<String>(json['semId']),
      time: serializer.fromJson<int>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serial': serializer.toJson<int>(serial),
      'slot': serializer.toJson<String>(slot),
      'courseName': serializer.toJson<String>(courseName),
      'courseCode': serializer.toJson<String>(courseCode),
      'courseType': serializer.toJson<String>(courseType),
      'courseId': serializer.toJson<String>(courseId),
      'examType': serializer.toJson<String>(examType),
      'examDate': serializer.toJson<String>(examDate),
      'examSession': serializer.toJson<String>(examSession),
      'reportingTime': serializer.toJson<String>(reportingTime),
      'examTime': serializer.toJson<String>(examTime),
      'venue': serializer.toJson<String>(venue),
      'seatLocation': serializer.toJson<String>(seatLocation),
      'seatNo': serializer.toJson<String>(seatNo),
      'semId': serializer.toJson<String>(semId),
      'time': serializer.toJson<int>(time),
    };
  }

  ExamScheduleTableData copyWith({
    int? serial,
    String? slot,
    String? courseName,
    String? courseCode,
    String? courseType,
    String? courseId,
    String? examType,
    String? examDate,
    String? examSession,
    String? reportingTime,
    String? examTime,
    String? venue,
    String? seatLocation,
    String? seatNo,
    String? semId,
    int? time,
  }) => ExamScheduleTableData(
    serial: serial ?? this.serial,
    slot: slot ?? this.slot,
    courseName: courseName ?? this.courseName,
    courseCode: courseCode ?? this.courseCode,
    courseType: courseType ?? this.courseType,
    courseId: courseId ?? this.courseId,
    examType: examType ?? this.examType,
    examDate: examDate ?? this.examDate,
    examSession: examSession ?? this.examSession,
    reportingTime: reportingTime ?? this.reportingTime,
    examTime: examTime ?? this.examTime,
    venue: venue ?? this.venue,
    seatLocation: seatLocation ?? this.seatLocation,
    seatNo: seatNo ?? this.seatNo,
    semId: semId ?? this.semId,
    time: time ?? this.time,
  );
  ExamScheduleTableData copyWithCompanion(ExamScheduleTableCompanion data) {
    return ExamScheduleTableData(
      serial: data.serial.present ? data.serial.value : this.serial,
      slot: data.slot.present ? data.slot.value : this.slot,
      courseName:
          data.courseName.present ? data.courseName.value : this.courseName,
      courseCode:
          data.courseCode.present ? data.courseCode.value : this.courseCode,
      courseType:
          data.courseType.present ? data.courseType.value : this.courseType,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      examType: data.examType.present ? data.examType.value : this.examType,
      examDate: data.examDate.present ? data.examDate.value : this.examDate,
      examSession:
          data.examSession.present ? data.examSession.value : this.examSession,
      reportingTime:
          data.reportingTime.present
              ? data.reportingTime.value
              : this.reportingTime,
      examTime: data.examTime.present ? data.examTime.value : this.examTime,
      venue: data.venue.present ? data.venue.value : this.venue,
      seatLocation:
          data.seatLocation.present
              ? data.seatLocation.value
              : this.seatLocation,
      seatNo: data.seatNo.present ? data.seatNo.value : this.seatNo,
      semId: data.semId.present ? data.semId.value : this.semId,
      time: data.time.present ? data.time.value : this.time,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExamScheduleTableData(')
          ..write('serial: $serial, ')
          ..write('slot: $slot, ')
          ..write('courseName: $courseName, ')
          ..write('courseCode: $courseCode, ')
          ..write('courseType: $courseType, ')
          ..write('courseId: $courseId, ')
          ..write('examType: $examType, ')
          ..write('examDate: $examDate, ')
          ..write('examSession: $examSession, ')
          ..write('reportingTime: $reportingTime, ')
          ..write('examTime: $examTime, ')
          ..write('venue: $venue, ')
          ..write('seatLocation: $seatLocation, ')
          ..write('seatNo: $seatNo, ')
          ..write('semId: $semId, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    serial,
    slot,
    courseName,
    courseCode,
    courseType,
    courseId,
    examType,
    examDate,
    examSession,
    reportingTime,
    examTime,
    venue,
    seatLocation,
    seatNo,
    semId,
    time,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExamScheduleTableData &&
          other.serial == this.serial &&
          other.slot == this.slot &&
          other.courseName == this.courseName &&
          other.courseCode == this.courseCode &&
          other.courseType == this.courseType &&
          other.courseId == this.courseId &&
          other.examType == this.examType &&
          other.examDate == this.examDate &&
          other.examSession == this.examSession &&
          other.reportingTime == this.reportingTime &&
          other.examTime == this.examTime &&
          other.venue == this.venue &&
          other.seatLocation == this.seatLocation &&
          other.seatNo == this.seatNo &&
          other.semId == this.semId &&
          other.time == this.time);
}

class ExamScheduleTableCompanion
    extends UpdateCompanion<ExamScheduleTableData> {
  final Value<int> serial;
  final Value<String> slot;
  final Value<String> courseName;
  final Value<String> courseCode;
  final Value<String> courseType;
  final Value<String> courseId;
  final Value<String> examType;
  final Value<String> examDate;
  final Value<String> examSession;
  final Value<String> reportingTime;
  final Value<String> examTime;
  final Value<String> venue;
  final Value<String> seatLocation;
  final Value<String> seatNo;
  final Value<String> semId;
  final Value<int> time;
  final Value<int> rowid;
  const ExamScheduleTableCompanion({
    this.serial = const Value.absent(),
    this.slot = const Value.absent(),
    this.courseName = const Value.absent(),
    this.courseCode = const Value.absent(),
    this.courseType = const Value.absent(),
    this.courseId = const Value.absent(),
    this.examType = const Value.absent(),
    this.examDate = const Value.absent(),
    this.examSession = const Value.absent(),
    this.reportingTime = const Value.absent(),
    this.examTime = const Value.absent(),
    this.venue = const Value.absent(),
    this.seatLocation = const Value.absent(),
    this.seatNo = const Value.absent(),
    this.semId = const Value.absent(),
    this.time = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExamScheduleTableCompanion.insert({
    required int serial,
    required String slot,
    required String courseName,
    required String courseCode,
    required String courseType,
    required String courseId,
    required String examType,
    required String examDate,
    required String examSession,
    required String reportingTime,
    required String examTime,
    required String venue,
    required String seatLocation,
    required String seatNo,
    required String semId,
    required int time,
    this.rowid = const Value.absent(),
  }) : serial = Value(serial),
       slot = Value(slot),
       courseName = Value(courseName),
       courseCode = Value(courseCode),
       courseType = Value(courseType),
       courseId = Value(courseId),
       examType = Value(examType),
       examDate = Value(examDate),
       examSession = Value(examSession),
       reportingTime = Value(reportingTime),
       examTime = Value(examTime),
       venue = Value(venue),
       seatLocation = Value(seatLocation),
       seatNo = Value(seatNo),
       semId = Value(semId),
       time = Value(time);
  static Insertable<ExamScheduleTableData> custom({
    Expression<int>? serial,
    Expression<String>? slot,
    Expression<String>? courseName,
    Expression<String>? courseCode,
    Expression<String>? courseType,
    Expression<String>? courseId,
    Expression<String>? examType,
    Expression<String>? examDate,
    Expression<String>? examSession,
    Expression<String>? reportingTime,
    Expression<String>? examTime,
    Expression<String>? venue,
    Expression<String>? seatLocation,
    Expression<String>? seatNo,
    Expression<String>? semId,
    Expression<int>? time,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serial != null) 'serial': serial,
      if (slot != null) 'slot': slot,
      if (courseName != null) 'course_name': courseName,
      if (courseCode != null) 'course_code': courseCode,
      if (courseType != null) 'course_type': courseType,
      if (courseId != null) 'course_id': courseId,
      if (examType != null) 'exam_type': examType,
      if (examDate != null) 'exam_date': examDate,
      if (examSession != null) 'exam_session': examSession,
      if (reportingTime != null) 'reporting_time': reportingTime,
      if (examTime != null) 'exam_time': examTime,
      if (venue != null) 'venue': venue,
      if (seatLocation != null) 'seat_location': seatLocation,
      if (seatNo != null) 'seat_no': seatNo,
      if (semId != null) 'sem_id': semId,
      if (time != null) 'time': time,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExamScheduleTableCompanion copyWith({
    Value<int>? serial,
    Value<String>? slot,
    Value<String>? courseName,
    Value<String>? courseCode,
    Value<String>? courseType,
    Value<String>? courseId,
    Value<String>? examType,
    Value<String>? examDate,
    Value<String>? examSession,
    Value<String>? reportingTime,
    Value<String>? examTime,
    Value<String>? venue,
    Value<String>? seatLocation,
    Value<String>? seatNo,
    Value<String>? semId,
    Value<int>? time,
    Value<int>? rowid,
  }) {
    return ExamScheduleTableCompanion(
      serial: serial ?? this.serial,
      slot: slot ?? this.slot,
      courseName: courseName ?? this.courseName,
      courseCode: courseCode ?? this.courseCode,
      courseType: courseType ?? this.courseType,
      courseId: courseId ?? this.courseId,
      examType: examType ?? this.examType,
      examDate: examDate ?? this.examDate,
      examSession: examSession ?? this.examSession,
      reportingTime: reportingTime ?? this.reportingTime,
      examTime: examTime ?? this.examTime,
      venue: venue ?? this.venue,
      seatLocation: seatLocation ?? this.seatLocation,
      seatNo: seatNo ?? this.seatNo,
      semId: semId ?? this.semId,
      time: time ?? this.time,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serial.present) {
      map['serial'] = Variable<int>(serial.value);
    }
    if (slot.present) {
      map['slot'] = Variable<String>(slot.value);
    }
    if (courseName.present) {
      map['course_name'] = Variable<String>(courseName.value);
    }
    if (courseCode.present) {
      map['course_code'] = Variable<String>(courseCode.value);
    }
    if (courseType.present) {
      map['course_type'] = Variable<String>(courseType.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<String>(courseId.value);
    }
    if (examType.present) {
      map['exam_type'] = Variable<String>(examType.value);
    }
    if (examDate.present) {
      map['exam_date'] = Variable<String>(examDate.value);
    }
    if (examSession.present) {
      map['exam_session'] = Variable<String>(examSession.value);
    }
    if (reportingTime.present) {
      map['reporting_time'] = Variable<String>(reportingTime.value);
    }
    if (examTime.present) {
      map['exam_time'] = Variable<String>(examTime.value);
    }
    if (venue.present) {
      map['venue'] = Variable<String>(venue.value);
    }
    if (seatLocation.present) {
      map['seat_location'] = Variable<String>(seatLocation.value);
    }
    if (seatNo.present) {
      map['seat_no'] = Variable<String>(seatNo.value);
    }
    if (semId.present) {
      map['sem_id'] = Variable<String>(semId.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExamScheduleTableCompanion(')
          ..write('serial: $serial, ')
          ..write('slot: $slot, ')
          ..write('courseName: $courseName, ')
          ..write('courseCode: $courseCode, ')
          ..write('courseType: $courseType, ')
          ..write('courseId: $courseId, ')
          ..write('examType: $examType, ')
          ..write('examDate: $examDate, ')
          ..write('examSession: $examSession, ')
          ..write('reportingTime: $reportingTime, ')
          ..write('examTime: $examTime, ')
          ..write('venue: $venue, ')
          ..write('seatLocation: $seatLocation, ')
          ..write('seatNo: $seatNo, ')
          ..write('semId: $semId, ')
          ..write('time: $time, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MarksTableTable extends MarksTable
    with TableInfo<$MarksTableTable, MarksTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MarksTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serialMeta = const VerificationMeta('serial');
  @override
  late final GeneratedColumn<int> serial = GeneratedColumn<int>(
    'serial',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseCodeMeta = const VerificationMeta(
    'courseCode',
  );
  @override
  late final GeneratedColumn<String> courseCode = GeneratedColumn<String>(
    'course_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseTitleMeta = const VerificationMeta(
    'courseTitle',
  );
  @override
  late final GeneratedColumn<String> courseTitle = GeneratedColumn<String>(
    'course_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseTypeMeta = const VerificationMeta(
    'courseType',
  );
  @override
  late final GeneratedColumn<String> courseType = GeneratedColumn<String>(
    'course_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _facultyMeta = const VerificationMeta(
    'faculty',
  );
  @override
  late final GeneratedColumn<String> faculty = GeneratedColumn<String>(
    'faculty',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _slotMeta = const VerificationMeta('slot');
  @override
  late final GeneratedColumn<String> slot = GeneratedColumn<String>(
    'slot',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _marksMeta = const VerificationMeta('marks');
  @override
  late final GeneratedColumn<String> marks = GeneratedColumn<String>(
    'marks',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _semIdMeta = const VerificationMeta('semId');
  @override
  late final GeneratedColumn<String> semId = GeneratedColumn<String>(
    'sem_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES semester_table (semid)',
    ),
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serial,
    courseCode,
    courseTitle,
    courseType,
    faculty,
    slot,
    marks,
    semId,
    time,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'marks_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<MarksTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('serial')) {
      context.handle(
        _serialMeta,
        serial.isAcceptableOrUnknown(data['serial']!, _serialMeta),
      );
    } else if (isInserting) {
      context.missing(_serialMeta);
    }
    if (data.containsKey('course_code')) {
      context.handle(
        _courseCodeMeta,
        courseCode.isAcceptableOrUnknown(data['course_code']!, _courseCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_courseCodeMeta);
    }
    if (data.containsKey('course_title')) {
      context.handle(
        _courseTitleMeta,
        courseTitle.isAcceptableOrUnknown(
          data['course_title']!,
          _courseTitleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_courseTitleMeta);
    }
    if (data.containsKey('course_type')) {
      context.handle(
        _courseTypeMeta,
        courseType.isAcceptableOrUnknown(data['course_type']!, _courseTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_courseTypeMeta);
    }
    if (data.containsKey('faculty')) {
      context.handle(
        _facultyMeta,
        faculty.isAcceptableOrUnknown(data['faculty']!, _facultyMeta),
      );
    } else if (isInserting) {
      context.missing(_facultyMeta);
    }
    if (data.containsKey('slot')) {
      context.handle(
        _slotMeta,
        slot.isAcceptableOrUnknown(data['slot']!, _slotMeta),
      );
    } else if (isInserting) {
      context.missing(_slotMeta);
    }
    if (data.containsKey('marks')) {
      context.handle(
        _marksMeta,
        marks.isAcceptableOrUnknown(data['marks']!, _marksMeta),
      );
    } else if (isInserting) {
      context.missing(_marksMeta);
    }
    if (data.containsKey('sem_id')) {
      context.handle(
        _semIdMeta,
        semId.isAcceptableOrUnknown(data['sem_id']!, _semIdMeta),
      );
    } else if (isInserting) {
      context.missing(_semIdMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {
    semId,
    courseCode,
    courseType,
    serial,
    marks,
  };
  @override
  MarksTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MarksTableData(
      serial:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}serial'],
          )!,
      courseCode:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}course_code'],
          )!,
      courseTitle:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}course_title'],
          )!,
      courseType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}course_type'],
          )!,
      faculty:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}faculty'],
          )!,
      slot:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}slot'],
          )!,
      marks:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}marks'],
          )!,
      semId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sem_id'],
          )!,
      time:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}time'],
          )!,
    );
  }

  @override
  $MarksTableTable createAlias(String alias) {
    return $MarksTableTable(attachedDatabase, alias);
  }
}

class MarksTableData extends DataClass implements Insertable<MarksTableData> {
  final int serial;
  final String courseCode;
  final String courseTitle;
  final String courseType;
  final String faculty;
  final String slot;
  final String marks;
  final String semId;
  final int time;
  const MarksTableData({
    required this.serial,
    required this.courseCode,
    required this.courseTitle,
    required this.courseType,
    required this.faculty,
    required this.slot,
    required this.marks,
    required this.semId,
    required this.time,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['serial'] = Variable<int>(serial);
    map['course_code'] = Variable<String>(courseCode);
    map['course_title'] = Variable<String>(courseTitle);
    map['course_type'] = Variable<String>(courseType);
    map['faculty'] = Variable<String>(faculty);
    map['slot'] = Variable<String>(slot);
    map['marks'] = Variable<String>(marks);
    map['sem_id'] = Variable<String>(semId);
    map['time'] = Variable<int>(time);
    return map;
  }

  MarksTableCompanion toCompanion(bool nullToAbsent) {
    return MarksTableCompanion(
      serial: Value(serial),
      courseCode: Value(courseCode),
      courseTitle: Value(courseTitle),
      courseType: Value(courseType),
      faculty: Value(faculty),
      slot: Value(slot),
      marks: Value(marks),
      semId: Value(semId),
      time: Value(time),
    );
  }

  factory MarksTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MarksTableData(
      serial: serializer.fromJson<int>(json['serial']),
      courseCode: serializer.fromJson<String>(json['courseCode']),
      courseTitle: serializer.fromJson<String>(json['courseTitle']),
      courseType: serializer.fromJson<String>(json['courseType']),
      faculty: serializer.fromJson<String>(json['faculty']),
      slot: serializer.fromJson<String>(json['slot']),
      marks: serializer.fromJson<String>(json['marks']),
      semId: serializer.fromJson<String>(json['semId']),
      time: serializer.fromJson<int>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serial': serializer.toJson<int>(serial),
      'courseCode': serializer.toJson<String>(courseCode),
      'courseTitle': serializer.toJson<String>(courseTitle),
      'courseType': serializer.toJson<String>(courseType),
      'faculty': serializer.toJson<String>(faculty),
      'slot': serializer.toJson<String>(slot),
      'marks': serializer.toJson<String>(marks),
      'semId': serializer.toJson<String>(semId),
      'time': serializer.toJson<int>(time),
    };
  }

  MarksTableData copyWith({
    int? serial,
    String? courseCode,
    String? courseTitle,
    String? courseType,
    String? faculty,
    String? slot,
    String? marks,
    String? semId,
    int? time,
  }) => MarksTableData(
    serial: serial ?? this.serial,
    courseCode: courseCode ?? this.courseCode,
    courseTitle: courseTitle ?? this.courseTitle,
    courseType: courseType ?? this.courseType,
    faculty: faculty ?? this.faculty,
    slot: slot ?? this.slot,
    marks: marks ?? this.marks,
    semId: semId ?? this.semId,
    time: time ?? this.time,
  );
  MarksTableData copyWithCompanion(MarksTableCompanion data) {
    return MarksTableData(
      serial: data.serial.present ? data.serial.value : this.serial,
      courseCode:
          data.courseCode.present ? data.courseCode.value : this.courseCode,
      courseTitle:
          data.courseTitle.present ? data.courseTitle.value : this.courseTitle,
      courseType:
          data.courseType.present ? data.courseType.value : this.courseType,
      faculty: data.faculty.present ? data.faculty.value : this.faculty,
      slot: data.slot.present ? data.slot.value : this.slot,
      marks: data.marks.present ? data.marks.value : this.marks,
      semId: data.semId.present ? data.semId.value : this.semId,
      time: data.time.present ? data.time.value : this.time,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MarksTableData(')
          ..write('serial: $serial, ')
          ..write('courseCode: $courseCode, ')
          ..write('courseTitle: $courseTitle, ')
          ..write('courseType: $courseType, ')
          ..write('faculty: $faculty, ')
          ..write('slot: $slot, ')
          ..write('marks: $marks, ')
          ..write('semId: $semId, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    serial,
    courseCode,
    courseTitle,
    courseType,
    faculty,
    slot,
    marks,
    semId,
    time,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MarksTableData &&
          other.serial == this.serial &&
          other.courseCode == this.courseCode &&
          other.courseTitle == this.courseTitle &&
          other.courseType == this.courseType &&
          other.faculty == this.faculty &&
          other.slot == this.slot &&
          other.marks == this.marks &&
          other.semId == this.semId &&
          other.time == this.time);
}

class MarksTableCompanion extends UpdateCompanion<MarksTableData> {
  final Value<int> serial;
  final Value<String> courseCode;
  final Value<String> courseTitle;
  final Value<String> courseType;
  final Value<String> faculty;
  final Value<String> slot;
  final Value<String> marks;
  final Value<String> semId;
  final Value<int> time;
  final Value<int> rowid;
  const MarksTableCompanion({
    this.serial = const Value.absent(),
    this.courseCode = const Value.absent(),
    this.courseTitle = const Value.absent(),
    this.courseType = const Value.absent(),
    this.faculty = const Value.absent(),
    this.slot = const Value.absent(),
    this.marks = const Value.absent(),
    this.semId = const Value.absent(),
    this.time = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MarksTableCompanion.insert({
    required int serial,
    required String courseCode,
    required String courseTitle,
    required String courseType,
    required String faculty,
    required String slot,
    required String marks,
    required String semId,
    required int time,
    this.rowid = const Value.absent(),
  }) : serial = Value(serial),
       courseCode = Value(courseCode),
       courseTitle = Value(courseTitle),
       courseType = Value(courseType),
       faculty = Value(faculty),
       slot = Value(slot),
       marks = Value(marks),
       semId = Value(semId),
       time = Value(time);
  static Insertable<MarksTableData> custom({
    Expression<int>? serial,
    Expression<String>? courseCode,
    Expression<String>? courseTitle,
    Expression<String>? courseType,
    Expression<String>? faculty,
    Expression<String>? slot,
    Expression<String>? marks,
    Expression<String>? semId,
    Expression<int>? time,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serial != null) 'serial': serial,
      if (courseCode != null) 'course_code': courseCode,
      if (courseTitle != null) 'course_title': courseTitle,
      if (courseType != null) 'course_type': courseType,
      if (faculty != null) 'faculty': faculty,
      if (slot != null) 'slot': slot,
      if (marks != null) 'marks': marks,
      if (semId != null) 'sem_id': semId,
      if (time != null) 'time': time,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MarksTableCompanion copyWith({
    Value<int>? serial,
    Value<String>? courseCode,
    Value<String>? courseTitle,
    Value<String>? courseType,
    Value<String>? faculty,
    Value<String>? slot,
    Value<String>? marks,
    Value<String>? semId,
    Value<int>? time,
    Value<int>? rowid,
  }) {
    return MarksTableCompanion(
      serial: serial ?? this.serial,
      courseCode: courseCode ?? this.courseCode,
      courseTitle: courseTitle ?? this.courseTitle,
      courseType: courseType ?? this.courseType,
      faculty: faculty ?? this.faculty,
      slot: slot ?? this.slot,
      marks: marks ?? this.marks,
      semId: semId ?? this.semId,
      time: time ?? this.time,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serial.present) {
      map['serial'] = Variable<int>(serial.value);
    }
    if (courseCode.present) {
      map['course_code'] = Variable<String>(courseCode.value);
    }
    if (courseTitle.present) {
      map['course_title'] = Variable<String>(courseTitle.value);
    }
    if (courseType.present) {
      map['course_type'] = Variable<String>(courseType.value);
    }
    if (faculty.present) {
      map['faculty'] = Variable<String>(faculty.value);
    }
    if (slot.present) {
      map['slot'] = Variable<String>(slot.value);
    }
    if (marks.present) {
      map['marks'] = Variable<String>(marks.value);
    }
    if (semId.present) {
      map['sem_id'] = Variable<String>(semId.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MarksTableCompanion(')
          ..write('serial: $serial, ')
          ..write('courseCode: $courseCode, ')
          ..write('courseTitle: $courseTitle, ')
          ..write('courseType: $courseType, ')
          ..write('faculty: $faculty, ')
          ..write('slot: $slot, ')
          ..write('marks: $marks, ')
          ..write('semId: $semId, ')
          ..write('time: $time, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SemesterTableTable semesterTable = $SemesterTableTable(this);
  late final $TimetableTableTable timetableTable = $TimetableTableTable(this);
  late final $FullAttendanceTableTable fullAttendanceTable =
      $FullAttendanceTableTable(this);
  late final $AttendanceTableTable attendanceTable = $AttendanceTableTable(
    this,
  );
  late final $ExamScheduleTableTable examScheduleTable =
      $ExamScheduleTableTable(this);
  late final $MarksTableTable marksTable = $MarksTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    semesterTable,
    timetableTable,
    fullAttendanceTable,
    attendanceTable,
    examScheduleTable,
    marksTable,
  ];
}

typedef $$SemesterTableTableCreateCompanionBuilder =
    SemesterTableCompanion Function({
      required String semid,
      required String semName,
      required int time,
      Value<int> rowid,
    });
typedef $$SemesterTableTableUpdateCompanionBuilder =
    SemesterTableCompanion Function({
      Value<String> semid,
      Value<String> semName,
      Value<int> time,
      Value<int> rowid,
    });

final class $$SemesterTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $SemesterTableTable, SemesterTableData> {
  $$SemesterTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$TimetableTableTable, List<TimetableTableData>>
  _timetableTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.timetableTable,
    aliasName: $_aliasNameGenerator(
      db.semesterTable.semid,
      db.timetableTable.semId,
    ),
  );

  $$TimetableTableTableProcessedTableManager get timetableTableRefs {
    final manager = $$TimetableTableTableTableManager(
      $_db,
      $_db.timetableTable,
    ).filter((f) => f.semId.semid.sqlEquals($_itemColumn<String>('semid')!));

    final cache = $_typedResult.readTableOrNull(_timetableTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $FullAttendanceTableTable,
    List<FullAttendanceTableData>
  >
  _fullAttendanceTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.fullAttendanceTable,
        aliasName: $_aliasNameGenerator(
          db.semesterTable.semid,
          db.fullAttendanceTable.semId,
        ),
      );

  $$FullAttendanceTableTableProcessedTableManager get fullAttendanceTableRefs {
    final manager = $$FullAttendanceTableTableTableManager(
      $_db,
      $_db.fullAttendanceTable,
    ).filter((f) => f.semId.semid.sqlEquals($_itemColumn<String>('semid')!));

    final cache = $_typedResult.readTableOrNull(
      _fullAttendanceTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AttendanceTableTable, List<AttendanceTableData>>
  _attendanceTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.attendanceTable,
    aliasName: $_aliasNameGenerator(
      db.semesterTable.semid,
      db.attendanceTable.semId,
    ),
  );

  $$AttendanceTableTableProcessedTableManager get attendanceTableRefs {
    final manager = $$AttendanceTableTableTableManager(
      $_db,
      $_db.attendanceTable,
    ).filter((f) => f.semId.semid.sqlEquals($_itemColumn<String>('semid')!));

    final cache = $_typedResult.readTableOrNull(
      _attendanceTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ExamScheduleTableTable,
    List<ExamScheduleTableData>
  >
  _examScheduleTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.examScheduleTable,
        aliasName: $_aliasNameGenerator(
          db.semesterTable.semid,
          db.examScheduleTable.semId,
        ),
      );

  $$ExamScheduleTableTableProcessedTableManager get examScheduleTableRefs {
    final manager = $$ExamScheduleTableTableTableManager(
      $_db,
      $_db.examScheduleTable,
    ).filter((f) => f.semId.semid.sqlEquals($_itemColumn<String>('semid')!));

    final cache = $_typedResult.readTableOrNull(
      _examScheduleTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MarksTableTable, List<MarksTableData>>
  _marksTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.marksTable,
    aliasName: $_aliasNameGenerator(
      db.semesterTable.semid,
      db.marksTable.semId,
    ),
  );

  $$MarksTableTableProcessedTableManager get marksTableRefs {
    final manager = $$MarksTableTableTableManager(
      $_db,
      $_db.marksTable,
    ).filter((f) => f.semId.semid.sqlEquals($_itemColumn<String>('semid')!));

    final cache = $_typedResult.readTableOrNull(_marksTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SemesterTableTableFilterComposer
    extends Composer<_$AppDatabase, $SemesterTableTable> {
  $$SemesterTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get semid => $composableBuilder(
    column: $table.semid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get semName => $composableBuilder(
    column: $table.semName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> timetableTableRefs(
    Expression<bool> Function($$TimetableTableTableFilterComposer f) f,
  ) {
    final $$TimetableTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semid,
      referencedTable: $db.timetableTable,
      getReferencedColumn: (t) => t.semId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableTableTableFilterComposer(
            $db: $db,
            $table: $db.timetableTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> fullAttendanceTableRefs(
    Expression<bool> Function($$FullAttendanceTableTableFilterComposer f) f,
  ) {
    final $$FullAttendanceTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semid,
      referencedTable: $db.fullAttendanceTable,
      getReferencedColumn: (t) => t.semId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FullAttendanceTableTableFilterComposer(
            $db: $db,
            $table: $db.fullAttendanceTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> attendanceTableRefs(
    Expression<bool> Function($$AttendanceTableTableFilterComposer f) f,
  ) {
    final $$AttendanceTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semid,
      referencedTable: $db.attendanceTable,
      getReferencedColumn: (t) => t.semId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendanceTableTableFilterComposer(
            $db: $db,
            $table: $db.attendanceTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> examScheduleTableRefs(
    Expression<bool> Function($$ExamScheduleTableTableFilterComposer f) f,
  ) {
    final $$ExamScheduleTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semid,
      referencedTable: $db.examScheduleTable,
      getReferencedColumn: (t) => t.semId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExamScheduleTableTableFilterComposer(
            $db: $db,
            $table: $db.examScheduleTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> marksTableRefs(
    Expression<bool> Function($$MarksTableTableFilterComposer f) f,
  ) {
    final $$MarksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semid,
      referencedTable: $db.marksTable,
      getReferencedColumn: (t) => t.semId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MarksTableTableFilterComposer(
            $db: $db,
            $table: $db.marksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SemesterTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SemesterTableTable> {
  $$SemesterTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get semid => $composableBuilder(
    column: $table.semid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get semName => $composableBuilder(
    column: $table.semName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SemesterTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SemesterTableTable> {
  $$SemesterTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get semid =>
      $composableBuilder(column: $table.semid, builder: (column) => column);

  GeneratedColumn<String> get semName =>
      $composableBuilder(column: $table.semName, builder: (column) => column);

  GeneratedColumn<int> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  Expression<T> timetableTableRefs<T extends Object>(
    Expression<T> Function($$TimetableTableTableAnnotationComposer a) f,
  ) {
    final $$TimetableTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semid,
      referencedTable: $db.timetableTable,
      getReferencedColumn: (t) => t.semId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableTableTableAnnotationComposer(
            $db: $db,
            $table: $db.timetableTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> fullAttendanceTableRefs<T extends Object>(
    Expression<T> Function($$FullAttendanceTableTableAnnotationComposer a) f,
  ) {
    final $$FullAttendanceTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.semid,
          referencedTable: $db.fullAttendanceTable,
          getReferencedColumn: (t) => t.semId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FullAttendanceTableTableAnnotationComposer(
                $db: $db,
                $table: $db.fullAttendanceTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> attendanceTableRefs<T extends Object>(
    Expression<T> Function($$AttendanceTableTableAnnotationComposer a) f,
  ) {
    final $$AttendanceTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semid,
      referencedTable: $db.attendanceTable,
      getReferencedColumn: (t) => t.semId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendanceTableTableAnnotationComposer(
            $db: $db,
            $table: $db.attendanceTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> examScheduleTableRefs<T extends Object>(
    Expression<T> Function($$ExamScheduleTableTableAnnotationComposer a) f,
  ) {
    final $$ExamScheduleTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.semid,
          referencedTable: $db.examScheduleTable,
          getReferencedColumn: (t) => t.semId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExamScheduleTableTableAnnotationComposer(
                $db: $db,
                $table: $db.examScheduleTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> marksTableRefs<T extends Object>(
    Expression<T> Function($$MarksTableTableAnnotationComposer a) f,
  ) {
    final $$MarksTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semid,
      referencedTable: $db.marksTable,
      getReferencedColumn: (t) => t.semId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MarksTableTableAnnotationComposer(
            $db: $db,
            $table: $db.marksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SemesterTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SemesterTableTable,
          SemesterTableData,
          $$SemesterTableTableFilterComposer,
          $$SemesterTableTableOrderingComposer,
          $$SemesterTableTableAnnotationComposer,
          $$SemesterTableTableCreateCompanionBuilder,
          $$SemesterTableTableUpdateCompanionBuilder,
          (SemesterTableData, $$SemesterTableTableReferences),
          SemesterTableData,
          PrefetchHooks Function({
            bool timetableTableRefs,
            bool fullAttendanceTableRefs,
            bool attendanceTableRefs,
            bool examScheduleTableRefs,
            bool marksTableRefs,
          })
        > {
  $$SemesterTableTableTableManager(_$AppDatabase db, $SemesterTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SemesterTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$SemesterTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$SemesterTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> semid = const Value.absent(),
                Value<String> semName = const Value.absent(),
                Value<int> time = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SemesterTableCompanion(
                semid: semid,
                semName: semName,
                time: time,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String semid,
                required String semName,
                required int time,
                Value<int> rowid = const Value.absent(),
              }) => SemesterTableCompanion.insert(
                semid: semid,
                semName: semName,
                time: time,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$SemesterTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            timetableTableRefs = false,
            fullAttendanceTableRefs = false,
            attendanceTableRefs = false,
            examScheduleTableRefs = false,
            marksTableRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (timetableTableRefs) db.timetableTable,
                if (fullAttendanceTableRefs) db.fullAttendanceTable,
                if (attendanceTableRefs) db.attendanceTable,
                if (examScheduleTableRefs) db.examScheduleTable,
                if (marksTableRefs) db.marksTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (timetableTableRefs)
                    await $_getPrefetchedData<
                      SemesterTableData,
                      $SemesterTableTable,
                      TimetableTableData
                    >(
                      currentTable: table,
                      referencedTable: $$SemesterTableTableReferences
                          ._timetableTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$SemesterTableTableReferences(
                                db,
                                table,
                                p0,
                              ).timetableTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.semId == item.semid,
                          ),
                      typedResults: items,
                    ),
                  if (fullAttendanceTableRefs)
                    await $_getPrefetchedData<
                      SemesterTableData,
                      $SemesterTableTable,
                      FullAttendanceTableData
                    >(
                      currentTable: table,
                      referencedTable: $$SemesterTableTableReferences
                          ._fullAttendanceTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$SemesterTableTableReferences(
                                db,
                                table,
                                p0,
                              ).fullAttendanceTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.semId == item.semid,
                          ),
                      typedResults: items,
                    ),
                  if (attendanceTableRefs)
                    await $_getPrefetchedData<
                      SemesterTableData,
                      $SemesterTableTable,
                      AttendanceTableData
                    >(
                      currentTable: table,
                      referencedTable: $$SemesterTableTableReferences
                          ._attendanceTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$SemesterTableTableReferences(
                                db,
                                table,
                                p0,
                              ).attendanceTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.semId == item.semid,
                          ),
                      typedResults: items,
                    ),
                  if (examScheduleTableRefs)
                    await $_getPrefetchedData<
                      SemesterTableData,
                      $SemesterTableTable,
                      ExamScheduleTableData
                    >(
                      currentTable: table,
                      referencedTable: $$SemesterTableTableReferences
                          ._examScheduleTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$SemesterTableTableReferences(
                                db,
                                table,
                                p0,
                              ).examScheduleTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.semId == item.semid,
                          ),
                      typedResults: items,
                    ),
                  if (marksTableRefs)
                    await $_getPrefetchedData<
                      SemesterTableData,
                      $SemesterTableTable,
                      MarksTableData
                    >(
                      currentTable: table,
                      referencedTable: $$SemesterTableTableReferences
                          ._marksTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$SemesterTableTableReferences(
                                db,
                                table,
                                p0,
                              ).marksTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.semId == item.semid,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SemesterTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SemesterTableTable,
      SemesterTableData,
      $$SemesterTableTableFilterComposer,
      $$SemesterTableTableOrderingComposer,
      $$SemesterTableTableAnnotationComposer,
      $$SemesterTableTableCreateCompanionBuilder,
      $$SemesterTableTableUpdateCompanionBuilder,
      (SemesterTableData, $$SemesterTableTableReferences),
      SemesterTableData,
      PrefetchHooks Function({
        bool timetableTableRefs,
        bool fullAttendanceTableRefs,
        bool attendanceTableRefs,
        bool examScheduleTableRefs,
        bool marksTableRefs,
      })
    >;
typedef $$TimetableTableTableCreateCompanionBuilder =
    TimetableTableCompanion Function({
      required int serial,
      required String day,
      required String slot,
      required String courseCode,
      required String courseType,
      required String courseName,
      required String roomNo,
      required String block,
      required String startTime,
      required String endTime,
      required String semId,
      required int time,
      Value<int> rowid,
    });
typedef $$TimetableTableTableUpdateCompanionBuilder =
    TimetableTableCompanion Function({
      Value<int> serial,
      Value<String> day,
      Value<String> slot,
      Value<String> courseCode,
      Value<String> courseType,
      Value<String> courseName,
      Value<String> roomNo,
      Value<String> block,
      Value<String> startTime,
      Value<String> endTime,
      Value<String> semId,
      Value<int> time,
      Value<int> rowid,
    });

final class $$TimetableTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TimetableTableTable,
          TimetableTableData
        > {
  $$TimetableTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SemesterTableTable _semIdTable(_$AppDatabase db) =>
      db.semesterTable.createAlias(
        $_aliasNameGenerator(db.timetableTable.semId, db.semesterTable.semid),
      );

  $$SemesterTableTableProcessedTableManager get semId {
    final $_column = $_itemColumn<String>('sem_id')!;

    final manager = $$SemesterTableTableTableManager(
      $_db,
      $_db.semesterTable,
    ).filter((f) => f.semid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_semIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TimetableTableTableFilterComposer
    extends Composer<_$AppDatabase, $TimetableTableTable> {
  $$TimetableTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseCode => $composableBuilder(
    column: $table.courseCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseType => $composableBuilder(
    column: $table.courseType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseName => $composableBuilder(
    column: $table.courseName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roomNo => $composableBuilder(
    column: $table.roomNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get block => $composableBuilder(
    column: $table.block,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  $$SemesterTableTableFilterComposer get semId {
    final $$SemesterTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semesterTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemesterTableTableFilterComposer(
            $db: $db,
            $table: $db.semesterTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TimetableTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TimetableTableTable> {
  $$TimetableTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseCode => $composableBuilder(
    column: $table.courseCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseType => $composableBuilder(
    column: $table.courseType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseName => $composableBuilder(
    column: $table.courseName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roomNo => $composableBuilder(
    column: $table.roomNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get block => $composableBuilder(
    column: $table.block,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  $$SemesterTableTableOrderingComposer get semId {
    final $$SemesterTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semesterTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemesterTableTableOrderingComposer(
            $db: $db,
            $table: $db.semesterTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TimetableTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TimetableTableTable> {
  $$TimetableTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get serial =>
      $composableBuilder(column: $table.serial, builder: (column) => column);

  GeneratedColumn<String> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumn<String> get slot =>
      $composableBuilder(column: $table.slot, builder: (column) => column);

  GeneratedColumn<String> get courseCode => $composableBuilder(
    column: $table.courseCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get courseType => $composableBuilder(
    column: $table.courseType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get courseName => $composableBuilder(
    column: $table.courseName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get roomNo =>
      $composableBuilder(column: $table.roomNo, builder: (column) => column);

  GeneratedColumn<String> get block =>
      $composableBuilder(column: $table.block, builder: (column) => column);

  GeneratedColumn<String> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<String> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<int> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  $$SemesterTableTableAnnotationComposer get semId {
    final $$SemesterTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semesterTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemesterTableTableAnnotationComposer(
            $db: $db,
            $table: $db.semesterTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TimetableTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TimetableTableTable,
          TimetableTableData,
          $$TimetableTableTableFilterComposer,
          $$TimetableTableTableOrderingComposer,
          $$TimetableTableTableAnnotationComposer,
          $$TimetableTableTableCreateCompanionBuilder,
          $$TimetableTableTableUpdateCompanionBuilder,
          (TimetableTableData, $$TimetableTableTableReferences),
          TimetableTableData,
          PrefetchHooks Function({bool semId})
        > {
  $$TimetableTableTableTableManager(
    _$AppDatabase db,
    $TimetableTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TimetableTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$TimetableTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$TimetableTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> serial = const Value.absent(),
                Value<String> day = const Value.absent(),
                Value<String> slot = const Value.absent(),
                Value<String> courseCode = const Value.absent(),
                Value<String> courseType = const Value.absent(),
                Value<String> courseName = const Value.absent(),
                Value<String> roomNo = const Value.absent(),
                Value<String> block = const Value.absent(),
                Value<String> startTime = const Value.absent(),
                Value<String> endTime = const Value.absent(),
                Value<String> semId = const Value.absent(),
                Value<int> time = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TimetableTableCompanion(
                serial: serial,
                day: day,
                slot: slot,
                courseCode: courseCode,
                courseType: courseType,
                courseName: courseName,
                roomNo: roomNo,
                block: block,
                startTime: startTime,
                endTime: endTime,
                semId: semId,
                time: time,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int serial,
                required String day,
                required String slot,
                required String courseCode,
                required String courseType,
                required String courseName,
                required String roomNo,
                required String block,
                required String startTime,
                required String endTime,
                required String semId,
                required int time,
                Value<int> rowid = const Value.absent(),
              }) => TimetableTableCompanion.insert(
                serial: serial,
                day: day,
                slot: slot,
                courseCode: courseCode,
                courseType: courseType,
                courseName: courseName,
                roomNo: roomNo,
                block: block,
                startTime: startTime,
                endTime: endTime,
                semId: semId,
                time: time,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$TimetableTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({semId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (semId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.semId,
                            referencedTable: $$TimetableTableTableReferences
                                ._semIdTable(db),
                            referencedColumn:
                                $$TimetableTableTableReferences
                                    ._semIdTable(db)
                                    .semid,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TimetableTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TimetableTableTable,
      TimetableTableData,
      $$TimetableTableTableFilterComposer,
      $$TimetableTableTableOrderingComposer,
      $$TimetableTableTableAnnotationComposer,
      $$TimetableTableTableCreateCompanionBuilder,
      $$TimetableTableTableUpdateCompanionBuilder,
      (TimetableTableData, $$TimetableTableTableReferences),
      TimetableTableData,
      PrefetchHooks Function({bool semId})
    >;
typedef $$FullAttendanceTableTableCreateCompanionBuilder =
    FullAttendanceTableCompanion Function({
      required int serial,
      required String date,
      required String slot,
      required String dayTime,
      required String status,
      required String remark,
      required String courseType,
      required String courseId,
      required String semId,
      required int time,
      Value<int> rowid,
    });
typedef $$FullAttendanceTableTableUpdateCompanionBuilder =
    FullAttendanceTableCompanion Function({
      Value<int> serial,
      Value<String> date,
      Value<String> slot,
      Value<String> dayTime,
      Value<String> status,
      Value<String> remark,
      Value<String> courseType,
      Value<String> courseId,
      Value<String> semId,
      Value<int> time,
      Value<int> rowid,
    });

final class $$FullAttendanceTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $FullAttendanceTableTable,
          FullAttendanceTableData
        > {
  $$FullAttendanceTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SemesterTableTable _semIdTable(_$AppDatabase db) =>
      db.semesterTable.createAlias(
        $_aliasNameGenerator(
          db.fullAttendanceTable.semId,
          db.semesterTable.semid,
        ),
      );

  $$SemesterTableTableProcessedTableManager get semId {
    final $_column = $_itemColumn<String>('sem_id')!;

    final manager = $$SemesterTableTableTableManager(
      $_db,
      $_db.semesterTable,
    ).filter((f) => f.semid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_semIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FullAttendanceTableTableFilterComposer
    extends Composer<_$AppDatabase, $FullAttendanceTableTable> {
  $$FullAttendanceTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dayTime => $composableBuilder(
    column: $table.dayTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseType => $composableBuilder(
    column: $table.courseType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseId => $composableBuilder(
    column: $table.courseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  $$SemesterTableTableFilterComposer get semId {
    final $$SemesterTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semesterTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemesterTableTableFilterComposer(
            $db: $db,
            $table: $db.semesterTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FullAttendanceTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FullAttendanceTableTable> {
  $$FullAttendanceTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dayTime => $composableBuilder(
    column: $table.dayTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseType => $composableBuilder(
    column: $table.courseType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseId => $composableBuilder(
    column: $table.courseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  $$SemesterTableTableOrderingComposer get semId {
    final $$SemesterTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semesterTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemesterTableTableOrderingComposer(
            $db: $db,
            $table: $db.semesterTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FullAttendanceTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FullAttendanceTableTable> {
  $$FullAttendanceTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get serial =>
      $composableBuilder(column: $table.serial, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get slot =>
      $composableBuilder(column: $table.slot, builder: (column) => column);

  GeneratedColumn<String> get dayTime =>
      $composableBuilder(column: $table.dayTime, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get courseType => $composableBuilder(
    column: $table.courseType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get courseId =>
      $composableBuilder(column: $table.courseId, builder: (column) => column);

  GeneratedColumn<int> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  $$SemesterTableTableAnnotationComposer get semId {
    final $$SemesterTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semesterTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemesterTableTableAnnotationComposer(
            $db: $db,
            $table: $db.semesterTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FullAttendanceTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FullAttendanceTableTable,
          FullAttendanceTableData,
          $$FullAttendanceTableTableFilterComposer,
          $$FullAttendanceTableTableOrderingComposer,
          $$FullAttendanceTableTableAnnotationComposer,
          $$FullAttendanceTableTableCreateCompanionBuilder,
          $$FullAttendanceTableTableUpdateCompanionBuilder,
          (FullAttendanceTableData, $$FullAttendanceTableTableReferences),
          FullAttendanceTableData,
          PrefetchHooks Function({bool semId})
        > {
  $$FullAttendanceTableTableTableManager(
    _$AppDatabase db,
    $FullAttendanceTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$FullAttendanceTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$FullAttendanceTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$FullAttendanceTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> serial = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String> slot = const Value.absent(),
                Value<String> dayTime = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> remark = const Value.absent(),
                Value<String> courseType = const Value.absent(),
                Value<String> courseId = const Value.absent(),
                Value<String> semId = const Value.absent(),
                Value<int> time = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FullAttendanceTableCompanion(
                serial: serial,
                date: date,
                slot: slot,
                dayTime: dayTime,
                status: status,
                remark: remark,
                courseType: courseType,
                courseId: courseId,
                semId: semId,
                time: time,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int serial,
                required String date,
                required String slot,
                required String dayTime,
                required String status,
                required String remark,
                required String courseType,
                required String courseId,
                required String semId,
                required int time,
                Value<int> rowid = const Value.absent(),
              }) => FullAttendanceTableCompanion.insert(
                serial: serial,
                date: date,
                slot: slot,
                dayTime: dayTime,
                status: status,
                remark: remark,
                courseType: courseType,
                courseId: courseId,
                semId: semId,
                time: time,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$FullAttendanceTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({semId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (semId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.semId,
                            referencedTable:
                                $$FullAttendanceTableTableReferences
                                    ._semIdTable(db),
                            referencedColumn:
                                $$FullAttendanceTableTableReferences
                                    ._semIdTable(db)
                                    .semid,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FullAttendanceTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FullAttendanceTableTable,
      FullAttendanceTableData,
      $$FullAttendanceTableTableFilterComposer,
      $$FullAttendanceTableTableOrderingComposer,
      $$FullAttendanceTableTableAnnotationComposer,
      $$FullAttendanceTableTableCreateCompanionBuilder,
      $$FullAttendanceTableTableUpdateCompanionBuilder,
      (FullAttendanceTableData, $$FullAttendanceTableTableReferences),
      FullAttendanceTableData,
      PrefetchHooks Function({bool semId})
    >;
typedef $$AttendanceTableTableCreateCompanionBuilder =
    AttendanceTableCompanion Function({
      required int serial,
      required String category,
      required String courseName,
      required String courseCode,
      required String courseType,
      required String facultyDetail,
      required String classesAttended,
      required String totalClasses,
      required String attendancePercentage,
      required String attendenceFatCat,
      required String debarStatus,
      required String courseId,
      required String semId,
      required int time,
      Value<int> rowid,
    });
typedef $$AttendanceTableTableUpdateCompanionBuilder =
    AttendanceTableCompanion Function({
      Value<int> serial,
      Value<String> category,
      Value<String> courseName,
      Value<String> courseCode,
      Value<String> courseType,
      Value<String> facultyDetail,
      Value<String> classesAttended,
      Value<String> totalClasses,
      Value<String> attendancePercentage,
      Value<String> attendenceFatCat,
      Value<String> debarStatus,
      Value<String> courseId,
      Value<String> semId,
      Value<int> time,
      Value<int> rowid,
    });

final class $$AttendanceTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AttendanceTableTable,
          AttendanceTableData
        > {
  $$AttendanceTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SemesterTableTable _semIdTable(_$AppDatabase db) =>
      db.semesterTable.createAlias(
        $_aliasNameGenerator(db.attendanceTable.semId, db.semesterTable.semid),
      );

  $$SemesterTableTableProcessedTableManager get semId {
    final $_column = $_itemColumn<String>('sem_id')!;

    final manager = $$SemesterTableTableTableManager(
      $_db,
      $_db.semesterTable,
    ).filter((f) => f.semid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_semIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AttendanceTableTableFilterComposer
    extends Composer<_$AppDatabase, $AttendanceTableTable> {
  $$AttendanceTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseName => $composableBuilder(
    column: $table.courseName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseCode => $composableBuilder(
    column: $table.courseCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseType => $composableBuilder(
    column: $table.courseType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get facultyDetail => $composableBuilder(
    column: $table.facultyDetail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get classesAttended => $composableBuilder(
    column: $table.classesAttended,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get totalClasses => $composableBuilder(
    column: $table.totalClasses,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get attendancePercentage => $composableBuilder(
    column: $table.attendancePercentage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get attendenceFatCat => $composableBuilder(
    column: $table.attendenceFatCat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get debarStatus => $composableBuilder(
    column: $table.debarStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseId => $composableBuilder(
    column: $table.courseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  $$SemesterTableTableFilterComposer get semId {
    final $$SemesterTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semesterTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemesterTableTableFilterComposer(
            $db: $db,
            $table: $db.semesterTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendanceTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AttendanceTableTable> {
  $$AttendanceTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseName => $composableBuilder(
    column: $table.courseName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseCode => $composableBuilder(
    column: $table.courseCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseType => $composableBuilder(
    column: $table.courseType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get facultyDetail => $composableBuilder(
    column: $table.facultyDetail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get classesAttended => $composableBuilder(
    column: $table.classesAttended,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get totalClasses => $composableBuilder(
    column: $table.totalClasses,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get attendancePercentage => $composableBuilder(
    column: $table.attendancePercentage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get attendenceFatCat => $composableBuilder(
    column: $table.attendenceFatCat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get debarStatus => $composableBuilder(
    column: $table.debarStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseId => $composableBuilder(
    column: $table.courseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  $$SemesterTableTableOrderingComposer get semId {
    final $$SemesterTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semesterTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemesterTableTableOrderingComposer(
            $db: $db,
            $table: $db.semesterTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendanceTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AttendanceTableTable> {
  $$AttendanceTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get serial =>
      $composableBuilder(column: $table.serial, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get courseName => $composableBuilder(
    column: $table.courseName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get courseCode => $composableBuilder(
    column: $table.courseCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get courseType => $composableBuilder(
    column: $table.courseType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get facultyDetail => $composableBuilder(
    column: $table.facultyDetail,
    builder: (column) => column,
  );

  GeneratedColumn<String> get classesAttended => $composableBuilder(
    column: $table.classesAttended,
    builder: (column) => column,
  );

  GeneratedColumn<String> get totalClasses => $composableBuilder(
    column: $table.totalClasses,
    builder: (column) => column,
  );

  GeneratedColumn<String> get attendancePercentage => $composableBuilder(
    column: $table.attendancePercentage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get attendenceFatCat => $composableBuilder(
    column: $table.attendenceFatCat,
    builder: (column) => column,
  );

  GeneratedColumn<String> get debarStatus => $composableBuilder(
    column: $table.debarStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get courseId =>
      $composableBuilder(column: $table.courseId, builder: (column) => column);

  GeneratedColumn<int> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  $$SemesterTableTableAnnotationComposer get semId {
    final $$SemesterTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semesterTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemesterTableTableAnnotationComposer(
            $db: $db,
            $table: $db.semesterTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendanceTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AttendanceTableTable,
          AttendanceTableData,
          $$AttendanceTableTableFilterComposer,
          $$AttendanceTableTableOrderingComposer,
          $$AttendanceTableTableAnnotationComposer,
          $$AttendanceTableTableCreateCompanionBuilder,
          $$AttendanceTableTableUpdateCompanionBuilder,
          (AttendanceTableData, $$AttendanceTableTableReferences),
          AttendanceTableData,
          PrefetchHooks Function({bool semId})
        > {
  $$AttendanceTableTableTableManager(
    _$AppDatabase db,
    $AttendanceTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$AttendanceTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$AttendanceTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$AttendanceTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> serial = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> courseName = const Value.absent(),
                Value<String> courseCode = const Value.absent(),
                Value<String> courseType = const Value.absent(),
                Value<String> facultyDetail = const Value.absent(),
                Value<String> classesAttended = const Value.absent(),
                Value<String> totalClasses = const Value.absent(),
                Value<String> attendancePercentage = const Value.absent(),
                Value<String> attendenceFatCat = const Value.absent(),
                Value<String> debarStatus = const Value.absent(),
                Value<String> courseId = const Value.absent(),
                Value<String> semId = const Value.absent(),
                Value<int> time = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AttendanceTableCompanion(
                serial: serial,
                category: category,
                courseName: courseName,
                courseCode: courseCode,
                courseType: courseType,
                facultyDetail: facultyDetail,
                classesAttended: classesAttended,
                totalClasses: totalClasses,
                attendancePercentage: attendancePercentage,
                attendenceFatCat: attendenceFatCat,
                debarStatus: debarStatus,
                courseId: courseId,
                semId: semId,
                time: time,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int serial,
                required String category,
                required String courseName,
                required String courseCode,
                required String courseType,
                required String facultyDetail,
                required String classesAttended,
                required String totalClasses,
                required String attendancePercentage,
                required String attendenceFatCat,
                required String debarStatus,
                required String courseId,
                required String semId,
                required int time,
                Value<int> rowid = const Value.absent(),
              }) => AttendanceTableCompanion.insert(
                serial: serial,
                category: category,
                courseName: courseName,
                courseCode: courseCode,
                courseType: courseType,
                facultyDetail: facultyDetail,
                classesAttended: classesAttended,
                totalClasses: totalClasses,
                attendancePercentage: attendancePercentage,
                attendenceFatCat: attendenceFatCat,
                debarStatus: debarStatus,
                courseId: courseId,
                semId: semId,
                time: time,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$AttendanceTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({semId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (semId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.semId,
                            referencedTable: $$AttendanceTableTableReferences
                                ._semIdTable(db),
                            referencedColumn:
                                $$AttendanceTableTableReferences
                                    ._semIdTable(db)
                                    .semid,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AttendanceTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AttendanceTableTable,
      AttendanceTableData,
      $$AttendanceTableTableFilterComposer,
      $$AttendanceTableTableOrderingComposer,
      $$AttendanceTableTableAnnotationComposer,
      $$AttendanceTableTableCreateCompanionBuilder,
      $$AttendanceTableTableUpdateCompanionBuilder,
      (AttendanceTableData, $$AttendanceTableTableReferences),
      AttendanceTableData,
      PrefetchHooks Function({bool semId})
    >;
typedef $$ExamScheduleTableTableCreateCompanionBuilder =
    ExamScheduleTableCompanion Function({
      required int serial,
      required String slot,
      required String courseName,
      required String courseCode,
      required String courseType,
      required String courseId,
      required String examType,
      required String examDate,
      required String examSession,
      required String reportingTime,
      required String examTime,
      required String venue,
      required String seatLocation,
      required String seatNo,
      required String semId,
      required int time,
      Value<int> rowid,
    });
typedef $$ExamScheduleTableTableUpdateCompanionBuilder =
    ExamScheduleTableCompanion Function({
      Value<int> serial,
      Value<String> slot,
      Value<String> courseName,
      Value<String> courseCode,
      Value<String> courseType,
      Value<String> courseId,
      Value<String> examType,
      Value<String> examDate,
      Value<String> examSession,
      Value<String> reportingTime,
      Value<String> examTime,
      Value<String> venue,
      Value<String> seatLocation,
      Value<String> seatNo,
      Value<String> semId,
      Value<int> time,
      Value<int> rowid,
    });

final class $$ExamScheduleTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ExamScheduleTableTable,
          ExamScheduleTableData
        > {
  $$ExamScheduleTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SemesterTableTable _semIdTable(_$AppDatabase db) =>
      db.semesterTable.createAlias(
        $_aliasNameGenerator(
          db.examScheduleTable.semId,
          db.semesterTable.semid,
        ),
      );

  $$SemesterTableTableProcessedTableManager get semId {
    final $_column = $_itemColumn<String>('sem_id')!;

    final manager = $$SemesterTableTableTableManager(
      $_db,
      $_db.semesterTable,
    ).filter((f) => f.semid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_semIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ExamScheduleTableTableFilterComposer
    extends Composer<_$AppDatabase, $ExamScheduleTableTable> {
  $$ExamScheduleTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseName => $composableBuilder(
    column: $table.courseName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseCode => $composableBuilder(
    column: $table.courseCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseType => $composableBuilder(
    column: $table.courseType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseId => $composableBuilder(
    column: $table.courseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get examType => $composableBuilder(
    column: $table.examType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get examDate => $composableBuilder(
    column: $table.examDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get examSession => $composableBuilder(
    column: $table.examSession,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reportingTime => $composableBuilder(
    column: $table.reportingTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get examTime => $composableBuilder(
    column: $table.examTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get venue => $composableBuilder(
    column: $table.venue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get seatLocation => $composableBuilder(
    column: $table.seatLocation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get seatNo => $composableBuilder(
    column: $table.seatNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  $$SemesterTableTableFilterComposer get semId {
    final $$SemesterTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semesterTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemesterTableTableFilterComposer(
            $db: $db,
            $table: $db.semesterTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExamScheduleTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ExamScheduleTableTable> {
  $$ExamScheduleTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseName => $composableBuilder(
    column: $table.courseName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseCode => $composableBuilder(
    column: $table.courseCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseType => $composableBuilder(
    column: $table.courseType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseId => $composableBuilder(
    column: $table.courseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get examType => $composableBuilder(
    column: $table.examType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get examDate => $composableBuilder(
    column: $table.examDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get examSession => $composableBuilder(
    column: $table.examSession,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reportingTime => $composableBuilder(
    column: $table.reportingTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get examTime => $composableBuilder(
    column: $table.examTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get venue => $composableBuilder(
    column: $table.venue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get seatLocation => $composableBuilder(
    column: $table.seatLocation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get seatNo => $composableBuilder(
    column: $table.seatNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  $$SemesterTableTableOrderingComposer get semId {
    final $$SemesterTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semesterTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemesterTableTableOrderingComposer(
            $db: $db,
            $table: $db.semesterTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExamScheduleTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExamScheduleTableTable> {
  $$ExamScheduleTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get serial =>
      $composableBuilder(column: $table.serial, builder: (column) => column);

  GeneratedColumn<String> get slot =>
      $composableBuilder(column: $table.slot, builder: (column) => column);

  GeneratedColumn<String> get courseName => $composableBuilder(
    column: $table.courseName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get courseCode => $composableBuilder(
    column: $table.courseCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get courseType => $composableBuilder(
    column: $table.courseType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get courseId =>
      $composableBuilder(column: $table.courseId, builder: (column) => column);

  GeneratedColumn<String> get examType =>
      $composableBuilder(column: $table.examType, builder: (column) => column);

  GeneratedColumn<String> get examDate =>
      $composableBuilder(column: $table.examDate, builder: (column) => column);

  GeneratedColumn<String> get examSession => $composableBuilder(
    column: $table.examSession,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reportingTime => $composableBuilder(
    column: $table.reportingTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get examTime =>
      $composableBuilder(column: $table.examTime, builder: (column) => column);

  GeneratedColumn<String> get venue =>
      $composableBuilder(column: $table.venue, builder: (column) => column);

  GeneratedColumn<String> get seatLocation => $composableBuilder(
    column: $table.seatLocation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get seatNo =>
      $composableBuilder(column: $table.seatNo, builder: (column) => column);

  GeneratedColumn<int> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  $$SemesterTableTableAnnotationComposer get semId {
    final $$SemesterTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semesterTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemesterTableTableAnnotationComposer(
            $db: $db,
            $table: $db.semesterTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExamScheduleTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExamScheduleTableTable,
          ExamScheduleTableData,
          $$ExamScheduleTableTableFilterComposer,
          $$ExamScheduleTableTableOrderingComposer,
          $$ExamScheduleTableTableAnnotationComposer,
          $$ExamScheduleTableTableCreateCompanionBuilder,
          $$ExamScheduleTableTableUpdateCompanionBuilder,
          (ExamScheduleTableData, $$ExamScheduleTableTableReferences),
          ExamScheduleTableData,
          PrefetchHooks Function({bool semId})
        > {
  $$ExamScheduleTableTableTableManager(
    _$AppDatabase db,
    $ExamScheduleTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ExamScheduleTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$ExamScheduleTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$ExamScheduleTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> serial = const Value.absent(),
                Value<String> slot = const Value.absent(),
                Value<String> courseName = const Value.absent(),
                Value<String> courseCode = const Value.absent(),
                Value<String> courseType = const Value.absent(),
                Value<String> courseId = const Value.absent(),
                Value<String> examType = const Value.absent(),
                Value<String> examDate = const Value.absent(),
                Value<String> examSession = const Value.absent(),
                Value<String> reportingTime = const Value.absent(),
                Value<String> examTime = const Value.absent(),
                Value<String> venue = const Value.absent(),
                Value<String> seatLocation = const Value.absent(),
                Value<String> seatNo = const Value.absent(),
                Value<String> semId = const Value.absent(),
                Value<int> time = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExamScheduleTableCompanion(
                serial: serial,
                slot: slot,
                courseName: courseName,
                courseCode: courseCode,
                courseType: courseType,
                courseId: courseId,
                examType: examType,
                examDate: examDate,
                examSession: examSession,
                reportingTime: reportingTime,
                examTime: examTime,
                venue: venue,
                seatLocation: seatLocation,
                seatNo: seatNo,
                semId: semId,
                time: time,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int serial,
                required String slot,
                required String courseName,
                required String courseCode,
                required String courseType,
                required String courseId,
                required String examType,
                required String examDate,
                required String examSession,
                required String reportingTime,
                required String examTime,
                required String venue,
                required String seatLocation,
                required String seatNo,
                required String semId,
                required int time,
                Value<int> rowid = const Value.absent(),
              }) => ExamScheduleTableCompanion.insert(
                serial: serial,
                slot: slot,
                courseName: courseName,
                courseCode: courseCode,
                courseType: courseType,
                courseId: courseId,
                examType: examType,
                examDate: examDate,
                examSession: examSession,
                reportingTime: reportingTime,
                examTime: examTime,
                venue: venue,
                seatLocation: seatLocation,
                seatNo: seatNo,
                semId: semId,
                time: time,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ExamScheduleTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({semId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (semId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.semId,
                            referencedTable: $$ExamScheduleTableTableReferences
                                ._semIdTable(db),
                            referencedColumn:
                                $$ExamScheduleTableTableReferences
                                    ._semIdTable(db)
                                    .semid,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ExamScheduleTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExamScheduleTableTable,
      ExamScheduleTableData,
      $$ExamScheduleTableTableFilterComposer,
      $$ExamScheduleTableTableOrderingComposer,
      $$ExamScheduleTableTableAnnotationComposer,
      $$ExamScheduleTableTableCreateCompanionBuilder,
      $$ExamScheduleTableTableUpdateCompanionBuilder,
      (ExamScheduleTableData, $$ExamScheduleTableTableReferences),
      ExamScheduleTableData,
      PrefetchHooks Function({bool semId})
    >;
typedef $$MarksTableTableCreateCompanionBuilder =
    MarksTableCompanion Function({
      required int serial,
      required String courseCode,
      required String courseTitle,
      required String courseType,
      required String faculty,
      required String slot,
      required String marks,
      required String semId,
      required int time,
      Value<int> rowid,
    });
typedef $$MarksTableTableUpdateCompanionBuilder =
    MarksTableCompanion Function({
      Value<int> serial,
      Value<String> courseCode,
      Value<String> courseTitle,
      Value<String> courseType,
      Value<String> faculty,
      Value<String> slot,
      Value<String> marks,
      Value<String> semId,
      Value<int> time,
      Value<int> rowid,
    });

final class $$MarksTableTableReferences
    extends BaseReferences<_$AppDatabase, $MarksTableTable, MarksTableData> {
  $$MarksTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SemesterTableTable _semIdTable(_$AppDatabase db) =>
      db.semesterTable.createAlias(
        $_aliasNameGenerator(db.marksTable.semId, db.semesterTable.semid),
      );

  $$SemesterTableTableProcessedTableManager get semId {
    final $_column = $_itemColumn<String>('sem_id')!;

    final manager = $$SemesterTableTableTableManager(
      $_db,
      $_db.semesterTable,
    ).filter((f) => f.semid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_semIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MarksTableTableFilterComposer
    extends Composer<_$AppDatabase, $MarksTableTable> {
  $$MarksTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseCode => $composableBuilder(
    column: $table.courseCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseTitle => $composableBuilder(
    column: $table.courseTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseType => $composableBuilder(
    column: $table.courseType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get faculty => $composableBuilder(
    column: $table.faculty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get marks => $composableBuilder(
    column: $table.marks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  $$SemesterTableTableFilterComposer get semId {
    final $$SemesterTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semesterTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemesterTableTableFilterComposer(
            $db: $db,
            $table: $db.semesterTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MarksTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MarksTableTable> {
  $$MarksTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseCode => $composableBuilder(
    column: $table.courseCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseTitle => $composableBuilder(
    column: $table.courseTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseType => $composableBuilder(
    column: $table.courseType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get faculty => $composableBuilder(
    column: $table.faculty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get marks => $composableBuilder(
    column: $table.marks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  $$SemesterTableTableOrderingComposer get semId {
    final $$SemesterTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semesterTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemesterTableTableOrderingComposer(
            $db: $db,
            $table: $db.semesterTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MarksTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MarksTableTable> {
  $$MarksTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get serial =>
      $composableBuilder(column: $table.serial, builder: (column) => column);

  GeneratedColumn<String> get courseCode => $composableBuilder(
    column: $table.courseCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get courseTitle => $composableBuilder(
    column: $table.courseTitle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get courseType => $composableBuilder(
    column: $table.courseType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get faculty =>
      $composableBuilder(column: $table.faculty, builder: (column) => column);

  GeneratedColumn<String> get slot =>
      $composableBuilder(column: $table.slot, builder: (column) => column);

  GeneratedColumn<String> get marks =>
      $composableBuilder(column: $table.marks, builder: (column) => column);

  GeneratedColumn<int> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  $$SemesterTableTableAnnotationComposer get semId {
    final $$SemesterTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semesterTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemesterTableTableAnnotationComposer(
            $db: $db,
            $table: $db.semesterTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MarksTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MarksTableTable,
          MarksTableData,
          $$MarksTableTableFilterComposer,
          $$MarksTableTableOrderingComposer,
          $$MarksTableTableAnnotationComposer,
          $$MarksTableTableCreateCompanionBuilder,
          $$MarksTableTableUpdateCompanionBuilder,
          (MarksTableData, $$MarksTableTableReferences),
          MarksTableData,
          PrefetchHooks Function({bool semId})
        > {
  $$MarksTableTableTableManager(_$AppDatabase db, $MarksTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$MarksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$MarksTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$MarksTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> serial = const Value.absent(),
                Value<String> courseCode = const Value.absent(),
                Value<String> courseTitle = const Value.absent(),
                Value<String> courseType = const Value.absent(),
                Value<String> faculty = const Value.absent(),
                Value<String> slot = const Value.absent(),
                Value<String> marks = const Value.absent(),
                Value<String> semId = const Value.absent(),
                Value<int> time = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MarksTableCompanion(
                serial: serial,
                courseCode: courseCode,
                courseTitle: courseTitle,
                courseType: courseType,
                faculty: faculty,
                slot: slot,
                marks: marks,
                semId: semId,
                time: time,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int serial,
                required String courseCode,
                required String courseTitle,
                required String courseType,
                required String faculty,
                required String slot,
                required String marks,
                required String semId,
                required int time,
                Value<int> rowid = const Value.absent(),
              }) => MarksTableCompanion.insert(
                serial: serial,
                courseCode: courseCode,
                courseTitle: courseTitle,
                courseType: courseType,
                faculty: faculty,
                slot: slot,
                marks: marks,
                semId: semId,
                time: time,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$MarksTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({semId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (semId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.semId,
                            referencedTable: $$MarksTableTableReferences
                                ._semIdTable(db),
                            referencedColumn:
                                $$MarksTableTableReferences
                                    ._semIdTable(db)
                                    .semid,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MarksTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MarksTableTable,
      MarksTableData,
      $$MarksTableTableFilterComposer,
      $$MarksTableTableOrderingComposer,
      $$MarksTableTableAnnotationComposer,
      $$MarksTableTableCreateCompanionBuilder,
      $$MarksTableTableUpdateCompanionBuilder,
      (MarksTableData, $$MarksTableTableReferences),
      MarksTableData,
      PrefetchHooks Function({bool semId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SemesterTableTableTableManager get semesterTable =>
      $$SemesterTableTableTableManager(_db, _db.semesterTable);
  $$TimetableTableTableTableManager get timetableTable =>
      $$TimetableTableTableTableManager(_db, _db.timetableTable);
  $$FullAttendanceTableTableTableManager get fullAttendanceTable =>
      $$FullAttendanceTableTableTableManager(_db, _db.fullAttendanceTable);
  $$AttendanceTableTableTableManager get attendanceTable =>
      $$AttendanceTableTableTableManager(_db, _db.attendanceTable);
  $$ExamScheduleTableTableTableManager get examScheduleTable =>
      $$ExamScheduleTableTableTableManager(_db, _db.examScheduleTable);
  $$MarksTableTableTableManager get marksTable =>
      $$MarksTableTableTableManager(_db, _db.marksTable);
}
