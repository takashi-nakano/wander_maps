// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DestinationRecord extends DataClass
    implements Insertable<DestinationRecord> {
  final int id;
  final String destinationName;
  final double latitude;
  final double longitude;
  final DateTime createDate;
  DestinationRecord(
      {required this.id,
      required this.destinationName,
      required this.latitude,
      required this.longitude,
      required this.createDate});
  factory DestinationRecord.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DestinationRecord(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      destinationName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}destination_name'])!,
      latitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude'])!,
      longitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude'])!,
      createDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}create_date'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['destination_name'] = Variable<String>(destinationName);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['create_date'] = Variable<DateTime>(createDate);
    return map;
  }

  DestinationRecordsCompanion toCompanion(bool nullToAbsent) {
    return DestinationRecordsCompanion(
      id: Value(id),
      destinationName: Value(destinationName),
      latitude: Value(latitude),
      longitude: Value(longitude),
      createDate: Value(createDate),
    );
  }

  factory DestinationRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DestinationRecord(
      id: serializer.fromJson<int>(json['id']),
      destinationName: serializer.fromJson<String>(json['destinationName']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      createDate: serializer.fromJson<DateTime>(json['createDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'destinationName': serializer.toJson<String>(destinationName),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'createDate': serializer.toJson<DateTime>(createDate),
    };
  }

  DestinationRecord copyWith(
          {int? id,
          String? destinationName,
          double? latitude,
          double? longitude,
          DateTime? createDate}) =>
      DestinationRecord(
        id: id ?? this.id,
        destinationName: destinationName ?? this.destinationName,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        createDate: createDate ?? this.createDate,
      );
  @override
  String toString() {
    return (StringBuffer('DestinationRecord(')
          ..write('id: $id, ')
          ..write('destinationName: $destinationName, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('createDate: $createDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, destinationName, latitude, longitude, createDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DestinationRecord &&
          other.id == this.id &&
          other.destinationName == this.destinationName &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.createDate == this.createDate);
}

class DestinationRecordsCompanion extends UpdateCompanion<DestinationRecord> {
  final Value<int> id;
  final Value<String> destinationName;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<DateTime> createDate;
  const DestinationRecordsCompanion({
    this.id = const Value.absent(),
    this.destinationName = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.createDate = const Value.absent(),
  });
  DestinationRecordsCompanion.insert({
    this.id = const Value.absent(),
    required String destinationName,
    required double latitude,
    required double longitude,
    required DateTime createDate,
  })  : destinationName = Value(destinationName),
        latitude = Value(latitude),
        longitude = Value(longitude),
        createDate = Value(createDate);
  static Insertable<DestinationRecord> custom({
    Expression<int>? id,
    Expression<String>? destinationName,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<DateTime>? createDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (destinationName != null) 'destination_name': destinationName,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (createDate != null) 'create_date': createDate,
    });
  }

  DestinationRecordsCompanion copyWith(
      {Value<int>? id,
      Value<String>? destinationName,
      Value<double>? latitude,
      Value<double>? longitude,
      Value<DateTime>? createDate}) {
    return DestinationRecordsCompanion(
      id: id ?? this.id,
      destinationName: destinationName ?? this.destinationName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      createDate: createDate ?? this.createDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (destinationName.present) {
      map['destination_name'] = Variable<String>(destinationName.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (createDate.present) {
      map['create_date'] = Variable<DateTime>(createDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DestinationRecordsCompanion(')
          ..write('id: $id, ')
          ..write('destinationName: $destinationName, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('createDate: $createDate')
          ..write(')'))
        .toString();
  }
}

class $DestinationRecordsTable extends DestinationRecords
    with TableInfo<$DestinationRecordsTable, DestinationRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DestinationRecordsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _destinationNameMeta =
      const VerificationMeta('destinationName');
  @override
  late final GeneratedColumn<String?> destinationName =
      GeneratedColumn<String?>('destination_name', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double?> latitude = GeneratedColumn<double?>(
      'latitude', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double?> longitude = GeneratedColumn<double?>(
      'longitude', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _createDateMeta = const VerificationMeta('createDate');
  @override
  late final GeneratedColumn<DateTime?> createDate = GeneratedColumn<DateTime?>(
      'create_date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, destinationName, latitude, longitude, createDate];
  @override
  String get aliasedName => _alias ?? 'destination_records';
  @override
  String get actualTableName => 'destination_records';
  @override
  VerificationContext validateIntegrity(Insertable<DestinationRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('destination_name')) {
      context.handle(
          _destinationNameMeta,
          destinationName.isAcceptableOrUnknown(
              data['destination_name']!, _destinationNameMeta));
    } else if (isInserting) {
      context.missing(_destinationNameMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('create_date')) {
      context.handle(
          _createDateMeta,
          createDate.isAcceptableOrUnknown(
              data['create_date']!, _createDateMeta));
    } else if (isInserting) {
      context.missing(_createDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DestinationRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DestinationRecord.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DestinationRecordsTable createAlias(String alias) {
    return $DestinationRecordsTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $DestinationRecordsTable destinationRecords =
      $DestinationRecordsTable(this);
  late final DestinationDao destinationDao = DestinationDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [destinationRecords];
}
