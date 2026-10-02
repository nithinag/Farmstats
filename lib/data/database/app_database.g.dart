// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ExpenseCategoriesTableTable extends ExpenseCategoriesTable
    with TableInfo<$ExpenseCategoriesTableTable, ExpenseCategoryDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpenseCategoriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorCodeMeta =
      const VerificationMeta('colorCode');
  @override
  late final GeneratedColumn<String> colorCode = GeneratedColumn<String>(
      'color_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconNameMeta =
      const VerificationMeta('iconName');
  @override
  late final GeneratedColumn<String> iconName = GeneratedColumn<String>(
      'icon_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, colorCode, iconName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expense_categories_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ExpenseCategoryDbModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color_code')) {
      context.handle(_colorCodeMeta,
          colorCode.isAcceptableOrUnknown(data['color_code']!, _colorCodeMeta));
    } else if (isInserting) {
      context.missing(_colorCodeMeta);
    }
    if (data.containsKey('icon_name')) {
      context.handle(_iconNameMeta,
          iconName.isAcceptableOrUnknown(data['icon_name']!, _iconNameMeta));
    } else if (isInserting) {
      context.missing(_iconNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExpenseCategoryDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpenseCategoryDbModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      colorCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color_code'])!,
      iconName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_name'])!,
    );
  }

  @override
  $ExpenseCategoriesTableTable createAlias(String alias) {
    return $ExpenseCategoriesTableTable(attachedDatabase, alias);
  }
}

class ExpenseCategoryDbModel extends DataClass
    implements Insertable<ExpenseCategoryDbModel> {
  final String id;
  final String name;
  final String colorCode;
  final String iconName;
  const ExpenseCategoryDbModel(
      {required this.id,
      required this.name,
      required this.colorCode,
      required this.iconName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['color_code'] = Variable<String>(colorCode);
    map['icon_name'] = Variable<String>(iconName);
    return map;
  }

  ExpenseCategoriesTableCompanion toCompanion(bool nullToAbsent) {
    return ExpenseCategoriesTableCompanion(
      id: Value(id),
      name: Value(name),
      colorCode: Value(colorCode),
      iconName: Value(iconName),
    );
  }

  factory ExpenseCategoryDbModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpenseCategoryDbModel(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      colorCode: serializer.fromJson<String>(json['colorCode']),
      iconName: serializer.fromJson<String>(json['iconName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'colorCode': serializer.toJson<String>(colorCode),
      'iconName': serializer.toJson<String>(iconName),
    };
  }

  ExpenseCategoryDbModel copyWith(
          {String? id, String? name, String? colorCode, String? iconName}) =>
      ExpenseCategoryDbModel(
        id: id ?? this.id,
        name: name ?? this.name,
        colorCode: colorCode ?? this.colorCode,
        iconName: iconName ?? this.iconName,
      );
  ExpenseCategoryDbModel copyWithCompanion(
      ExpenseCategoriesTableCompanion data) {
    return ExpenseCategoryDbModel(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      colorCode: data.colorCode.present ? data.colorCode.value : this.colorCode,
      iconName: data.iconName.present ? data.iconName.value : this.iconName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseCategoryDbModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorCode: $colorCode, ')
          ..write('iconName: $iconName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, colorCode, iconName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseCategoryDbModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.colorCode == this.colorCode &&
          other.iconName == this.iconName);
}

class ExpenseCategoriesTableCompanion
    extends UpdateCompanion<ExpenseCategoryDbModel> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> colorCode;
  final Value<String> iconName;
  final Value<int> rowid;
  const ExpenseCategoriesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.colorCode = const Value.absent(),
    this.iconName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExpenseCategoriesTableCompanion.insert({
    required String id,
    required String name,
    required String colorCode,
    required String iconName,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        colorCode = Value(colorCode),
        iconName = Value(iconName);
  static Insertable<ExpenseCategoryDbModel> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? colorCode,
    Expression<String>? iconName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (colorCode != null) 'color_code': colorCode,
      if (iconName != null) 'icon_name': iconName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExpenseCategoriesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? colorCode,
      Value<String>? iconName,
      Value<int>? rowid}) {
    return ExpenseCategoriesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      colorCode: colorCode ?? this.colorCode,
      iconName: iconName ?? this.iconName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (colorCode.present) {
      map['color_code'] = Variable<String>(colorCode.value);
    }
    if (iconName.present) {
      map['icon_name'] = Variable<String>(iconName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseCategoriesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorCode: $colorCode, ')
          ..write('iconName: $iconName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BatchesTableTable extends BatchesTable
    with TableInfo<$BatchesTableTable, BatchDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BatchesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _batchNameMeta =
      const VerificationMeta('batchName');
  @override
  late final GeneratedColumn<String> batchName = GeneratedColumn<String>(
      'batch_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _expectedHarvestDateMeta =
      const VerificationMeta('expectedHarvestDate');
  @override
  late final GeneratedColumn<DateTime> expectedHarvestDate =
      GeneratedColumn<DateTime>('expected_harvest_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _actualHarvestDateMeta =
      const VerificationMeta('actualHarvestDate');
  @override
  late final GeneratedColumn<DateTime> actualHarvestDate =
      GeneratedColumn<DateTime>('actual_harvest_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _silkwormVarietyMeta =
      const VerificationMeta('silkwormVariety');
  @override
  late final GeneratedColumn<String> silkwormVariety = GeneratedColumn<String>(
      'silkworm_variety', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _eggSourceMeta =
      const VerificationMeta('eggSource');
  @override
  late final GeneratedColumn<String> eggSource = GeneratedColumn<String>(
      'egg_source', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _numberOfDflsMeta =
      const VerificationMeta('numberOfDfls');
  @override
  late final GeneratedColumn<int> numberOfDfls = GeneratedColumn<int>(
      'number_of_dfls', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dflPriceMeta =
      const VerificationMeta('dflPrice');
  @override
  late final GeneratedColumn<double> dflPrice = GeneratedColumn<double>(
      'dfl_price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _mulberryVarietyMeta =
      const VerificationMeta('mulberryVariety');
  @override
  late final GeneratedColumn<String> mulberryVariety = GeneratedColumn<String>(
      'mulberry_variety', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _rearingHouseMeta =
      const VerificationMeta('rearingHouse');
  @override
  late final GeneratedColumn<String> rearingHouse = GeneratedColumn<String>(
      'rearing_house', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currentStageMeta =
      const VerificationMeta('currentStage');
  @override
  late final GeneratedColumn<String> currentStage = GeneratedColumn<String>(
      'current_stage', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currentAgeDaysMeta =
      const VerificationMeta('currentAgeDays');
  @override
  late final GeneratedColumn<int> currentAgeDays = GeneratedColumn<int>(
      'current_age_days', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _healthStatusMeta =
      const VerificationMeta('healthStatus');
  @override
  late final GeneratedColumn<String> healthStatus = GeneratedColumn<String>(
      'health_status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _temperatureMeta =
      const VerificationMeta('temperature');
  @override
  late final GeneratedColumn<double> temperature = GeneratedColumn<double>(
      'temperature', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _humidityMeta =
      const VerificationMeta('humidity');
  @override
  late final GeneratedColumn<double> humidity = GeneratedColumn<double>(
      'humidity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        batchName,
        startDate,
        expectedHarvestDate,
        actualHarvestDate,
        silkwormVariety,
        eggSource,
        numberOfDfls,
        dflPrice,
        mulberryVariety,
        rearingHouse,
        currentStage,
        currentAgeDays,
        status,
        healthStatus,
        temperature,
        humidity,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'batches_table';
  @override
  VerificationContext validateIntegrity(Insertable<BatchDbModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('batch_name')) {
      context.handle(_batchNameMeta,
          batchName.isAcceptableOrUnknown(data['batch_name']!, _batchNameMeta));
    } else if (isInserting) {
      context.missing(_batchNameMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('expected_harvest_date')) {
      context.handle(
          _expectedHarvestDateMeta,
          expectedHarvestDate.isAcceptableOrUnknown(
              data['expected_harvest_date']!, _expectedHarvestDateMeta));
    } else if (isInserting) {
      context.missing(_expectedHarvestDateMeta);
    }
    if (data.containsKey('actual_harvest_date')) {
      context.handle(
          _actualHarvestDateMeta,
          actualHarvestDate.isAcceptableOrUnknown(
              data['actual_harvest_date']!, _actualHarvestDateMeta));
    }
    if (data.containsKey('silkworm_variety')) {
      context.handle(
          _silkwormVarietyMeta,
          silkwormVariety.isAcceptableOrUnknown(
              data['silkworm_variety']!, _silkwormVarietyMeta));
    } else if (isInserting) {
      context.missing(_silkwormVarietyMeta);
    }
    if (data.containsKey('egg_source')) {
      context.handle(_eggSourceMeta,
          eggSource.isAcceptableOrUnknown(data['egg_source']!, _eggSourceMeta));
    } else if (isInserting) {
      context.missing(_eggSourceMeta);
    }
    if (data.containsKey('number_of_dfls')) {
      context.handle(
          _numberOfDflsMeta,
          numberOfDfls.isAcceptableOrUnknown(
              data['number_of_dfls']!, _numberOfDflsMeta));
    } else if (isInserting) {
      context.missing(_numberOfDflsMeta);
    }
    if (data.containsKey('dfl_price')) {
      context.handle(_dflPriceMeta,
          dflPrice.isAcceptableOrUnknown(data['dfl_price']!, _dflPriceMeta));
    }
    if (data.containsKey('mulberry_variety')) {
      context.handle(
          _mulberryVarietyMeta,
          mulberryVariety.isAcceptableOrUnknown(
              data['mulberry_variety']!, _mulberryVarietyMeta));
    } else if (isInserting) {
      context.missing(_mulberryVarietyMeta);
    }
    if (data.containsKey('rearing_house')) {
      context.handle(
          _rearingHouseMeta,
          rearingHouse.isAcceptableOrUnknown(
              data['rearing_house']!, _rearingHouseMeta));
    } else if (isInserting) {
      context.missing(_rearingHouseMeta);
    }
    if (data.containsKey('current_stage')) {
      context.handle(
          _currentStageMeta,
          currentStage.isAcceptableOrUnknown(
              data['current_stage']!, _currentStageMeta));
    } else if (isInserting) {
      context.missing(_currentStageMeta);
    }
    if (data.containsKey('current_age_days')) {
      context.handle(
          _currentAgeDaysMeta,
          currentAgeDays.isAcceptableOrUnknown(
              data['current_age_days']!, _currentAgeDaysMeta));
    } else if (isInserting) {
      context.missing(_currentAgeDaysMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('health_status')) {
      context.handle(
          _healthStatusMeta,
          healthStatus.isAcceptableOrUnknown(
              data['health_status']!, _healthStatusMeta));
    } else if (isInserting) {
      context.missing(_healthStatusMeta);
    }
    if (data.containsKey('temperature')) {
      context.handle(
          _temperatureMeta,
          temperature.isAcceptableOrUnknown(
              data['temperature']!, _temperatureMeta));
    } else if (isInserting) {
      context.missing(_temperatureMeta);
    }
    if (data.containsKey('humidity')) {
      context.handle(_humidityMeta,
          humidity.isAcceptableOrUnknown(data['humidity']!, _humidityMeta));
    } else if (isInserting) {
      context.missing(_humidityMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BatchDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BatchDbModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      batchName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}batch_name'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      expectedHarvestDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}expected_harvest_date'])!,
      actualHarvestDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}actual_harvest_date']),
      silkwormVariety: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}silkworm_variety'])!,
      eggSource: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}egg_source'])!,
      numberOfDfls: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number_of_dfls'])!,
      dflPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}dfl_price']),
      mulberryVariety: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}mulberry_variety'])!,
      rearingHouse: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rearing_house'])!,
      currentStage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}current_stage'])!,
      currentAgeDays: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_age_days'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      healthStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}health_status'])!,
      temperature: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}temperature'])!,
      humidity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}humidity'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $BatchesTableTable createAlias(String alias) {
    return $BatchesTableTable(attachedDatabase, alias);
  }
}

class BatchDbModel extends DataClass implements Insertable<BatchDbModel> {
  final String id;
  final String batchName;
  final DateTime startDate;
  final DateTime expectedHarvestDate;
  final DateTime? actualHarvestDate;
  final String silkwormVariety;
  final String eggSource;
  final int numberOfDfls;
  final double? dflPrice;
  final String mulberryVariety;
  final String rearingHouse;
  final String currentStage;
  final int currentAgeDays;
  final String status;
  final String healthStatus;
  final double temperature;
  final double humidity;
  final String? notes;
  const BatchDbModel(
      {required this.id,
      required this.batchName,
      required this.startDate,
      required this.expectedHarvestDate,
      this.actualHarvestDate,
      required this.silkwormVariety,
      required this.eggSource,
      required this.numberOfDfls,
      this.dflPrice,
      required this.mulberryVariety,
      required this.rearingHouse,
      required this.currentStage,
      required this.currentAgeDays,
      required this.status,
      required this.healthStatus,
      required this.temperature,
      required this.humidity,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['batch_name'] = Variable<String>(batchName);
    map['start_date'] = Variable<DateTime>(startDate);
    map['expected_harvest_date'] = Variable<DateTime>(expectedHarvestDate);
    if (!nullToAbsent || actualHarvestDate != null) {
      map['actual_harvest_date'] = Variable<DateTime>(actualHarvestDate);
    }
    map['silkworm_variety'] = Variable<String>(silkwormVariety);
    map['egg_source'] = Variable<String>(eggSource);
    map['number_of_dfls'] = Variable<int>(numberOfDfls);
    if (!nullToAbsent || dflPrice != null) {
      map['dfl_price'] = Variable<double>(dflPrice);
    }
    map['mulberry_variety'] = Variable<String>(mulberryVariety);
    map['rearing_house'] = Variable<String>(rearingHouse);
    map['current_stage'] = Variable<String>(currentStage);
    map['current_age_days'] = Variable<int>(currentAgeDays);
    map['status'] = Variable<String>(status);
    map['health_status'] = Variable<String>(healthStatus);
    map['temperature'] = Variable<double>(temperature);
    map['humidity'] = Variable<double>(humidity);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  BatchesTableCompanion toCompanion(bool nullToAbsent) {
    return BatchesTableCompanion(
      id: Value(id),
      batchName: Value(batchName),
      startDate: Value(startDate),
      expectedHarvestDate: Value(expectedHarvestDate),
      actualHarvestDate: actualHarvestDate == null && nullToAbsent
          ? const Value.absent()
          : Value(actualHarvestDate),
      silkwormVariety: Value(silkwormVariety),
      eggSource: Value(eggSource),
      numberOfDfls: Value(numberOfDfls),
      dflPrice: dflPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(dflPrice),
      mulberryVariety: Value(mulberryVariety),
      rearingHouse: Value(rearingHouse),
      currentStage: Value(currentStage),
      currentAgeDays: Value(currentAgeDays),
      status: Value(status),
      healthStatus: Value(healthStatus),
      temperature: Value(temperature),
      humidity: Value(humidity),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory BatchDbModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BatchDbModel(
      id: serializer.fromJson<String>(json['id']),
      batchName: serializer.fromJson<String>(json['batchName']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      expectedHarvestDate:
          serializer.fromJson<DateTime>(json['expectedHarvestDate']),
      actualHarvestDate:
          serializer.fromJson<DateTime?>(json['actualHarvestDate']),
      silkwormVariety: serializer.fromJson<String>(json['silkwormVariety']),
      eggSource: serializer.fromJson<String>(json['eggSource']),
      numberOfDfls: serializer.fromJson<int>(json['numberOfDfls']),
      dflPrice: serializer.fromJson<double?>(json['dflPrice']),
      mulberryVariety: serializer.fromJson<String>(json['mulberryVariety']),
      rearingHouse: serializer.fromJson<String>(json['rearingHouse']),
      currentStage: serializer.fromJson<String>(json['currentStage']),
      currentAgeDays: serializer.fromJson<int>(json['currentAgeDays']),
      status: serializer.fromJson<String>(json['status']),
      healthStatus: serializer.fromJson<String>(json['healthStatus']),
      temperature: serializer.fromJson<double>(json['temperature']),
      humidity: serializer.fromJson<double>(json['humidity']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'batchName': serializer.toJson<String>(batchName),
      'startDate': serializer.toJson<DateTime>(startDate),
      'expectedHarvestDate': serializer.toJson<DateTime>(expectedHarvestDate),
      'actualHarvestDate': serializer.toJson<DateTime?>(actualHarvestDate),
      'silkwormVariety': serializer.toJson<String>(silkwormVariety),
      'eggSource': serializer.toJson<String>(eggSource),
      'numberOfDfls': serializer.toJson<int>(numberOfDfls),
      'dflPrice': serializer.toJson<double?>(dflPrice),
      'mulberryVariety': serializer.toJson<String>(mulberryVariety),
      'rearingHouse': serializer.toJson<String>(rearingHouse),
      'currentStage': serializer.toJson<String>(currentStage),
      'currentAgeDays': serializer.toJson<int>(currentAgeDays),
      'status': serializer.toJson<String>(status),
      'healthStatus': serializer.toJson<String>(healthStatus),
      'temperature': serializer.toJson<double>(temperature),
      'humidity': serializer.toJson<double>(humidity),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  BatchDbModel copyWith(
          {String? id,
          String? batchName,
          DateTime? startDate,
          DateTime? expectedHarvestDate,
          Value<DateTime?> actualHarvestDate = const Value.absent(),
          String? silkwormVariety,
          String? eggSource,
          int? numberOfDfls,
          Value<double?> dflPrice = const Value.absent(),
          String? mulberryVariety,
          String? rearingHouse,
          String? currentStage,
          int? currentAgeDays,
          String? status,
          String? healthStatus,
          double? temperature,
          double? humidity,
          Value<String?> notes = const Value.absent()}) =>
      BatchDbModel(
        id: id ?? this.id,
        batchName: batchName ?? this.batchName,
        startDate: startDate ?? this.startDate,
        expectedHarvestDate: expectedHarvestDate ?? this.expectedHarvestDate,
        actualHarvestDate: actualHarvestDate.present
            ? actualHarvestDate.value
            : this.actualHarvestDate,
        silkwormVariety: silkwormVariety ?? this.silkwormVariety,
        eggSource: eggSource ?? this.eggSource,
        numberOfDfls: numberOfDfls ?? this.numberOfDfls,
        dflPrice: dflPrice.present ? dflPrice.value : this.dflPrice,
        mulberryVariety: mulberryVariety ?? this.mulberryVariety,
        rearingHouse: rearingHouse ?? this.rearingHouse,
        currentStage: currentStage ?? this.currentStage,
        currentAgeDays: currentAgeDays ?? this.currentAgeDays,
        status: status ?? this.status,
        healthStatus: healthStatus ?? this.healthStatus,
        temperature: temperature ?? this.temperature,
        humidity: humidity ?? this.humidity,
        notes: notes.present ? notes.value : this.notes,
      );
  BatchDbModel copyWithCompanion(BatchesTableCompanion data) {
    return BatchDbModel(
      id: data.id.present ? data.id.value : this.id,
      batchName: data.batchName.present ? data.batchName.value : this.batchName,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      expectedHarvestDate: data.expectedHarvestDate.present
          ? data.expectedHarvestDate.value
          : this.expectedHarvestDate,
      actualHarvestDate: data.actualHarvestDate.present
          ? data.actualHarvestDate.value
          : this.actualHarvestDate,
      silkwormVariety: data.silkwormVariety.present
          ? data.silkwormVariety.value
          : this.silkwormVariety,
      eggSource: data.eggSource.present ? data.eggSource.value : this.eggSource,
      numberOfDfls: data.numberOfDfls.present
          ? data.numberOfDfls.value
          : this.numberOfDfls,
      dflPrice: data.dflPrice.present ? data.dflPrice.value : this.dflPrice,
      mulberryVariety: data.mulberryVariety.present
          ? data.mulberryVariety.value
          : this.mulberryVariety,
      rearingHouse: data.rearingHouse.present
          ? data.rearingHouse.value
          : this.rearingHouse,
      currentStage: data.currentStage.present
          ? data.currentStage.value
          : this.currentStage,
      currentAgeDays: data.currentAgeDays.present
          ? data.currentAgeDays.value
          : this.currentAgeDays,
      status: data.status.present ? data.status.value : this.status,
      healthStatus: data.healthStatus.present
          ? data.healthStatus.value
          : this.healthStatus,
      temperature:
          data.temperature.present ? data.temperature.value : this.temperature,
      humidity: data.humidity.present ? data.humidity.value : this.humidity,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BatchDbModel(')
          ..write('id: $id, ')
          ..write('batchName: $batchName, ')
          ..write('startDate: $startDate, ')
          ..write('expectedHarvestDate: $expectedHarvestDate, ')
          ..write('actualHarvestDate: $actualHarvestDate, ')
          ..write('silkwormVariety: $silkwormVariety, ')
          ..write('eggSource: $eggSource, ')
          ..write('numberOfDfls: $numberOfDfls, ')
          ..write('dflPrice: $dflPrice, ')
          ..write('mulberryVariety: $mulberryVariety, ')
          ..write('rearingHouse: $rearingHouse, ')
          ..write('currentStage: $currentStage, ')
          ..write('currentAgeDays: $currentAgeDays, ')
          ..write('status: $status, ')
          ..write('healthStatus: $healthStatus, ')
          ..write('temperature: $temperature, ')
          ..write('humidity: $humidity, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      batchName,
      startDate,
      expectedHarvestDate,
      actualHarvestDate,
      silkwormVariety,
      eggSource,
      numberOfDfls,
      dflPrice,
      mulberryVariety,
      rearingHouse,
      currentStage,
      currentAgeDays,
      status,
      healthStatus,
      temperature,
      humidity,
      notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BatchDbModel &&
          other.id == this.id &&
          other.batchName == this.batchName &&
          other.startDate == this.startDate &&
          other.expectedHarvestDate == this.expectedHarvestDate &&
          other.actualHarvestDate == this.actualHarvestDate &&
          other.silkwormVariety == this.silkwormVariety &&
          other.eggSource == this.eggSource &&
          other.numberOfDfls == this.numberOfDfls &&
          other.dflPrice == this.dflPrice &&
          other.mulberryVariety == this.mulberryVariety &&
          other.rearingHouse == this.rearingHouse &&
          other.currentStage == this.currentStage &&
          other.currentAgeDays == this.currentAgeDays &&
          other.status == this.status &&
          other.healthStatus == this.healthStatus &&
          other.temperature == this.temperature &&
          other.humidity == this.humidity &&
          other.notes == this.notes);
}

class BatchesTableCompanion extends UpdateCompanion<BatchDbModel> {
  final Value<String> id;
  final Value<String> batchName;
  final Value<DateTime> startDate;
  final Value<DateTime> expectedHarvestDate;
  final Value<DateTime?> actualHarvestDate;
  final Value<String> silkwormVariety;
  final Value<String> eggSource;
  final Value<int> numberOfDfls;
  final Value<double?> dflPrice;
  final Value<String> mulberryVariety;
  final Value<String> rearingHouse;
  final Value<String> currentStage;
  final Value<int> currentAgeDays;
  final Value<String> status;
  final Value<String> healthStatus;
  final Value<double> temperature;
  final Value<double> humidity;
  final Value<String?> notes;
  final Value<int> rowid;
  const BatchesTableCompanion({
    this.id = const Value.absent(),
    this.batchName = const Value.absent(),
    this.startDate = const Value.absent(),
    this.expectedHarvestDate = const Value.absent(),
    this.actualHarvestDate = const Value.absent(),
    this.silkwormVariety = const Value.absent(),
    this.eggSource = const Value.absent(),
    this.numberOfDfls = const Value.absent(),
    this.dflPrice = const Value.absent(),
    this.mulberryVariety = const Value.absent(),
    this.rearingHouse = const Value.absent(),
    this.currentStage = const Value.absent(),
    this.currentAgeDays = const Value.absent(),
    this.status = const Value.absent(),
    this.healthStatus = const Value.absent(),
    this.temperature = const Value.absent(),
    this.humidity = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BatchesTableCompanion.insert({
    required String id,
    required String batchName,
    required DateTime startDate,
    required DateTime expectedHarvestDate,
    this.actualHarvestDate = const Value.absent(),
    required String silkwormVariety,
    required String eggSource,
    required int numberOfDfls,
    this.dflPrice = const Value.absent(),
    required String mulberryVariety,
    required String rearingHouse,
    required String currentStage,
    required int currentAgeDays,
    required String status,
    required String healthStatus,
    required double temperature,
    required double humidity,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        batchName = Value(batchName),
        startDate = Value(startDate),
        expectedHarvestDate = Value(expectedHarvestDate),
        silkwormVariety = Value(silkwormVariety),
        eggSource = Value(eggSource),
        numberOfDfls = Value(numberOfDfls),
        mulberryVariety = Value(mulberryVariety),
        rearingHouse = Value(rearingHouse),
        currentStage = Value(currentStage),
        currentAgeDays = Value(currentAgeDays),
        status = Value(status),
        healthStatus = Value(healthStatus),
        temperature = Value(temperature),
        humidity = Value(humidity);
  static Insertable<BatchDbModel> custom({
    Expression<String>? id,
    Expression<String>? batchName,
    Expression<DateTime>? startDate,
    Expression<DateTime>? expectedHarvestDate,
    Expression<DateTime>? actualHarvestDate,
    Expression<String>? silkwormVariety,
    Expression<String>? eggSource,
    Expression<int>? numberOfDfls,
    Expression<double>? dflPrice,
    Expression<String>? mulberryVariety,
    Expression<String>? rearingHouse,
    Expression<String>? currentStage,
    Expression<int>? currentAgeDays,
    Expression<String>? status,
    Expression<String>? healthStatus,
    Expression<double>? temperature,
    Expression<double>? humidity,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (batchName != null) 'batch_name': batchName,
      if (startDate != null) 'start_date': startDate,
      if (expectedHarvestDate != null)
        'expected_harvest_date': expectedHarvestDate,
      if (actualHarvestDate != null) 'actual_harvest_date': actualHarvestDate,
      if (silkwormVariety != null) 'silkworm_variety': silkwormVariety,
      if (eggSource != null) 'egg_source': eggSource,
      if (numberOfDfls != null) 'number_of_dfls': numberOfDfls,
      if (dflPrice != null) 'dfl_price': dflPrice,
      if (mulberryVariety != null) 'mulberry_variety': mulberryVariety,
      if (rearingHouse != null) 'rearing_house': rearingHouse,
      if (currentStage != null) 'current_stage': currentStage,
      if (currentAgeDays != null) 'current_age_days': currentAgeDays,
      if (status != null) 'status': status,
      if (healthStatus != null) 'health_status': healthStatus,
      if (temperature != null) 'temperature': temperature,
      if (humidity != null) 'humidity': humidity,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BatchesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? batchName,
      Value<DateTime>? startDate,
      Value<DateTime>? expectedHarvestDate,
      Value<DateTime?>? actualHarvestDate,
      Value<String>? silkwormVariety,
      Value<String>? eggSource,
      Value<int>? numberOfDfls,
      Value<double?>? dflPrice,
      Value<String>? mulberryVariety,
      Value<String>? rearingHouse,
      Value<String>? currentStage,
      Value<int>? currentAgeDays,
      Value<String>? status,
      Value<String>? healthStatus,
      Value<double>? temperature,
      Value<double>? humidity,
      Value<String?>? notes,
      Value<int>? rowid}) {
    return BatchesTableCompanion(
      id: id ?? this.id,
      batchName: batchName ?? this.batchName,
      startDate: startDate ?? this.startDate,
      expectedHarvestDate: expectedHarvestDate ?? this.expectedHarvestDate,
      actualHarvestDate: actualHarvestDate ?? this.actualHarvestDate,
      silkwormVariety: silkwormVariety ?? this.silkwormVariety,
      eggSource: eggSource ?? this.eggSource,
      numberOfDfls: numberOfDfls ?? this.numberOfDfls,
      dflPrice: dflPrice ?? this.dflPrice,
      mulberryVariety: mulberryVariety ?? this.mulberryVariety,
      rearingHouse: rearingHouse ?? this.rearingHouse,
      currentStage: currentStage ?? this.currentStage,
      currentAgeDays: currentAgeDays ?? this.currentAgeDays,
      status: status ?? this.status,
      healthStatus: healthStatus ?? this.healthStatus,
      temperature: temperature ?? this.temperature,
      humidity: humidity ?? this.humidity,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (batchName.present) {
      map['batch_name'] = Variable<String>(batchName.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (expectedHarvestDate.present) {
      map['expected_harvest_date'] =
          Variable<DateTime>(expectedHarvestDate.value);
    }
    if (actualHarvestDate.present) {
      map['actual_harvest_date'] = Variable<DateTime>(actualHarvestDate.value);
    }
    if (silkwormVariety.present) {
      map['silkworm_variety'] = Variable<String>(silkwormVariety.value);
    }
    if (eggSource.present) {
      map['egg_source'] = Variable<String>(eggSource.value);
    }
    if (numberOfDfls.present) {
      map['number_of_dfls'] = Variable<int>(numberOfDfls.value);
    }
    if (dflPrice.present) {
      map['dfl_price'] = Variable<double>(dflPrice.value);
    }
    if (mulberryVariety.present) {
      map['mulberry_variety'] = Variable<String>(mulberryVariety.value);
    }
    if (rearingHouse.present) {
      map['rearing_house'] = Variable<String>(rearingHouse.value);
    }
    if (currentStage.present) {
      map['current_stage'] = Variable<String>(currentStage.value);
    }
    if (currentAgeDays.present) {
      map['current_age_days'] = Variable<int>(currentAgeDays.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (healthStatus.present) {
      map['health_status'] = Variable<String>(healthStatus.value);
    }
    if (temperature.present) {
      map['temperature'] = Variable<double>(temperature.value);
    }
    if (humidity.present) {
      map['humidity'] = Variable<double>(humidity.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BatchesTableCompanion(')
          ..write('id: $id, ')
          ..write('batchName: $batchName, ')
          ..write('startDate: $startDate, ')
          ..write('expectedHarvestDate: $expectedHarvestDate, ')
          ..write('actualHarvestDate: $actualHarvestDate, ')
          ..write('silkwormVariety: $silkwormVariety, ')
          ..write('eggSource: $eggSource, ')
          ..write('numberOfDfls: $numberOfDfls, ')
          ..write('dflPrice: $dflPrice, ')
          ..write('mulberryVariety: $mulberryVariety, ')
          ..write('rearingHouse: $rearingHouse, ')
          ..write('currentStage: $currentStage, ')
          ..write('currentAgeDays: $currentAgeDays, ')
          ..write('status: $status, ')
          ..write('healthStatus: $healthStatus, ')
          ..write('temperature: $temperature, ')
          ..write('humidity: $humidity, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTableTable extends ExpensesTable
    with TableInfo<$ExpensesTableTable, ExpenseDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES expense_categories_table (id)'));
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _batchIdMeta =
      const VerificationMeta('batchId');
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
      'batch_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES batches_table (id) ON DELETE SET NULL'));
  static const VerificationMeta _receiptUrlMeta =
      const VerificationMeta('receiptUrl');
  @override
  late final GeneratedColumn<String> receiptUrl = GeneratedColumn<String>(
      'receipt_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        amount,
        quantity,
        date,
        categoryId,
        paymentMethod,
        description,
        batchId,
        receiptUrl
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expenses_table';
  @override
  VerificationContext validateIntegrity(Insertable<ExpenseDbModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('batch_id')) {
      context.handle(_batchIdMeta,
          batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta));
    }
    if (data.containsKey('receipt_url')) {
      context.handle(
          _receiptUrlMeta,
          receiptUrl.isAcceptableOrUnknown(
              data['receipt_url']!, _receiptUrlMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExpenseDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpenseDbModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id'])!,
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      batchId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}batch_id']),
      receiptUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}receipt_url']),
    );
  }

  @override
  $ExpensesTableTable createAlias(String alias) {
    return $ExpensesTableTable(attachedDatabase, alias);
  }
}

class ExpenseDbModel extends DataClass implements Insertable<ExpenseDbModel> {
  final String id;
  final double amount;
  final double? quantity;
  final DateTime date;
  final String categoryId;
  final String paymentMethod;
  final String description;
  final String? batchId;
  final String? receiptUrl;
  const ExpenseDbModel(
      {required this.id,
      required this.amount,
      this.quantity,
      required this.date,
      required this.categoryId,
      required this.paymentMethod,
      required this.description,
      this.batchId,
      this.receiptUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['amount'] = Variable<double>(amount);
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<double>(quantity);
    }
    map['date'] = Variable<DateTime>(date);
    map['category_id'] = Variable<String>(categoryId);
    map['payment_method'] = Variable<String>(paymentMethod);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || batchId != null) {
      map['batch_id'] = Variable<String>(batchId);
    }
    if (!nullToAbsent || receiptUrl != null) {
      map['receipt_url'] = Variable<String>(receiptUrl);
    }
    return map;
  }

  ExpensesTableCompanion toCompanion(bool nullToAbsent) {
    return ExpensesTableCompanion(
      id: Value(id),
      amount: Value(amount),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      date: Value(date),
      categoryId: Value(categoryId),
      paymentMethod: Value(paymentMethod),
      description: Value(description),
      batchId: batchId == null && nullToAbsent
          ? const Value.absent()
          : Value(batchId),
      receiptUrl: receiptUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptUrl),
    );
  }

  factory ExpenseDbModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpenseDbModel(
      id: serializer.fromJson<String>(json['id']),
      amount: serializer.fromJson<double>(json['amount']),
      quantity: serializer.fromJson<double?>(json['quantity']),
      date: serializer.fromJson<DateTime>(json['date']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      description: serializer.fromJson<String>(json['description']),
      batchId: serializer.fromJson<String?>(json['batchId']),
      receiptUrl: serializer.fromJson<String?>(json['receiptUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'amount': serializer.toJson<double>(amount),
      'quantity': serializer.toJson<double?>(quantity),
      'date': serializer.toJson<DateTime>(date),
      'categoryId': serializer.toJson<String>(categoryId),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'description': serializer.toJson<String>(description),
      'batchId': serializer.toJson<String?>(batchId),
      'receiptUrl': serializer.toJson<String?>(receiptUrl),
    };
  }

  ExpenseDbModel copyWith(
          {String? id,
          double? amount,
          Value<double?> quantity = const Value.absent(),
          DateTime? date,
          String? categoryId,
          String? paymentMethod,
          String? description,
          Value<String?> batchId = const Value.absent(),
          Value<String?> receiptUrl = const Value.absent()}) =>
      ExpenseDbModel(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        quantity: quantity.present ? quantity.value : this.quantity,
        date: date ?? this.date,
        categoryId: categoryId ?? this.categoryId,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        description: description ?? this.description,
        batchId: batchId.present ? batchId.value : this.batchId,
        receiptUrl: receiptUrl.present ? receiptUrl.value : this.receiptUrl,
      );
  ExpenseDbModel copyWithCompanion(ExpensesTableCompanion data) {
    return ExpenseDbModel(
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      date: data.date.present ? data.date.value : this.date,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      description:
          data.description.present ? data.description.value : this.description,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      receiptUrl:
          data.receiptUrl.present ? data.receiptUrl.value : this.receiptUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseDbModel(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('quantity: $quantity, ')
          ..write('date: $date, ')
          ..write('categoryId: $categoryId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('description: $description, ')
          ..write('batchId: $batchId, ')
          ..write('receiptUrl: $receiptUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, amount, quantity, date, categoryId,
      paymentMethod, description, batchId, receiptUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseDbModel &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.quantity == this.quantity &&
          other.date == this.date &&
          other.categoryId == this.categoryId &&
          other.paymentMethod == this.paymentMethod &&
          other.description == this.description &&
          other.batchId == this.batchId &&
          other.receiptUrl == this.receiptUrl);
}

class ExpensesTableCompanion extends UpdateCompanion<ExpenseDbModel> {
  final Value<String> id;
  final Value<double> amount;
  final Value<double?> quantity;
  final Value<DateTime> date;
  final Value<String> categoryId;
  final Value<String> paymentMethod;
  final Value<String> description;
  final Value<String?> batchId;
  final Value<String?> receiptUrl;
  final Value<int> rowid;
  const ExpensesTableCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.quantity = const Value.absent(),
    this.date = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.description = const Value.absent(),
    this.batchId = const Value.absent(),
    this.receiptUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExpensesTableCompanion.insert({
    required String id,
    required double amount,
    this.quantity = const Value.absent(),
    required DateTime date,
    required String categoryId,
    required String paymentMethod,
    required String description,
    this.batchId = const Value.absent(),
    this.receiptUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        amount = Value(amount),
        date = Value(date),
        categoryId = Value(categoryId),
        paymentMethod = Value(paymentMethod),
        description = Value(description);
  static Insertable<ExpenseDbModel> custom({
    Expression<String>? id,
    Expression<double>? amount,
    Expression<double>? quantity,
    Expression<DateTime>? date,
    Expression<String>? categoryId,
    Expression<String>? paymentMethod,
    Expression<String>? description,
    Expression<String>? batchId,
    Expression<String>? receiptUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (quantity != null) 'quantity': quantity,
      if (date != null) 'date': date,
      if (categoryId != null) 'category_id': categoryId,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (description != null) 'description': description,
      if (batchId != null) 'batch_id': batchId,
      if (receiptUrl != null) 'receipt_url': receiptUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExpensesTableCompanion copyWith(
      {Value<String>? id,
      Value<double>? amount,
      Value<double?>? quantity,
      Value<DateTime>? date,
      Value<String>? categoryId,
      Value<String>? paymentMethod,
      Value<String>? description,
      Value<String?>? batchId,
      Value<String?>? receiptUrl,
      Value<int>? rowid}) {
    return ExpensesTableCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      quantity: quantity ?? this.quantity,
      date: date ?? this.date,
      categoryId: categoryId ?? this.categoryId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      description: description ?? this.description,
      batchId: batchId ?? this.batchId,
      receiptUrl: receiptUrl ?? this.receiptUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (receiptUrl.present) {
      map['receipt_url'] = Variable<String>(receiptUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesTableCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('quantity: $quantity, ')
          ..write('date: $date, ')
          ..write('categoryId: $categoryId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('description: $description, ')
          ..write('batchId: $batchId, ')
          ..write('receiptUrl: $receiptUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BuyersTableTable extends BuyersTable
    with TableInfo<$BuyersTableTable, BuyerDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BuyersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contactMeta =
      const VerificationMeta('contact');
  @override
  late final GeneratedColumn<String> contact = GeneratedColumn<String>(
      'contact', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, contact];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'buyers_table';
  @override
  VerificationContext validateIntegrity(Insertable<BuyerDbModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('contact')) {
      context.handle(_contactMeta,
          contact.isAcceptableOrUnknown(data['contact']!, _contactMeta));
    } else if (isInserting) {
      context.missing(_contactMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BuyerDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BuyerDbModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      contact: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contact'])!,
    );
  }

  @override
  $BuyersTableTable createAlias(String alias) {
    return $BuyersTableTable(attachedDatabase, alias);
  }
}

class BuyerDbModel extends DataClass implements Insertable<BuyerDbModel> {
  final String id;
  final String name;
  final String contact;
  const BuyerDbModel(
      {required this.id, required this.name, required this.contact});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['contact'] = Variable<String>(contact);
    return map;
  }

  BuyersTableCompanion toCompanion(bool nullToAbsent) {
    return BuyersTableCompanion(
      id: Value(id),
      name: Value(name),
      contact: Value(contact),
    );
  }

  factory BuyerDbModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BuyerDbModel(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      contact: serializer.fromJson<String>(json['contact']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'contact': serializer.toJson<String>(contact),
    };
  }

  BuyerDbModel copyWith({String? id, String? name, String? contact}) =>
      BuyerDbModel(
        id: id ?? this.id,
        name: name ?? this.name,
        contact: contact ?? this.contact,
      );
  BuyerDbModel copyWithCompanion(BuyersTableCompanion data) {
    return BuyerDbModel(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      contact: data.contact.present ? data.contact.value : this.contact,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BuyerDbModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('contact: $contact')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, contact);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BuyerDbModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.contact == this.contact);
}

class BuyersTableCompanion extends UpdateCompanion<BuyerDbModel> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> contact;
  final Value<int> rowid;
  const BuyersTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.contact = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BuyersTableCompanion.insert({
    required String id,
    required String name,
    required String contact,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        contact = Value(contact);
  static Insertable<BuyerDbModel> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? contact,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (contact != null) 'contact': contact,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BuyersTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? contact,
      Value<int>? rowid}) {
    return BuyersTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      contact: contact ?? this.contact,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (contact.present) {
      map['contact'] = Variable<String>(contact.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BuyersTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('contact: $contact, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $IncomeCategoriesTableTable extends IncomeCategoriesTable
    with TableInfo<$IncomeCategoriesTableTable, IncomeCategoryDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IncomeCategoriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorCodeMeta =
      const VerificationMeta('colorCode');
  @override
  late final GeneratedColumn<String> colorCode = GeneratedColumn<String>(
      'color_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconNameMeta =
      const VerificationMeta('iconName');
  @override
  late final GeneratedColumn<String> iconName = GeneratedColumn<String>(
      'icon_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, colorCode, iconName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'income_categories_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<IncomeCategoryDbModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color_code')) {
      context.handle(_colorCodeMeta,
          colorCode.isAcceptableOrUnknown(data['color_code']!, _colorCodeMeta));
    } else if (isInserting) {
      context.missing(_colorCodeMeta);
    }
    if (data.containsKey('icon_name')) {
      context.handle(_iconNameMeta,
          iconName.isAcceptableOrUnknown(data['icon_name']!, _iconNameMeta));
    } else if (isInserting) {
      context.missing(_iconNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IncomeCategoryDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IncomeCategoryDbModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      colorCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color_code'])!,
      iconName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_name'])!,
    );
  }

  @override
  $IncomeCategoriesTableTable createAlias(String alias) {
    return $IncomeCategoriesTableTable(attachedDatabase, alias);
  }
}

class IncomeCategoryDbModel extends DataClass
    implements Insertable<IncomeCategoryDbModel> {
  final String id;
  final String name;
  final String colorCode;
  final String iconName;
  const IncomeCategoryDbModel(
      {required this.id,
      required this.name,
      required this.colorCode,
      required this.iconName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['color_code'] = Variable<String>(colorCode);
    map['icon_name'] = Variable<String>(iconName);
    return map;
  }

  IncomeCategoriesTableCompanion toCompanion(bool nullToAbsent) {
    return IncomeCategoriesTableCompanion(
      id: Value(id),
      name: Value(name),
      colorCode: Value(colorCode),
      iconName: Value(iconName),
    );
  }

  factory IncomeCategoryDbModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IncomeCategoryDbModel(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      colorCode: serializer.fromJson<String>(json['colorCode']),
      iconName: serializer.fromJson<String>(json['iconName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'colorCode': serializer.toJson<String>(colorCode),
      'iconName': serializer.toJson<String>(iconName),
    };
  }

  IncomeCategoryDbModel copyWith(
          {String? id, String? name, String? colorCode, String? iconName}) =>
      IncomeCategoryDbModel(
        id: id ?? this.id,
        name: name ?? this.name,
        colorCode: colorCode ?? this.colorCode,
        iconName: iconName ?? this.iconName,
      );
  IncomeCategoryDbModel copyWithCompanion(IncomeCategoriesTableCompanion data) {
    return IncomeCategoryDbModel(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      colorCode: data.colorCode.present ? data.colorCode.value : this.colorCode,
      iconName: data.iconName.present ? data.iconName.value : this.iconName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IncomeCategoryDbModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorCode: $colorCode, ')
          ..write('iconName: $iconName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, colorCode, iconName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncomeCategoryDbModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.colorCode == this.colorCode &&
          other.iconName == this.iconName);
}

class IncomeCategoriesTableCompanion
    extends UpdateCompanion<IncomeCategoryDbModel> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> colorCode;
  final Value<String> iconName;
  final Value<int> rowid;
  const IncomeCategoriesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.colorCode = const Value.absent(),
    this.iconName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IncomeCategoriesTableCompanion.insert({
    required String id,
    required String name,
    required String colorCode,
    required String iconName,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        colorCode = Value(colorCode),
        iconName = Value(iconName);
  static Insertable<IncomeCategoryDbModel> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? colorCode,
    Expression<String>? iconName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (colorCode != null) 'color_code': colorCode,
      if (iconName != null) 'icon_name': iconName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IncomeCategoriesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? colorCode,
      Value<String>? iconName,
      Value<int>? rowid}) {
    return IncomeCategoriesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      colorCode: colorCode ?? this.colorCode,
      iconName: iconName ?? this.iconName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (colorCode.present) {
      map['color_code'] = Variable<String>(colorCode.value);
    }
    if (iconName.present) {
      map['icon_name'] = Variable<String>(iconName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncomeCategoriesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorCode: $colorCode, ')
          ..write('iconName: $iconName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $IncomesTableTable extends IncomesTable
    with TableInfo<$IncomesTableTable, IncomeDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IncomesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _saleDateMeta =
      const VerificationMeta('saleDate');
  @override
  late final GeneratedColumn<DateTime> saleDate = GeneratedColumn<DateTime>(
      'sale_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _batchIdMeta =
      const VerificationMeta('batchId');
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
      'batch_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES batches_table (id) ON DELETE SET NULL'));
  static const VerificationMeta _buyerIdMeta =
      const VerificationMeta('buyerId');
  @override
  late final GeneratedColumn<String> buyerId = GeneratedColumn<String>(
      'buyer_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES buyers_table (id)'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES income_categories_table (id)'));
  static const VerificationMeta _cocoonGradeMeta =
      const VerificationMeta('cocoonGrade');
  @override
  late final GeneratedColumn<String> cocoonGrade = GeneratedColumn<String>(
      'cocoon_grade', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _rateMeta = const VerificationMeta('rate');
  @override
  late final GeneratedColumn<double> rate = GeneratedColumn<double>(
      'rate', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _grossAmountMeta =
      const VerificationMeta('grossAmount');
  @override
  late final GeneratedColumn<double> grossAmount = GeneratedColumn<double>(
      'gross_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _transportChargesMeta =
      const VerificationMeta('transportCharges');
  @override
  late final GeneratedColumn<double> transportCharges = GeneratedColumn<double>(
      'transport_charges', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _commissionMeta =
      const VerificationMeta('commission');
  @override
  late final GeneratedColumn<double> commission = GeneratedColumn<double>(
      'commission', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _netAmountMeta =
      const VerificationMeta('netAmount');
  @override
  late final GeneratedColumn<double> netAmount = GeneratedColumn<double>(
      'net_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _paymentStatusMeta =
      const VerificationMeta('paymentStatus');
  @override
  late final GeneratedColumn<String> paymentStatus = GeneratedColumn<String>(
      'payment_status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _invoiceNumberMeta =
      const VerificationMeta('invoiceNumber');
  @override
  late final GeneratedColumn<String> invoiceNumber = GeneratedColumn<String>(
      'invoice_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _remarksMeta =
      const VerificationMeta('remarks');
  @override
  late final GeneratedColumn<String> remarks = GeneratedColumn<String>(
      'remarks', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        saleDate,
        batchId,
        buyerId,
        categoryId,
        cocoonGrade,
        quantity,
        rate,
        grossAmount,
        transportCharges,
        commission,
        netAmount,
        paymentMethod,
        paymentStatus,
        invoiceNumber,
        remarks
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'incomes_table';
  @override
  VerificationContext validateIntegrity(Insertable<IncomeDbModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('sale_date')) {
      context.handle(_saleDateMeta,
          saleDate.isAcceptableOrUnknown(data['sale_date']!, _saleDateMeta));
    } else if (isInserting) {
      context.missing(_saleDateMeta);
    }
    if (data.containsKey('batch_id')) {
      context.handle(_batchIdMeta,
          batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta));
    }
    if (data.containsKey('buyer_id')) {
      context.handle(_buyerIdMeta,
          buyerId.isAcceptableOrUnknown(data['buyer_id']!, _buyerIdMeta));
    } else if (isInserting) {
      context.missing(_buyerIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('cocoon_grade')) {
      context.handle(
          _cocoonGradeMeta,
          cocoonGrade.isAcceptableOrUnknown(
              data['cocoon_grade']!, _cocoonGradeMeta));
    } else if (isInserting) {
      context.missing(_cocoonGradeMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('rate')) {
      context.handle(
          _rateMeta, rate.isAcceptableOrUnknown(data['rate']!, _rateMeta));
    } else if (isInserting) {
      context.missing(_rateMeta);
    }
    if (data.containsKey('gross_amount')) {
      context.handle(
          _grossAmountMeta,
          grossAmount.isAcceptableOrUnknown(
              data['gross_amount']!, _grossAmountMeta));
    } else if (isInserting) {
      context.missing(_grossAmountMeta);
    }
    if (data.containsKey('transport_charges')) {
      context.handle(
          _transportChargesMeta,
          transportCharges.isAcceptableOrUnknown(
              data['transport_charges']!, _transportChargesMeta));
    } else if (isInserting) {
      context.missing(_transportChargesMeta);
    }
    if (data.containsKey('commission')) {
      context.handle(
          _commissionMeta,
          commission.isAcceptableOrUnknown(
              data['commission']!, _commissionMeta));
    } else if (isInserting) {
      context.missing(_commissionMeta);
    }
    if (data.containsKey('net_amount')) {
      context.handle(_netAmountMeta,
          netAmount.isAcceptableOrUnknown(data['net_amount']!, _netAmountMeta));
    } else if (isInserting) {
      context.missing(_netAmountMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    if (data.containsKey('payment_status')) {
      context.handle(
          _paymentStatusMeta,
          paymentStatus.isAcceptableOrUnknown(
              data['payment_status']!, _paymentStatusMeta));
    } else if (isInserting) {
      context.missing(_paymentStatusMeta);
    }
    if (data.containsKey('invoice_number')) {
      context.handle(
          _invoiceNumberMeta,
          invoiceNumber.isAcceptableOrUnknown(
              data['invoice_number']!, _invoiceNumberMeta));
    }
    if (data.containsKey('remarks')) {
      context.handle(_remarksMeta,
          remarks.isAcceptableOrUnknown(data['remarks']!, _remarksMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IncomeDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IncomeDbModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      saleDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}sale_date'])!,
      batchId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}batch_id']),
      buyerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}buyer_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id'])!,
      cocoonGrade: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cocoon_grade'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      rate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rate'])!,
      grossAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}gross_amount'])!,
      transportCharges: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}transport_charges'])!,
      commission: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}commission'])!,
      netAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}net_amount'])!,
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method'])!,
      paymentStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_status'])!,
      invoiceNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}invoice_number']),
      remarks: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remarks']),
    );
  }

  @override
  $IncomesTableTable createAlias(String alias) {
    return $IncomesTableTable(attachedDatabase, alias);
  }
}

class IncomeDbModel extends DataClass implements Insertable<IncomeDbModel> {
  final String id;
  final DateTime saleDate;
  final String? batchId;
  final String buyerId;
  final String categoryId;
  final String cocoonGrade;
  final double quantity;
  final double rate;
  final double grossAmount;
  final double transportCharges;
  final double commission;
  final double netAmount;
  final String paymentMethod;
  final String paymentStatus;
  final String? invoiceNumber;
  final String? remarks;
  const IncomeDbModel(
      {required this.id,
      required this.saleDate,
      this.batchId,
      required this.buyerId,
      required this.categoryId,
      required this.cocoonGrade,
      required this.quantity,
      required this.rate,
      required this.grossAmount,
      required this.transportCharges,
      required this.commission,
      required this.netAmount,
      required this.paymentMethod,
      required this.paymentStatus,
      this.invoiceNumber,
      this.remarks});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['sale_date'] = Variable<DateTime>(saleDate);
    if (!nullToAbsent || batchId != null) {
      map['batch_id'] = Variable<String>(batchId);
    }
    map['buyer_id'] = Variable<String>(buyerId);
    map['category_id'] = Variable<String>(categoryId);
    map['cocoon_grade'] = Variable<String>(cocoonGrade);
    map['quantity'] = Variable<double>(quantity);
    map['rate'] = Variable<double>(rate);
    map['gross_amount'] = Variable<double>(grossAmount);
    map['transport_charges'] = Variable<double>(transportCharges);
    map['commission'] = Variable<double>(commission);
    map['net_amount'] = Variable<double>(netAmount);
    map['payment_method'] = Variable<String>(paymentMethod);
    map['payment_status'] = Variable<String>(paymentStatus);
    if (!nullToAbsent || invoiceNumber != null) {
      map['invoice_number'] = Variable<String>(invoiceNumber);
    }
    if (!nullToAbsent || remarks != null) {
      map['remarks'] = Variable<String>(remarks);
    }
    return map;
  }

  IncomesTableCompanion toCompanion(bool nullToAbsent) {
    return IncomesTableCompanion(
      id: Value(id),
      saleDate: Value(saleDate),
      batchId: batchId == null && nullToAbsent
          ? const Value.absent()
          : Value(batchId),
      buyerId: Value(buyerId),
      categoryId: Value(categoryId),
      cocoonGrade: Value(cocoonGrade),
      quantity: Value(quantity),
      rate: Value(rate),
      grossAmount: Value(grossAmount),
      transportCharges: Value(transportCharges),
      commission: Value(commission),
      netAmount: Value(netAmount),
      paymentMethod: Value(paymentMethod),
      paymentStatus: Value(paymentStatus),
      invoiceNumber: invoiceNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(invoiceNumber),
      remarks: remarks == null && nullToAbsent
          ? const Value.absent()
          : Value(remarks),
    );
  }

  factory IncomeDbModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IncomeDbModel(
      id: serializer.fromJson<String>(json['id']),
      saleDate: serializer.fromJson<DateTime>(json['saleDate']),
      batchId: serializer.fromJson<String?>(json['batchId']),
      buyerId: serializer.fromJson<String>(json['buyerId']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      cocoonGrade: serializer.fromJson<String>(json['cocoonGrade']),
      quantity: serializer.fromJson<double>(json['quantity']),
      rate: serializer.fromJson<double>(json['rate']),
      grossAmount: serializer.fromJson<double>(json['grossAmount']),
      transportCharges: serializer.fromJson<double>(json['transportCharges']),
      commission: serializer.fromJson<double>(json['commission']),
      netAmount: serializer.fromJson<double>(json['netAmount']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      paymentStatus: serializer.fromJson<String>(json['paymentStatus']),
      invoiceNumber: serializer.fromJson<String?>(json['invoiceNumber']),
      remarks: serializer.fromJson<String?>(json['remarks']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'saleDate': serializer.toJson<DateTime>(saleDate),
      'batchId': serializer.toJson<String?>(batchId),
      'buyerId': serializer.toJson<String>(buyerId),
      'categoryId': serializer.toJson<String>(categoryId),
      'cocoonGrade': serializer.toJson<String>(cocoonGrade),
      'quantity': serializer.toJson<double>(quantity),
      'rate': serializer.toJson<double>(rate),
      'grossAmount': serializer.toJson<double>(grossAmount),
      'transportCharges': serializer.toJson<double>(transportCharges),
      'commission': serializer.toJson<double>(commission),
      'netAmount': serializer.toJson<double>(netAmount),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'paymentStatus': serializer.toJson<String>(paymentStatus),
      'invoiceNumber': serializer.toJson<String?>(invoiceNumber),
      'remarks': serializer.toJson<String?>(remarks),
    };
  }

  IncomeDbModel copyWith(
          {String? id,
          DateTime? saleDate,
          Value<String?> batchId = const Value.absent(),
          String? buyerId,
          String? categoryId,
          String? cocoonGrade,
          double? quantity,
          double? rate,
          double? grossAmount,
          double? transportCharges,
          double? commission,
          double? netAmount,
          String? paymentMethod,
          String? paymentStatus,
          Value<String?> invoiceNumber = const Value.absent(),
          Value<String?> remarks = const Value.absent()}) =>
      IncomeDbModel(
        id: id ?? this.id,
        saleDate: saleDate ?? this.saleDate,
        batchId: batchId.present ? batchId.value : this.batchId,
        buyerId: buyerId ?? this.buyerId,
        categoryId: categoryId ?? this.categoryId,
        cocoonGrade: cocoonGrade ?? this.cocoonGrade,
        quantity: quantity ?? this.quantity,
        rate: rate ?? this.rate,
        grossAmount: grossAmount ?? this.grossAmount,
        transportCharges: transportCharges ?? this.transportCharges,
        commission: commission ?? this.commission,
        netAmount: netAmount ?? this.netAmount,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentStatus: paymentStatus ?? this.paymentStatus,
        invoiceNumber:
            invoiceNumber.present ? invoiceNumber.value : this.invoiceNumber,
        remarks: remarks.present ? remarks.value : this.remarks,
      );
  IncomeDbModel copyWithCompanion(IncomesTableCompanion data) {
    return IncomeDbModel(
      id: data.id.present ? data.id.value : this.id,
      saleDate: data.saleDate.present ? data.saleDate.value : this.saleDate,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      buyerId: data.buyerId.present ? data.buyerId.value : this.buyerId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      cocoonGrade:
          data.cocoonGrade.present ? data.cocoonGrade.value : this.cocoonGrade,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      rate: data.rate.present ? data.rate.value : this.rate,
      grossAmount:
          data.grossAmount.present ? data.grossAmount.value : this.grossAmount,
      transportCharges: data.transportCharges.present
          ? data.transportCharges.value
          : this.transportCharges,
      commission:
          data.commission.present ? data.commission.value : this.commission,
      netAmount: data.netAmount.present ? data.netAmount.value : this.netAmount,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      paymentStatus: data.paymentStatus.present
          ? data.paymentStatus.value
          : this.paymentStatus,
      invoiceNumber: data.invoiceNumber.present
          ? data.invoiceNumber.value
          : this.invoiceNumber,
      remarks: data.remarks.present ? data.remarks.value : this.remarks,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IncomeDbModel(')
          ..write('id: $id, ')
          ..write('saleDate: $saleDate, ')
          ..write('batchId: $batchId, ')
          ..write('buyerId: $buyerId, ')
          ..write('categoryId: $categoryId, ')
          ..write('cocoonGrade: $cocoonGrade, ')
          ..write('quantity: $quantity, ')
          ..write('rate: $rate, ')
          ..write('grossAmount: $grossAmount, ')
          ..write('transportCharges: $transportCharges, ')
          ..write('commission: $commission, ')
          ..write('netAmount: $netAmount, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('remarks: $remarks')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      saleDate,
      batchId,
      buyerId,
      categoryId,
      cocoonGrade,
      quantity,
      rate,
      grossAmount,
      transportCharges,
      commission,
      netAmount,
      paymentMethod,
      paymentStatus,
      invoiceNumber,
      remarks);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncomeDbModel &&
          other.id == this.id &&
          other.saleDate == this.saleDate &&
          other.batchId == this.batchId &&
          other.buyerId == this.buyerId &&
          other.categoryId == this.categoryId &&
          other.cocoonGrade == this.cocoonGrade &&
          other.quantity == this.quantity &&
          other.rate == this.rate &&
          other.grossAmount == this.grossAmount &&
          other.transportCharges == this.transportCharges &&
          other.commission == this.commission &&
          other.netAmount == this.netAmount &&
          other.paymentMethod == this.paymentMethod &&
          other.paymentStatus == this.paymentStatus &&
          other.invoiceNumber == this.invoiceNumber &&
          other.remarks == this.remarks);
}

class IncomesTableCompanion extends UpdateCompanion<IncomeDbModel> {
  final Value<String> id;
  final Value<DateTime> saleDate;
  final Value<String?> batchId;
  final Value<String> buyerId;
  final Value<String> categoryId;
  final Value<String> cocoonGrade;
  final Value<double> quantity;
  final Value<double> rate;
  final Value<double> grossAmount;
  final Value<double> transportCharges;
  final Value<double> commission;
  final Value<double> netAmount;
  final Value<String> paymentMethod;
  final Value<String> paymentStatus;
  final Value<String?> invoiceNumber;
  final Value<String?> remarks;
  final Value<int> rowid;
  const IncomesTableCompanion({
    this.id = const Value.absent(),
    this.saleDate = const Value.absent(),
    this.batchId = const Value.absent(),
    this.buyerId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.cocoonGrade = const Value.absent(),
    this.quantity = const Value.absent(),
    this.rate = const Value.absent(),
    this.grossAmount = const Value.absent(),
    this.transportCharges = const Value.absent(),
    this.commission = const Value.absent(),
    this.netAmount = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.invoiceNumber = const Value.absent(),
    this.remarks = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IncomesTableCompanion.insert({
    required String id,
    required DateTime saleDate,
    this.batchId = const Value.absent(),
    required String buyerId,
    required String categoryId,
    required String cocoonGrade,
    required double quantity,
    required double rate,
    required double grossAmount,
    required double transportCharges,
    required double commission,
    required double netAmount,
    required String paymentMethod,
    required String paymentStatus,
    this.invoiceNumber = const Value.absent(),
    this.remarks = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        saleDate = Value(saleDate),
        buyerId = Value(buyerId),
        categoryId = Value(categoryId),
        cocoonGrade = Value(cocoonGrade),
        quantity = Value(quantity),
        rate = Value(rate),
        grossAmount = Value(grossAmount),
        transportCharges = Value(transportCharges),
        commission = Value(commission),
        netAmount = Value(netAmount),
        paymentMethod = Value(paymentMethod),
        paymentStatus = Value(paymentStatus);
  static Insertable<IncomeDbModel> custom({
    Expression<String>? id,
    Expression<DateTime>? saleDate,
    Expression<String>? batchId,
    Expression<String>? buyerId,
    Expression<String>? categoryId,
    Expression<String>? cocoonGrade,
    Expression<double>? quantity,
    Expression<double>? rate,
    Expression<double>? grossAmount,
    Expression<double>? transportCharges,
    Expression<double>? commission,
    Expression<double>? netAmount,
    Expression<String>? paymentMethod,
    Expression<String>? paymentStatus,
    Expression<String>? invoiceNumber,
    Expression<String>? remarks,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (saleDate != null) 'sale_date': saleDate,
      if (batchId != null) 'batch_id': batchId,
      if (buyerId != null) 'buyer_id': buyerId,
      if (categoryId != null) 'category_id': categoryId,
      if (cocoonGrade != null) 'cocoon_grade': cocoonGrade,
      if (quantity != null) 'quantity': quantity,
      if (rate != null) 'rate': rate,
      if (grossAmount != null) 'gross_amount': grossAmount,
      if (transportCharges != null) 'transport_charges': transportCharges,
      if (commission != null) 'commission': commission,
      if (netAmount != null) 'net_amount': netAmount,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (paymentStatus != null) 'payment_status': paymentStatus,
      if (invoiceNumber != null) 'invoice_number': invoiceNumber,
      if (remarks != null) 'remarks': remarks,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IncomesTableCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? saleDate,
      Value<String?>? batchId,
      Value<String>? buyerId,
      Value<String>? categoryId,
      Value<String>? cocoonGrade,
      Value<double>? quantity,
      Value<double>? rate,
      Value<double>? grossAmount,
      Value<double>? transportCharges,
      Value<double>? commission,
      Value<double>? netAmount,
      Value<String>? paymentMethod,
      Value<String>? paymentStatus,
      Value<String?>? invoiceNumber,
      Value<String?>? remarks,
      Value<int>? rowid}) {
    return IncomesTableCompanion(
      id: id ?? this.id,
      saleDate: saleDate ?? this.saleDate,
      batchId: batchId ?? this.batchId,
      buyerId: buyerId ?? this.buyerId,
      categoryId: categoryId ?? this.categoryId,
      cocoonGrade: cocoonGrade ?? this.cocoonGrade,
      quantity: quantity ?? this.quantity,
      rate: rate ?? this.rate,
      grossAmount: grossAmount ?? this.grossAmount,
      transportCharges: transportCharges ?? this.transportCharges,
      commission: commission ?? this.commission,
      netAmount: netAmount ?? this.netAmount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      remarks: remarks ?? this.remarks,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (saleDate.present) {
      map['sale_date'] = Variable<DateTime>(saleDate.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (buyerId.present) {
      map['buyer_id'] = Variable<String>(buyerId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (cocoonGrade.present) {
      map['cocoon_grade'] = Variable<String>(cocoonGrade.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (rate.present) {
      map['rate'] = Variable<double>(rate.value);
    }
    if (grossAmount.present) {
      map['gross_amount'] = Variable<double>(grossAmount.value);
    }
    if (transportCharges.present) {
      map['transport_charges'] = Variable<double>(transportCharges.value);
    }
    if (commission.present) {
      map['commission'] = Variable<double>(commission.value);
    }
    if (netAmount.present) {
      map['net_amount'] = Variable<double>(netAmount.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (paymentStatus.present) {
      map['payment_status'] = Variable<String>(paymentStatus.value);
    }
    if (invoiceNumber.present) {
      map['invoice_number'] = Variable<String>(invoiceNumber.value);
    }
    if (remarks.present) {
      map['remarks'] = Variable<String>(remarks.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncomesTableCompanion(')
          ..write('id: $id, ')
          ..write('saleDate: $saleDate, ')
          ..write('batchId: $batchId, ')
          ..write('buyerId: $buyerId, ')
          ..write('categoryId: $categoryId, ')
          ..write('cocoonGrade: $cocoonGrade, ')
          ..write('quantity: $quantity, ')
          ..write('rate: $rate, ')
          ..write('grossAmount: $grossAmount, ')
          ..write('transportCharges: $transportCharges, ')
          ..write('commission: $commission, ')
          ..write('netAmount: $netAmount, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('remarks: $remarks, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BatchTimelinesTableTable extends BatchTimelinesTable
    with TableInfo<$BatchTimelinesTableTable, BatchTimelineDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BatchTimelinesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _batchIdMeta =
      const VerificationMeta('batchId');
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
      'batch_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES batches_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _eventTypeMeta =
      const VerificationMeta('eventType');
  @override
  late final GeneratedColumn<String> eventType = GeneratedColumn<String>(
      'event_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, batchId, timestamp, eventType, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'batch_timelines_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<BatchTimelineDbModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('batch_id')) {
      context.handle(_batchIdMeta,
          batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta));
    } else if (isInserting) {
      context.missing(_batchIdMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('event_type')) {
      context.handle(_eventTypeMeta,
          eventType.isAcceptableOrUnknown(data['event_type']!, _eventTypeMeta));
    } else if (isInserting) {
      context.missing(_eventTypeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BatchTimelineDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BatchTimelineDbModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      batchId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}batch_id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      eventType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}event_type'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $BatchTimelinesTableTable createAlias(String alias) {
    return $BatchTimelinesTableTable(attachedDatabase, alias);
  }
}

class BatchTimelineDbModel extends DataClass
    implements Insertable<BatchTimelineDbModel> {
  final String id;
  final String batchId;
  final DateTime timestamp;
  final String eventType;
  final String description;
  const BatchTimelineDbModel(
      {required this.id,
      required this.batchId,
      required this.timestamp,
      required this.eventType,
      required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['batch_id'] = Variable<String>(batchId);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['event_type'] = Variable<String>(eventType);
    map['description'] = Variable<String>(description);
    return map;
  }

  BatchTimelinesTableCompanion toCompanion(bool nullToAbsent) {
    return BatchTimelinesTableCompanion(
      id: Value(id),
      batchId: Value(batchId),
      timestamp: Value(timestamp),
      eventType: Value(eventType),
      description: Value(description),
    );
  }

  factory BatchTimelineDbModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BatchTimelineDbModel(
      id: serializer.fromJson<String>(json['id']),
      batchId: serializer.fromJson<String>(json['batchId']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      eventType: serializer.fromJson<String>(json['eventType']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'batchId': serializer.toJson<String>(batchId),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'eventType': serializer.toJson<String>(eventType),
      'description': serializer.toJson<String>(description),
    };
  }

  BatchTimelineDbModel copyWith(
          {String? id,
          String? batchId,
          DateTime? timestamp,
          String? eventType,
          String? description}) =>
      BatchTimelineDbModel(
        id: id ?? this.id,
        batchId: batchId ?? this.batchId,
        timestamp: timestamp ?? this.timestamp,
        eventType: eventType ?? this.eventType,
        description: description ?? this.description,
      );
  BatchTimelineDbModel copyWithCompanion(BatchTimelinesTableCompanion data) {
    return BatchTimelineDbModel(
      id: data.id.present ? data.id.value : this.id,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      eventType: data.eventType.present ? data.eventType.value : this.eventType,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BatchTimelineDbModel(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('timestamp: $timestamp, ')
          ..write('eventType: $eventType, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, batchId, timestamp, eventType, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BatchTimelineDbModel &&
          other.id == this.id &&
          other.batchId == this.batchId &&
          other.timestamp == this.timestamp &&
          other.eventType == this.eventType &&
          other.description == this.description);
}

class BatchTimelinesTableCompanion
    extends UpdateCompanion<BatchTimelineDbModel> {
  final Value<String> id;
  final Value<String> batchId;
  final Value<DateTime> timestamp;
  final Value<String> eventType;
  final Value<String> description;
  final Value<int> rowid;
  const BatchTimelinesTableCompanion({
    this.id = const Value.absent(),
    this.batchId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.eventType = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BatchTimelinesTableCompanion.insert({
    required String id,
    required String batchId,
    required DateTime timestamp,
    required String eventType,
    required String description,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        batchId = Value(batchId),
        timestamp = Value(timestamp),
        eventType = Value(eventType),
        description = Value(description);
  static Insertable<BatchTimelineDbModel> custom({
    Expression<String>? id,
    Expression<String>? batchId,
    Expression<DateTime>? timestamp,
    Expression<String>? eventType,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (batchId != null) 'batch_id': batchId,
      if (timestamp != null) 'timestamp': timestamp,
      if (eventType != null) 'event_type': eventType,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BatchTimelinesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? batchId,
      Value<DateTime>? timestamp,
      Value<String>? eventType,
      Value<String>? description,
      Value<int>? rowid}) {
    return BatchTimelinesTableCompanion(
      id: id ?? this.id,
      batchId: batchId ?? this.batchId,
      timestamp: timestamp ?? this.timestamp,
      eventType: eventType ?? this.eventType,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (eventType.present) {
      map['event_type'] = Variable<String>(eventType.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BatchTimelinesTableCompanion(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('timestamp: $timestamp, ')
          ..write('eventType: $eventType, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InventoryCategoriesTableTable extends InventoryCategoriesTable
    with TableInfo<$InventoryCategoriesTableTable, InventoryCategoryDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryCategoriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorCodeMeta =
      const VerificationMeta('colorCode');
  @override
  late final GeneratedColumn<String> colorCode = GeneratedColumn<String>(
      'color_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconNameMeta =
      const VerificationMeta('iconName');
  @override
  late final GeneratedColumn<String> iconName = GeneratedColumn<String>(
      'icon_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, colorCode, iconName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_categories_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<InventoryCategoryDbModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color_code')) {
      context.handle(_colorCodeMeta,
          colorCode.isAcceptableOrUnknown(data['color_code']!, _colorCodeMeta));
    } else if (isInserting) {
      context.missing(_colorCodeMeta);
    }
    if (data.containsKey('icon_name')) {
      context.handle(_iconNameMeta,
          iconName.isAcceptableOrUnknown(data['icon_name']!, _iconNameMeta));
    } else if (isInserting) {
      context.missing(_iconNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryCategoryDbModel map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryCategoryDbModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      colorCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color_code'])!,
      iconName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_name'])!,
    );
  }

  @override
  $InventoryCategoriesTableTable createAlias(String alias) {
    return $InventoryCategoriesTableTable(attachedDatabase, alias);
  }
}

class InventoryCategoryDbModel extends DataClass
    implements Insertable<InventoryCategoryDbModel> {
  final String id;
  final String name;
  final String colorCode;
  final String iconName;
  const InventoryCategoryDbModel(
      {required this.id,
      required this.name,
      required this.colorCode,
      required this.iconName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['color_code'] = Variable<String>(colorCode);
    map['icon_name'] = Variable<String>(iconName);
    return map;
  }

  InventoryCategoriesTableCompanion toCompanion(bool nullToAbsent) {
    return InventoryCategoriesTableCompanion(
      id: Value(id),
      name: Value(name),
      colorCode: Value(colorCode),
      iconName: Value(iconName),
    );
  }

  factory InventoryCategoryDbModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryCategoryDbModel(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      colorCode: serializer.fromJson<String>(json['colorCode']),
      iconName: serializer.fromJson<String>(json['iconName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'colorCode': serializer.toJson<String>(colorCode),
      'iconName': serializer.toJson<String>(iconName),
    };
  }

  InventoryCategoryDbModel copyWith(
          {String? id, String? name, String? colorCode, String? iconName}) =>
      InventoryCategoryDbModel(
        id: id ?? this.id,
        name: name ?? this.name,
        colorCode: colorCode ?? this.colorCode,
        iconName: iconName ?? this.iconName,
      );
  InventoryCategoryDbModel copyWithCompanion(
      InventoryCategoriesTableCompanion data) {
    return InventoryCategoryDbModel(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      colorCode: data.colorCode.present ? data.colorCode.value : this.colorCode,
      iconName: data.iconName.present ? data.iconName.value : this.iconName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryCategoryDbModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorCode: $colorCode, ')
          ..write('iconName: $iconName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, colorCode, iconName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryCategoryDbModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.colorCode == this.colorCode &&
          other.iconName == this.iconName);
}

class InventoryCategoriesTableCompanion
    extends UpdateCompanion<InventoryCategoryDbModel> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> colorCode;
  final Value<String> iconName;
  final Value<int> rowid;
  const InventoryCategoriesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.colorCode = const Value.absent(),
    this.iconName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InventoryCategoriesTableCompanion.insert({
    required String id,
    required String name,
    required String colorCode,
    required String iconName,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        colorCode = Value(colorCode),
        iconName = Value(iconName);
  static Insertable<InventoryCategoryDbModel> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? colorCode,
    Expression<String>? iconName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (colorCode != null) 'color_code': colorCode,
      if (iconName != null) 'icon_name': iconName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InventoryCategoriesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? colorCode,
      Value<String>? iconName,
      Value<int>? rowid}) {
    return InventoryCategoriesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      colorCode: colorCode ?? this.colorCode,
      iconName: iconName ?? this.iconName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (colorCode.present) {
      map['color_code'] = Variable<String>(colorCode.value);
    }
    if (iconName.present) {
      map['icon_name'] = Variable<String>(iconName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryCategoriesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorCode: $colorCode, ')
          ..write('iconName: $iconName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InventoryItemsTableTable extends InventoryItemsTable
    with TableInfo<$InventoryItemsTableTable, InventoryItemDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryItemsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES inventory_categories_table (id)'));
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currentQuantityMeta =
      const VerificationMeta('currentQuantity');
  @override
  late final GeneratedColumn<double> currentQuantity = GeneratedColumn<double>(
      'current_quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _minimumQuantityMeta =
      const VerificationMeta('minimumQuantity');
  @override
  late final GeneratedColumn<double> minimumQuantity = GeneratedColumn<double>(
      'minimum_quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _maximumQuantityMeta =
      const VerificationMeta('maximumQuantity');
  @override
  late final GeneratedColumn<double> maximumQuantity = GeneratedColumn<double>(
      'maximum_quantity', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _purchasePriceMeta =
      const VerificationMeta('purchasePrice');
  @override
  late final GeneratedColumn<double> purchasePrice = GeneratedColumn<double>(
      'purchase_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _supplierMeta =
      const VerificationMeta('supplier');
  @override
  late final GeneratedColumn<String> supplier = GeneratedColumn<String>(
      'supplier', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _purchaseDateMeta =
      const VerificationMeta('purchaseDate');
  @override
  late final GeneratedColumn<DateTime> purchaseDate = GeneratedColumn<DateTime>(
      'purchase_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _expiryDateMeta =
      const VerificationMeta('expiryDate');
  @override
  late final GeneratedColumn<DateTime> expiryDate = GeneratedColumn<DateTime>(
      'expiry_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _storageLocationMeta =
      const VerificationMeta('storageLocation');
  @override
  late final GeneratedColumn<String> storageLocation = GeneratedColumn<String>(
      'storage_location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        categoryId,
        unit,
        currentQuantity,
        minimumQuantity,
        maximumQuantity,
        purchasePrice,
        supplier,
        purchaseDate,
        expiryDate,
        storageLocation,
        status,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_items_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<InventoryItemDbModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('current_quantity')) {
      context.handle(
          _currentQuantityMeta,
          currentQuantity.isAcceptableOrUnknown(
              data['current_quantity']!, _currentQuantityMeta));
    } else if (isInserting) {
      context.missing(_currentQuantityMeta);
    }
    if (data.containsKey('minimum_quantity')) {
      context.handle(
          _minimumQuantityMeta,
          minimumQuantity.isAcceptableOrUnknown(
              data['minimum_quantity']!, _minimumQuantityMeta));
    } else if (isInserting) {
      context.missing(_minimumQuantityMeta);
    }
    if (data.containsKey('maximum_quantity')) {
      context.handle(
          _maximumQuantityMeta,
          maximumQuantity.isAcceptableOrUnknown(
              data['maximum_quantity']!, _maximumQuantityMeta));
    }
    if (data.containsKey('purchase_price')) {
      context.handle(
          _purchasePriceMeta,
          purchasePrice.isAcceptableOrUnknown(
              data['purchase_price']!, _purchasePriceMeta));
    } else if (isInserting) {
      context.missing(_purchasePriceMeta);
    }
    if (data.containsKey('supplier')) {
      context.handle(_supplierMeta,
          supplier.isAcceptableOrUnknown(data['supplier']!, _supplierMeta));
    }
    if (data.containsKey('purchase_date')) {
      context.handle(
          _purchaseDateMeta,
          purchaseDate.isAcceptableOrUnknown(
              data['purchase_date']!, _purchaseDateMeta));
    } else if (isInserting) {
      context.missing(_purchaseDateMeta);
    }
    if (data.containsKey('expiry_date')) {
      context.handle(
          _expiryDateMeta,
          expiryDate.isAcceptableOrUnknown(
              data['expiry_date']!, _expiryDateMeta));
    }
    if (data.containsKey('storage_location')) {
      context.handle(
          _storageLocationMeta,
          storageLocation.isAcceptableOrUnknown(
              data['storage_location']!, _storageLocationMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryItemDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryItemDbModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      currentQuantity: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}current_quantity'])!,
      minimumQuantity: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}minimum_quantity'])!,
      maximumQuantity: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}maximum_quantity']),
      purchasePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}purchase_price'])!,
      supplier: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}supplier']),
      purchaseDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}purchase_date'])!,
      expiryDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expiry_date']),
      storageLocation: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}storage_location']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $InventoryItemsTableTable createAlias(String alias) {
    return $InventoryItemsTableTable(attachedDatabase, alias);
  }
}

class InventoryItemDbModel extends DataClass
    implements Insertable<InventoryItemDbModel> {
  final String id;
  final String name;
  final String categoryId;
  final String unit;
  final double currentQuantity;
  final double minimumQuantity;
  final double? maximumQuantity;
  final double purchasePrice;
  final String? supplier;
  final DateTime purchaseDate;
  final DateTime? expiryDate;
  final String? storageLocation;
  final String status;
  final String? notes;
  const InventoryItemDbModel(
      {required this.id,
      required this.name,
      required this.categoryId,
      required this.unit,
      required this.currentQuantity,
      required this.minimumQuantity,
      this.maximumQuantity,
      required this.purchasePrice,
      this.supplier,
      required this.purchaseDate,
      this.expiryDate,
      this.storageLocation,
      required this.status,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['category_id'] = Variable<String>(categoryId);
    map['unit'] = Variable<String>(unit);
    map['current_quantity'] = Variable<double>(currentQuantity);
    map['minimum_quantity'] = Variable<double>(minimumQuantity);
    if (!nullToAbsent || maximumQuantity != null) {
      map['maximum_quantity'] = Variable<double>(maximumQuantity);
    }
    map['purchase_price'] = Variable<double>(purchasePrice);
    if (!nullToAbsent || supplier != null) {
      map['supplier'] = Variable<String>(supplier);
    }
    map['purchase_date'] = Variable<DateTime>(purchaseDate);
    if (!nullToAbsent || expiryDate != null) {
      map['expiry_date'] = Variable<DateTime>(expiryDate);
    }
    if (!nullToAbsent || storageLocation != null) {
      map['storage_location'] = Variable<String>(storageLocation);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  InventoryItemsTableCompanion toCompanion(bool nullToAbsent) {
    return InventoryItemsTableCompanion(
      id: Value(id),
      name: Value(name),
      categoryId: Value(categoryId),
      unit: Value(unit),
      currentQuantity: Value(currentQuantity),
      minimumQuantity: Value(minimumQuantity),
      maximumQuantity: maximumQuantity == null && nullToAbsent
          ? const Value.absent()
          : Value(maximumQuantity),
      purchasePrice: Value(purchasePrice),
      supplier: supplier == null && nullToAbsent
          ? const Value.absent()
          : Value(supplier),
      purchaseDate: Value(purchaseDate),
      expiryDate: expiryDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expiryDate),
      storageLocation: storageLocation == null && nullToAbsent
          ? const Value.absent()
          : Value(storageLocation),
      status: Value(status),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory InventoryItemDbModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryItemDbModel(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      unit: serializer.fromJson<String>(json['unit']),
      currentQuantity: serializer.fromJson<double>(json['currentQuantity']),
      minimumQuantity: serializer.fromJson<double>(json['minimumQuantity']),
      maximumQuantity: serializer.fromJson<double?>(json['maximumQuantity']),
      purchasePrice: serializer.fromJson<double>(json['purchasePrice']),
      supplier: serializer.fromJson<String?>(json['supplier']),
      purchaseDate: serializer.fromJson<DateTime>(json['purchaseDate']),
      expiryDate: serializer.fromJson<DateTime?>(json['expiryDate']),
      storageLocation: serializer.fromJson<String?>(json['storageLocation']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'categoryId': serializer.toJson<String>(categoryId),
      'unit': serializer.toJson<String>(unit),
      'currentQuantity': serializer.toJson<double>(currentQuantity),
      'minimumQuantity': serializer.toJson<double>(minimumQuantity),
      'maximumQuantity': serializer.toJson<double?>(maximumQuantity),
      'purchasePrice': serializer.toJson<double>(purchasePrice),
      'supplier': serializer.toJson<String?>(supplier),
      'purchaseDate': serializer.toJson<DateTime>(purchaseDate),
      'expiryDate': serializer.toJson<DateTime?>(expiryDate),
      'storageLocation': serializer.toJson<String?>(storageLocation),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  InventoryItemDbModel copyWith(
          {String? id,
          String? name,
          String? categoryId,
          String? unit,
          double? currentQuantity,
          double? minimumQuantity,
          Value<double?> maximumQuantity = const Value.absent(),
          double? purchasePrice,
          Value<String?> supplier = const Value.absent(),
          DateTime? purchaseDate,
          Value<DateTime?> expiryDate = const Value.absent(),
          Value<String?> storageLocation = const Value.absent(),
          String? status,
          Value<String?> notes = const Value.absent()}) =>
      InventoryItemDbModel(
        id: id ?? this.id,
        name: name ?? this.name,
        categoryId: categoryId ?? this.categoryId,
        unit: unit ?? this.unit,
        currentQuantity: currentQuantity ?? this.currentQuantity,
        minimumQuantity: minimumQuantity ?? this.minimumQuantity,
        maximumQuantity: maximumQuantity.present
            ? maximumQuantity.value
            : this.maximumQuantity,
        purchasePrice: purchasePrice ?? this.purchasePrice,
        supplier: supplier.present ? supplier.value : this.supplier,
        purchaseDate: purchaseDate ?? this.purchaseDate,
        expiryDate: expiryDate.present ? expiryDate.value : this.expiryDate,
        storageLocation: storageLocation.present
            ? storageLocation.value
            : this.storageLocation,
        status: status ?? this.status,
        notes: notes.present ? notes.value : this.notes,
      );
  InventoryItemDbModel copyWithCompanion(InventoryItemsTableCompanion data) {
    return InventoryItemDbModel(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      unit: data.unit.present ? data.unit.value : this.unit,
      currentQuantity: data.currentQuantity.present
          ? data.currentQuantity.value
          : this.currentQuantity,
      minimumQuantity: data.minimumQuantity.present
          ? data.minimumQuantity.value
          : this.minimumQuantity,
      maximumQuantity: data.maximumQuantity.present
          ? data.maximumQuantity.value
          : this.maximumQuantity,
      purchasePrice: data.purchasePrice.present
          ? data.purchasePrice.value
          : this.purchasePrice,
      supplier: data.supplier.present ? data.supplier.value : this.supplier,
      purchaseDate: data.purchaseDate.present
          ? data.purchaseDate.value
          : this.purchaseDate,
      expiryDate:
          data.expiryDate.present ? data.expiryDate.value : this.expiryDate,
      storageLocation: data.storageLocation.present
          ? data.storageLocation.value
          : this.storageLocation,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryItemDbModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('categoryId: $categoryId, ')
          ..write('unit: $unit, ')
          ..write('currentQuantity: $currentQuantity, ')
          ..write('minimumQuantity: $minimumQuantity, ')
          ..write('maximumQuantity: $maximumQuantity, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('supplier: $supplier, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('storageLocation: $storageLocation, ')
          ..write('status: $status, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      categoryId,
      unit,
      currentQuantity,
      minimumQuantity,
      maximumQuantity,
      purchasePrice,
      supplier,
      purchaseDate,
      expiryDate,
      storageLocation,
      status,
      notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryItemDbModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.categoryId == this.categoryId &&
          other.unit == this.unit &&
          other.currentQuantity == this.currentQuantity &&
          other.minimumQuantity == this.minimumQuantity &&
          other.maximumQuantity == this.maximumQuantity &&
          other.purchasePrice == this.purchasePrice &&
          other.supplier == this.supplier &&
          other.purchaseDate == this.purchaseDate &&
          other.expiryDate == this.expiryDate &&
          other.storageLocation == this.storageLocation &&
          other.status == this.status &&
          other.notes == this.notes);
}

class InventoryItemsTableCompanion
    extends UpdateCompanion<InventoryItemDbModel> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> categoryId;
  final Value<String> unit;
  final Value<double> currentQuantity;
  final Value<double> minimumQuantity;
  final Value<double?> maximumQuantity;
  final Value<double> purchasePrice;
  final Value<String?> supplier;
  final Value<DateTime> purchaseDate;
  final Value<DateTime?> expiryDate;
  final Value<String?> storageLocation;
  final Value<String> status;
  final Value<String?> notes;
  final Value<int> rowid;
  const InventoryItemsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.unit = const Value.absent(),
    this.currentQuantity = const Value.absent(),
    this.minimumQuantity = const Value.absent(),
    this.maximumQuantity = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.supplier = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.expiryDate = const Value.absent(),
    this.storageLocation = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InventoryItemsTableCompanion.insert({
    required String id,
    required String name,
    required String categoryId,
    required String unit,
    required double currentQuantity,
    required double minimumQuantity,
    this.maximumQuantity = const Value.absent(),
    required double purchasePrice,
    this.supplier = const Value.absent(),
    required DateTime purchaseDate,
    this.expiryDate = const Value.absent(),
    this.storageLocation = const Value.absent(),
    required String status,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        categoryId = Value(categoryId),
        unit = Value(unit),
        currentQuantity = Value(currentQuantity),
        minimumQuantity = Value(minimumQuantity),
        purchasePrice = Value(purchasePrice),
        purchaseDate = Value(purchaseDate),
        status = Value(status);
  static Insertable<InventoryItemDbModel> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? categoryId,
    Expression<String>? unit,
    Expression<double>? currentQuantity,
    Expression<double>? minimumQuantity,
    Expression<double>? maximumQuantity,
    Expression<double>? purchasePrice,
    Expression<String>? supplier,
    Expression<DateTime>? purchaseDate,
    Expression<DateTime>? expiryDate,
    Expression<String>? storageLocation,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (categoryId != null) 'category_id': categoryId,
      if (unit != null) 'unit': unit,
      if (currentQuantity != null) 'current_quantity': currentQuantity,
      if (minimumQuantity != null) 'minimum_quantity': minimumQuantity,
      if (maximumQuantity != null) 'maximum_quantity': maximumQuantity,
      if (purchasePrice != null) 'purchase_price': purchasePrice,
      if (supplier != null) 'supplier': supplier,
      if (purchaseDate != null) 'purchase_date': purchaseDate,
      if (expiryDate != null) 'expiry_date': expiryDate,
      if (storageLocation != null) 'storage_location': storageLocation,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InventoryItemsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? categoryId,
      Value<String>? unit,
      Value<double>? currentQuantity,
      Value<double>? minimumQuantity,
      Value<double?>? maximumQuantity,
      Value<double>? purchasePrice,
      Value<String?>? supplier,
      Value<DateTime>? purchaseDate,
      Value<DateTime?>? expiryDate,
      Value<String?>? storageLocation,
      Value<String>? status,
      Value<String?>? notes,
      Value<int>? rowid}) {
    return InventoryItemsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      categoryId: categoryId ?? this.categoryId,
      unit: unit ?? this.unit,
      currentQuantity: currentQuantity ?? this.currentQuantity,
      minimumQuantity: minimumQuantity ?? this.minimumQuantity,
      maximumQuantity: maximumQuantity ?? this.maximumQuantity,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      supplier: supplier ?? this.supplier,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      expiryDate: expiryDate ?? this.expiryDate,
      storageLocation: storageLocation ?? this.storageLocation,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (currentQuantity.present) {
      map['current_quantity'] = Variable<double>(currentQuantity.value);
    }
    if (minimumQuantity.present) {
      map['minimum_quantity'] = Variable<double>(minimumQuantity.value);
    }
    if (maximumQuantity.present) {
      map['maximum_quantity'] = Variable<double>(maximumQuantity.value);
    }
    if (purchasePrice.present) {
      map['purchase_price'] = Variable<double>(purchasePrice.value);
    }
    if (supplier.present) {
      map['supplier'] = Variable<String>(supplier.value);
    }
    if (purchaseDate.present) {
      map['purchase_date'] = Variable<DateTime>(purchaseDate.value);
    }
    if (expiryDate.present) {
      map['expiry_date'] = Variable<DateTime>(expiryDate.value);
    }
    if (storageLocation.present) {
      map['storage_location'] = Variable<String>(storageLocation.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('categoryId: $categoryId, ')
          ..write('unit: $unit, ')
          ..write('currentQuantity: $currentQuantity, ')
          ..write('minimumQuantity: $minimumQuantity, ')
          ..write('maximumQuantity: $maximumQuantity, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('supplier: $supplier, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('storageLocation: $storageLocation, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InventoryTransactionsTableTable extends InventoryTransactionsTable
    with
        TableInfo<$InventoryTransactionsTableTable,
            InventoryTransactionDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryTransactionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
      'item_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES inventory_items_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _batchIdMeta =
      const VerificationMeta('batchId');
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
      'batch_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES batches_table (id) ON DELETE SET NULL'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
      'reason', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, itemId, quantity, type, batchId, date, reason];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_transactions_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<InventoryTransactionDbModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('batch_id')) {
      context.handle(_batchIdMeta,
          batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(_reasonMeta,
          reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryTransactionDbModel map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryTransactionDbModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      batchId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}batch_id']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      reason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reason']),
    );
  }

  @override
  $InventoryTransactionsTableTable createAlias(String alias) {
    return $InventoryTransactionsTableTable(attachedDatabase, alias);
  }
}

class InventoryTransactionDbModel extends DataClass
    implements Insertable<InventoryTransactionDbModel> {
  final String id;
  final String itemId;
  final double quantity;
  final String type;
  final String? batchId;
  final DateTime date;
  final String? reason;
  const InventoryTransactionDbModel(
      {required this.id,
      required this.itemId,
      required this.quantity,
      required this.type,
      this.batchId,
      required this.date,
      this.reason});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['item_id'] = Variable<String>(itemId);
    map['quantity'] = Variable<double>(quantity);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || batchId != null) {
      map['batch_id'] = Variable<String>(batchId);
    }
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || reason != null) {
      map['reason'] = Variable<String>(reason);
    }
    return map;
  }

  InventoryTransactionsTableCompanion toCompanion(bool nullToAbsent) {
    return InventoryTransactionsTableCompanion(
      id: Value(id),
      itemId: Value(itemId),
      quantity: Value(quantity),
      type: Value(type),
      batchId: batchId == null && nullToAbsent
          ? const Value.absent()
          : Value(batchId),
      date: Value(date),
      reason:
          reason == null && nullToAbsent ? const Value.absent() : Value(reason),
    );
  }

  factory InventoryTransactionDbModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryTransactionDbModel(
      id: serializer.fromJson<String>(json['id']),
      itemId: serializer.fromJson<String>(json['itemId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      type: serializer.fromJson<String>(json['type']),
      batchId: serializer.fromJson<String?>(json['batchId']),
      date: serializer.fromJson<DateTime>(json['date']),
      reason: serializer.fromJson<String?>(json['reason']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'itemId': serializer.toJson<String>(itemId),
      'quantity': serializer.toJson<double>(quantity),
      'type': serializer.toJson<String>(type),
      'batchId': serializer.toJson<String?>(batchId),
      'date': serializer.toJson<DateTime>(date),
      'reason': serializer.toJson<String?>(reason),
    };
  }

  InventoryTransactionDbModel copyWith(
          {String? id,
          String? itemId,
          double? quantity,
          String? type,
          Value<String?> batchId = const Value.absent(),
          DateTime? date,
          Value<String?> reason = const Value.absent()}) =>
      InventoryTransactionDbModel(
        id: id ?? this.id,
        itemId: itemId ?? this.itemId,
        quantity: quantity ?? this.quantity,
        type: type ?? this.type,
        batchId: batchId.present ? batchId.value : this.batchId,
        date: date ?? this.date,
        reason: reason.present ? reason.value : this.reason,
      );
  InventoryTransactionDbModel copyWithCompanion(
      InventoryTransactionsTableCompanion data) {
    return InventoryTransactionDbModel(
      id: data.id.present ? data.id.value : this.id,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      type: data.type.present ? data.type.value : this.type,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      date: data.date.present ? data.date.value : this.date,
      reason: data.reason.present ? data.reason.value : this.reason,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryTransactionDbModel(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('quantity: $quantity, ')
          ..write('type: $type, ')
          ..write('batchId: $batchId, ')
          ..write('date: $date, ')
          ..write('reason: $reason')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, itemId, quantity, type, batchId, date, reason);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryTransactionDbModel &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.quantity == this.quantity &&
          other.type == this.type &&
          other.batchId == this.batchId &&
          other.date == this.date &&
          other.reason == this.reason);
}

class InventoryTransactionsTableCompanion
    extends UpdateCompanion<InventoryTransactionDbModel> {
  final Value<String> id;
  final Value<String> itemId;
  final Value<double> quantity;
  final Value<String> type;
  final Value<String?> batchId;
  final Value<DateTime> date;
  final Value<String?> reason;
  final Value<int> rowid;
  const InventoryTransactionsTableCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.type = const Value.absent(),
    this.batchId = const Value.absent(),
    this.date = const Value.absent(),
    this.reason = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InventoryTransactionsTableCompanion.insert({
    required String id,
    required String itemId,
    required double quantity,
    required String type,
    this.batchId = const Value.absent(),
    required DateTime date,
    this.reason = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        itemId = Value(itemId),
        quantity = Value(quantity),
        type = Value(type),
        date = Value(date);
  static Insertable<InventoryTransactionDbModel> custom({
    Expression<String>? id,
    Expression<String>? itemId,
    Expression<double>? quantity,
    Expression<String>? type,
    Expression<String>? batchId,
    Expression<DateTime>? date,
    Expression<String>? reason,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (quantity != null) 'quantity': quantity,
      if (type != null) 'type': type,
      if (batchId != null) 'batch_id': batchId,
      if (date != null) 'date': date,
      if (reason != null) 'reason': reason,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InventoryTransactionsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? itemId,
      Value<double>? quantity,
      Value<String>? type,
      Value<String?>? batchId,
      Value<DateTime>? date,
      Value<String?>? reason,
      Value<int>? rowid}) {
    return InventoryTransactionsTableCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      quantity: quantity ?? this.quantity,
      type: type ?? this.type,
      batchId: batchId ?? this.batchId,
      date: date ?? this.date,
      reason: reason ?? this.reason,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryTransactionsTableCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('quantity: $quantity, ')
          ..write('type: $type, ')
          ..write('batchId: $batchId, ')
          ..write('date: $date, ')
          ..write('reason: $reason, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkersTableTable extends WorkersTable
    with TableInfo<$WorkersTableTable, WorkerDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dailyWageMeta =
      const VerificationMeta('dailyWage');
  @override
  late final GeneratedColumn<double> dailyWage = GeneratedColumn<double>(
      'daily_wage', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _joiningDateMeta =
      const VerificationMeta('joiningDate');
  @override
  late final GeneratedColumn<DateTime> joiningDate = GeneratedColumn<DateTime>(
      'joining_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emergencyContactMeta =
      const VerificationMeta('emergencyContact');
  @override
  late final GeneratedColumn<String> emergencyContact = GeneratedColumn<String>(
      'emergency_contact', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        fullName,
        phoneNumber,
        address,
        role,
        dailyWage,
        joiningDate,
        status,
        emergencyContact,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workers_table';
  @override
  VerificationContext validateIntegrity(Insertable<WorkerDbModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('daily_wage')) {
      context.handle(_dailyWageMeta,
          dailyWage.isAcceptableOrUnknown(data['daily_wage']!, _dailyWageMeta));
    } else if (isInserting) {
      context.missing(_dailyWageMeta);
    }
    if (data.containsKey('joining_date')) {
      context.handle(
          _joiningDateMeta,
          joiningDate.isAcceptableOrUnknown(
              data['joining_date']!, _joiningDateMeta));
    } else if (isInserting) {
      context.missing(_joiningDateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('emergency_contact')) {
      context.handle(
          _emergencyContactMeta,
          emergencyContact.isAcceptableOrUnknown(
              data['emergency_contact']!, _emergencyContactMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkerDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkerDbModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!,
      dailyWage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}daily_wage'])!,
      joiningDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}joining_date'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      emergencyContact: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}emergency_contact']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $WorkersTableTable createAlias(String alias) {
    return $WorkersTableTable(attachedDatabase, alias);
  }
}

class WorkerDbModel extends DataClass implements Insertable<WorkerDbModel> {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String? address;
  final String role;
  final double dailyWage;
  final DateTime joiningDate;
  final String status;
  final String? emergencyContact;
  final String? notes;
  const WorkerDbModel(
      {required this.id,
      required this.fullName,
      required this.phoneNumber,
      this.address,
      required this.role,
      required this.dailyWage,
      required this.joiningDate,
      required this.status,
      this.emergencyContact,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['full_name'] = Variable<String>(fullName);
    map['phone_number'] = Variable<String>(phoneNumber);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    map['role'] = Variable<String>(role);
    map['daily_wage'] = Variable<double>(dailyWage);
    map['joining_date'] = Variable<DateTime>(joiningDate);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || emergencyContact != null) {
      map['emergency_contact'] = Variable<String>(emergencyContact);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  WorkersTableCompanion toCompanion(bool nullToAbsent) {
    return WorkersTableCompanion(
      id: Value(id),
      fullName: Value(fullName),
      phoneNumber: Value(phoneNumber),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      role: Value(role),
      dailyWage: Value(dailyWage),
      joiningDate: Value(joiningDate),
      status: Value(status),
      emergencyContact: emergencyContact == null && nullToAbsent
          ? const Value.absent()
          : Value(emergencyContact),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory WorkerDbModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkerDbModel(
      id: serializer.fromJson<String>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      address: serializer.fromJson<String?>(json['address']),
      role: serializer.fromJson<String>(json['role']),
      dailyWage: serializer.fromJson<double>(json['dailyWage']),
      joiningDate: serializer.fromJson<DateTime>(json['joiningDate']),
      status: serializer.fromJson<String>(json['status']),
      emergencyContact: serializer.fromJson<String?>(json['emergencyContact']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'fullName': serializer.toJson<String>(fullName),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'address': serializer.toJson<String?>(address),
      'role': serializer.toJson<String>(role),
      'dailyWage': serializer.toJson<double>(dailyWage),
      'joiningDate': serializer.toJson<DateTime>(joiningDate),
      'status': serializer.toJson<String>(status),
      'emergencyContact': serializer.toJson<String?>(emergencyContact),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  WorkerDbModel copyWith(
          {String? id,
          String? fullName,
          String? phoneNumber,
          Value<String?> address = const Value.absent(),
          String? role,
          double? dailyWage,
          DateTime? joiningDate,
          String? status,
          Value<String?> emergencyContact = const Value.absent(),
          Value<String?> notes = const Value.absent()}) =>
      WorkerDbModel(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        address: address.present ? address.value : this.address,
        role: role ?? this.role,
        dailyWage: dailyWage ?? this.dailyWage,
        joiningDate: joiningDate ?? this.joiningDate,
        status: status ?? this.status,
        emergencyContact: emergencyContact.present
            ? emergencyContact.value
            : this.emergencyContact,
        notes: notes.present ? notes.value : this.notes,
      );
  WorkerDbModel copyWithCompanion(WorkersTableCompanion data) {
    return WorkerDbModel(
      id: data.id.present ? data.id.value : this.id,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      address: data.address.present ? data.address.value : this.address,
      role: data.role.present ? data.role.value : this.role,
      dailyWage: data.dailyWage.present ? data.dailyWage.value : this.dailyWage,
      joiningDate:
          data.joiningDate.present ? data.joiningDate.value : this.joiningDate,
      status: data.status.present ? data.status.value : this.status,
      emergencyContact: data.emergencyContact.present
          ? data.emergencyContact.value
          : this.emergencyContact,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkerDbModel(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('address: $address, ')
          ..write('role: $role, ')
          ..write('dailyWage: $dailyWage, ')
          ..write('joiningDate: $joiningDate, ')
          ..write('status: $status, ')
          ..write('emergencyContact: $emergencyContact, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, fullName, phoneNumber, address, role,
      dailyWage, joiningDate, status, emergencyContact, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkerDbModel &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.phoneNumber == this.phoneNumber &&
          other.address == this.address &&
          other.role == this.role &&
          other.dailyWage == this.dailyWage &&
          other.joiningDate == this.joiningDate &&
          other.status == this.status &&
          other.emergencyContact == this.emergencyContact &&
          other.notes == this.notes);
}

class WorkersTableCompanion extends UpdateCompanion<WorkerDbModel> {
  final Value<String> id;
  final Value<String> fullName;
  final Value<String> phoneNumber;
  final Value<String?> address;
  final Value<String> role;
  final Value<double> dailyWage;
  final Value<DateTime> joiningDate;
  final Value<String> status;
  final Value<String?> emergencyContact;
  final Value<String?> notes;
  final Value<int> rowid;
  const WorkersTableCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.address = const Value.absent(),
    this.role = const Value.absent(),
    this.dailyWage = const Value.absent(),
    this.joiningDate = const Value.absent(),
    this.status = const Value.absent(),
    this.emergencyContact = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkersTableCompanion.insert({
    required String id,
    required String fullName,
    required String phoneNumber,
    this.address = const Value.absent(),
    required String role,
    required double dailyWage,
    required DateTime joiningDate,
    required String status,
    this.emergencyContact = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        fullName = Value(fullName),
        phoneNumber = Value(phoneNumber),
        role = Value(role),
        dailyWage = Value(dailyWage),
        joiningDate = Value(joiningDate),
        status = Value(status);
  static Insertable<WorkerDbModel> custom({
    Expression<String>? id,
    Expression<String>? fullName,
    Expression<String>? phoneNumber,
    Expression<String>? address,
    Expression<String>? role,
    Expression<double>? dailyWage,
    Expression<DateTime>? joiningDate,
    Expression<String>? status,
    Expression<String>? emergencyContact,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (address != null) 'address': address,
      if (role != null) 'role': role,
      if (dailyWage != null) 'daily_wage': dailyWage,
      if (joiningDate != null) 'joining_date': joiningDate,
      if (status != null) 'status': status,
      if (emergencyContact != null) 'emergency_contact': emergencyContact,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkersTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? fullName,
      Value<String>? phoneNumber,
      Value<String?>? address,
      Value<String>? role,
      Value<double>? dailyWage,
      Value<DateTime>? joiningDate,
      Value<String>? status,
      Value<String?>? emergencyContact,
      Value<String?>? notes,
      Value<int>? rowid}) {
    return WorkersTableCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      role: role ?? this.role,
      dailyWage: dailyWage ?? this.dailyWage,
      joiningDate: joiningDate ?? this.joiningDate,
      status: status ?? this.status,
      emergencyContact: emergencyContact ?? this.emergencyContact,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (dailyWage.present) {
      map['daily_wage'] = Variable<double>(dailyWage.value);
    }
    if (joiningDate.present) {
      map['joining_date'] = Variable<DateTime>(joiningDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (emergencyContact.present) {
      map['emergency_contact'] = Variable<String>(emergencyContact.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkersTableCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('address: $address, ')
          ..write('role: $role, ')
          ..write('dailyWage: $dailyWage, ')
          ..write('joiningDate: $joiningDate, ')
          ..write('status: $status, ')
          ..write('emergencyContact: $emergencyContact, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AttendanceTableTable extends AttendanceTable
    with TableInfo<$AttendanceTableTable, AttendanceDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttendanceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workerIdMeta =
      const VerificationMeta('workerId');
  @override
  late final GeneratedColumn<String> workerId = GeneratedColumn<String>(
      'worker_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES workers_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _checkInMeta =
      const VerificationMeta('checkIn');
  @override
  late final GeneratedColumn<DateTime> checkIn = GeneratedColumn<DateTime>(
      'check_in', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _checkOutMeta =
      const VerificationMeta('checkOut');
  @override
  late final GeneratedColumn<DateTime> checkOut = GeneratedColumn<DateTime>(
      'check_out', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _hoursWorkedMeta =
      const VerificationMeta('hoursWorked');
  @override
  late final GeneratedColumn<double> hoursWorked = GeneratedColumn<double>(
      'hours_worked', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _overtimeHoursMeta =
      const VerificationMeta('overtimeHours');
  @override
  late final GeneratedColumn<double> overtimeHours = GeneratedColumn<double>(
      'overtime_hours', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _leaveStatusMeta =
      const VerificationMeta('leaveStatus');
  @override
  late final GeneratedColumn<String> leaveStatus = GeneratedColumn<String>(
      'leave_status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _remarksMeta =
      const VerificationMeta('remarks');
  @override
  late final GeneratedColumn<String> remarks = GeneratedColumn<String>(
      'remarks', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        workerId,
        date,
        checkIn,
        checkOut,
        hoursWorked,
        overtimeHours,
        leaveStatus,
        remarks
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attendance_table';
  @override
  VerificationContext validateIntegrity(Insertable<AttendanceDbModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('worker_id')) {
      context.handle(_workerIdMeta,
          workerId.isAcceptableOrUnknown(data['worker_id']!, _workerIdMeta));
    } else if (isInserting) {
      context.missing(_workerIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('check_in')) {
      context.handle(_checkInMeta,
          checkIn.isAcceptableOrUnknown(data['check_in']!, _checkInMeta));
    }
    if (data.containsKey('check_out')) {
      context.handle(_checkOutMeta,
          checkOut.isAcceptableOrUnknown(data['check_out']!, _checkOutMeta));
    }
    if (data.containsKey('hours_worked')) {
      context.handle(
          _hoursWorkedMeta,
          hoursWorked.isAcceptableOrUnknown(
              data['hours_worked']!, _hoursWorkedMeta));
    }
    if (data.containsKey('overtime_hours')) {
      context.handle(
          _overtimeHoursMeta,
          overtimeHours.isAcceptableOrUnknown(
              data['overtime_hours']!, _overtimeHoursMeta));
    }
    if (data.containsKey('leave_status')) {
      context.handle(
          _leaveStatusMeta,
          leaveStatus.isAcceptableOrUnknown(
              data['leave_status']!, _leaveStatusMeta));
    } else if (isInserting) {
      context.missing(_leaveStatusMeta);
    }
    if (data.containsKey('remarks')) {
      context.handle(_remarksMeta,
          remarks.isAcceptableOrUnknown(data['remarks']!, _remarksMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AttendanceDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttendanceDbModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      workerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}worker_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      checkIn: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}check_in']),
      checkOut: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}check_out']),
      hoursWorked: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}hours_worked'])!,
      overtimeHours: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}overtime_hours'])!,
      leaveStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}leave_status'])!,
      remarks: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remarks']),
    );
  }

  @override
  $AttendanceTableTable createAlias(String alias) {
    return $AttendanceTableTable(attachedDatabase, alias);
  }
}

class AttendanceDbModel extends DataClass
    implements Insertable<AttendanceDbModel> {
  final String id;
  final String workerId;
  final DateTime date;
  final DateTime? checkIn;
  final DateTime? checkOut;
  final double hoursWorked;
  final double overtimeHours;
  final String leaveStatus;
  final String? remarks;
  const AttendanceDbModel(
      {required this.id,
      required this.workerId,
      required this.date,
      this.checkIn,
      this.checkOut,
      required this.hoursWorked,
      required this.overtimeHours,
      required this.leaveStatus,
      this.remarks});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['worker_id'] = Variable<String>(workerId);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || checkIn != null) {
      map['check_in'] = Variable<DateTime>(checkIn);
    }
    if (!nullToAbsent || checkOut != null) {
      map['check_out'] = Variable<DateTime>(checkOut);
    }
    map['hours_worked'] = Variable<double>(hoursWorked);
    map['overtime_hours'] = Variable<double>(overtimeHours);
    map['leave_status'] = Variable<String>(leaveStatus);
    if (!nullToAbsent || remarks != null) {
      map['remarks'] = Variable<String>(remarks);
    }
    return map;
  }

  AttendanceTableCompanion toCompanion(bool nullToAbsent) {
    return AttendanceTableCompanion(
      id: Value(id),
      workerId: Value(workerId),
      date: Value(date),
      checkIn: checkIn == null && nullToAbsent
          ? const Value.absent()
          : Value(checkIn),
      checkOut: checkOut == null && nullToAbsent
          ? const Value.absent()
          : Value(checkOut),
      hoursWorked: Value(hoursWorked),
      overtimeHours: Value(overtimeHours),
      leaveStatus: Value(leaveStatus),
      remarks: remarks == null && nullToAbsent
          ? const Value.absent()
          : Value(remarks),
    );
  }

  factory AttendanceDbModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttendanceDbModel(
      id: serializer.fromJson<String>(json['id']),
      workerId: serializer.fromJson<String>(json['workerId']),
      date: serializer.fromJson<DateTime>(json['date']),
      checkIn: serializer.fromJson<DateTime?>(json['checkIn']),
      checkOut: serializer.fromJson<DateTime?>(json['checkOut']),
      hoursWorked: serializer.fromJson<double>(json['hoursWorked']),
      overtimeHours: serializer.fromJson<double>(json['overtimeHours']),
      leaveStatus: serializer.fromJson<String>(json['leaveStatus']),
      remarks: serializer.fromJson<String?>(json['remarks']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'workerId': serializer.toJson<String>(workerId),
      'date': serializer.toJson<DateTime>(date),
      'checkIn': serializer.toJson<DateTime?>(checkIn),
      'checkOut': serializer.toJson<DateTime?>(checkOut),
      'hoursWorked': serializer.toJson<double>(hoursWorked),
      'overtimeHours': serializer.toJson<double>(overtimeHours),
      'leaveStatus': serializer.toJson<String>(leaveStatus),
      'remarks': serializer.toJson<String?>(remarks),
    };
  }

  AttendanceDbModel copyWith(
          {String? id,
          String? workerId,
          DateTime? date,
          Value<DateTime?> checkIn = const Value.absent(),
          Value<DateTime?> checkOut = const Value.absent(),
          double? hoursWorked,
          double? overtimeHours,
          String? leaveStatus,
          Value<String?> remarks = const Value.absent()}) =>
      AttendanceDbModel(
        id: id ?? this.id,
        workerId: workerId ?? this.workerId,
        date: date ?? this.date,
        checkIn: checkIn.present ? checkIn.value : this.checkIn,
        checkOut: checkOut.present ? checkOut.value : this.checkOut,
        hoursWorked: hoursWorked ?? this.hoursWorked,
        overtimeHours: overtimeHours ?? this.overtimeHours,
        leaveStatus: leaveStatus ?? this.leaveStatus,
        remarks: remarks.present ? remarks.value : this.remarks,
      );
  AttendanceDbModel copyWithCompanion(AttendanceTableCompanion data) {
    return AttendanceDbModel(
      id: data.id.present ? data.id.value : this.id,
      workerId: data.workerId.present ? data.workerId.value : this.workerId,
      date: data.date.present ? data.date.value : this.date,
      checkIn: data.checkIn.present ? data.checkIn.value : this.checkIn,
      checkOut: data.checkOut.present ? data.checkOut.value : this.checkOut,
      hoursWorked:
          data.hoursWorked.present ? data.hoursWorked.value : this.hoursWorked,
      overtimeHours: data.overtimeHours.present
          ? data.overtimeHours.value
          : this.overtimeHours,
      leaveStatus:
          data.leaveStatus.present ? data.leaveStatus.value : this.leaveStatus,
      remarks: data.remarks.present ? data.remarks.value : this.remarks,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceDbModel(')
          ..write('id: $id, ')
          ..write('workerId: $workerId, ')
          ..write('date: $date, ')
          ..write('checkIn: $checkIn, ')
          ..write('checkOut: $checkOut, ')
          ..write('hoursWorked: $hoursWorked, ')
          ..write('overtimeHours: $overtimeHours, ')
          ..write('leaveStatus: $leaveStatus, ')
          ..write('remarks: $remarks')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, workerId, date, checkIn, checkOut,
      hoursWorked, overtimeHours, leaveStatus, remarks);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttendanceDbModel &&
          other.id == this.id &&
          other.workerId == this.workerId &&
          other.date == this.date &&
          other.checkIn == this.checkIn &&
          other.checkOut == this.checkOut &&
          other.hoursWorked == this.hoursWorked &&
          other.overtimeHours == this.overtimeHours &&
          other.leaveStatus == this.leaveStatus &&
          other.remarks == this.remarks);
}

class AttendanceTableCompanion extends UpdateCompanion<AttendanceDbModel> {
  final Value<String> id;
  final Value<String> workerId;
  final Value<DateTime> date;
  final Value<DateTime?> checkIn;
  final Value<DateTime?> checkOut;
  final Value<double> hoursWorked;
  final Value<double> overtimeHours;
  final Value<String> leaveStatus;
  final Value<String?> remarks;
  final Value<int> rowid;
  const AttendanceTableCompanion({
    this.id = const Value.absent(),
    this.workerId = const Value.absent(),
    this.date = const Value.absent(),
    this.checkIn = const Value.absent(),
    this.checkOut = const Value.absent(),
    this.hoursWorked = const Value.absent(),
    this.overtimeHours = const Value.absent(),
    this.leaveStatus = const Value.absent(),
    this.remarks = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AttendanceTableCompanion.insert({
    required String id,
    required String workerId,
    required DateTime date,
    this.checkIn = const Value.absent(),
    this.checkOut = const Value.absent(),
    this.hoursWorked = const Value.absent(),
    this.overtimeHours = const Value.absent(),
    required String leaveStatus,
    this.remarks = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        workerId = Value(workerId),
        date = Value(date),
        leaveStatus = Value(leaveStatus);
  static Insertable<AttendanceDbModel> custom({
    Expression<String>? id,
    Expression<String>? workerId,
    Expression<DateTime>? date,
    Expression<DateTime>? checkIn,
    Expression<DateTime>? checkOut,
    Expression<double>? hoursWorked,
    Expression<double>? overtimeHours,
    Expression<String>? leaveStatus,
    Expression<String>? remarks,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workerId != null) 'worker_id': workerId,
      if (date != null) 'date': date,
      if (checkIn != null) 'check_in': checkIn,
      if (checkOut != null) 'check_out': checkOut,
      if (hoursWorked != null) 'hours_worked': hoursWorked,
      if (overtimeHours != null) 'overtime_hours': overtimeHours,
      if (leaveStatus != null) 'leave_status': leaveStatus,
      if (remarks != null) 'remarks': remarks,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AttendanceTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? workerId,
      Value<DateTime>? date,
      Value<DateTime?>? checkIn,
      Value<DateTime?>? checkOut,
      Value<double>? hoursWorked,
      Value<double>? overtimeHours,
      Value<String>? leaveStatus,
      Value<String?>? remarks,
      Value<int>? rowid}) {
    return AttendanceTableCompanion(
      id: id ?? this.id,
      workerId: workerId ?? this.workerId,
      date: date ?? this.date,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
      hoursWorked: hoursWorked ?? this.hoursWorked,
      overtimeHours: overtimeHours ?? this.overtimeHours,
      leaveStatus: leaveStatus ?? this.leaveStatus,
      remarks: remarks ?? this.remarks,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (workerId.present) {
      map['worker_id'] = Variable<String>(workerId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (checkIn.present) {
      map['check_in'] = Variable<DateTime>(checkIn.value);
    }
    if (checkOut.present) {
      map['check_out'] = Variable<DateTime>(checkOut.value);
    }
    if (hoursWorked.present) {
      map['hours_worked'] = Variable<double>(hoursWorked.value);
    }
    if (overtimeHours.present) {
      map['overtime_hours'] = Variable<double>(overtimeHours.value);
    }
    if (leaveStatus.present) {
      map['leave_status'] = Variable<String>(leaveStatus.value);
    }
    if (remarks.present) {
      map['remarks'] = Variable<String>(remarks.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceTableCompanion(')
          ..write('id: $id, ')
          ..write('workerId: $workerId, ')
          ..write('date: $date, ')
          ..write('checkIn: $checkIn, ')
          ..write('checkOut: $checkOut, ')
          ..write('hoursWorked: $hoursWorked, ')
          ..write('overtimeHours: $overtimeHours, ')
          ..write('leaveStatus: $leaveStatus, ')
          ..write('remarks: $remarks, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AssignmentsTableTable extends AssignmentsTable
    with TableInfo<$AssignmentsTableTable, AssignmentDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssignmentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workerIdMeta =
      const VerificationMeta('workerId');
  @override
  late final GeneratedColumn<String> workerId = GeneratedColumn<String>(
      'worker_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES workers_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _batchIdMeta =
      const VerificationMeta('batchId');
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
      'batch_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _taskMeta = const VerificationMeta('task');
  @override
  late final GeneratedColumn<String> task = GeneratedColumn<String>(
      'task', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
      'end_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _durationHoursMeta =
      const VerificationMeta('durationHours');
  @override
  late final GeneratedColumn<double> durationHours = GeneratedColumn<double>(
      'duration_hours', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, workerId, batchId, task, startTime, endTime, durationHours, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assignments_table';
  @override
  VerificationContext validateIntegrity(Insertable<AssignmentDbModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('worker_id')) {
      context.handle(_workerIdMeta,
          workerId.isAcceptableOrUnknown(data['worker_id']!, _workerIdMeta));
    } else if (isInserting) {
      context.missing(_workerIdMeta);
    }
    if (data.containsKey('batch_id')) {
      context.handle(_batchIdMeta,
          batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta));
    }
    if (data.containsKey('task')) {
      context.handle(
          _taskMeta, task.isAcceptableOrUnknown(data['task']!, _taskMeta));
    } else if (isInserting) {
      context.missing(_taskMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    }
    if (data.containsKey('duration_hours')) {
      context.handle(
          _durationHoursMeta,
          durationHours.isAcceptableOrUnknown(
              data['duration_hours']!, _durationHoursMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AssignmentDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssignmentDbModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      workerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}worker_id'])!,
      batchId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}batch_id']),
      task: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_time']),
      durationHours: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}duration_hours']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $AssignmentsTableTable createAlias(String alias) {
    return $AssignmentsTableTable(attachedDatabase, alias);
  }
}

class AssignmentDbModel extends DataClass
    implements Insertable<AssignmentDbModel> {
  final String id;
  final String workerId;
  final String? batchId;
  final String task;
  final DateTime startTime;
  final DateTime? endTime;
  final double? durationHours;
  final String status;
  const AssignmentDbModel(
      {required this.id,
      required this.workerId,
      this.batchId,
      required this.task,
      required this.startTime,
      this.endTime,
      this.durationHours,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['worker_id'] = Variable<String>(workerId);
    if (!nullToAbsent || batchId != null) {
      map['batch_id'] = Variable<String>(batchId);
    }
    map['task'] = Variable<String>(task);
    map['start_time'] = Variable<DateTime>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    if (!nullToAbsent || durationHours != null) {
      map['duration_hours'] = Variable<double>(durationHours);
    }
    map['status'] = Variable<String>(status);
    return map;
  }

  AssignmentsTableCompanion toCompanion(bool nullToAbsent) {
    return AssignmentsTableCompanion(
      id: Value(id),
      workerId: Value(workerId),
      batchId: batchId == null && nullToAbsent
          ? const Value.absent()
          : Value(batchId),
      task: Value(task),
      startTime: Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      durationHours: durationHours == null && nullToAbsent
          ? const Value.absent()
          : Value(durationHours),
      status: Value(status),
    );
  }

  factory AssignmentDbModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssignmentDbModel(
      id: serializer.fromJson<String>(json['id']),
      workerId: serializer.fromJson<String>(json['workerId']),
      batchId: serializer.fromJson<String?>(json['batchId']),
      task: serializer.fromJson<String>(json['task']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime?>(json['endTime']),
      durationHours: serializer.fromJson<double?>(json['durationHours']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'workerId': serializer.toJson<String>(workerId),
      'batchId': serializer.toJson<String?>(batchId),
      'task': serializer.toJson<String>(task),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime?>(endTime),
      'durationHours': serializer.toJson<double?>(durationHours),
      'status': serializer.toJson<String>(status),
    };
  }

  AssignmentDbModel copyWith(
          {String? id,
          String? workerId,
          Value<String?> batchId = const Value.absent(),
          String? task,
          DateTime? startTime,
          Value<DateTime?> endTime = const Value.absent(),
          Value<double?> durationHours = const Value.absent(),
          String? status}) =>
      AssignmentDbModel(
        id: id ?? this.id,
        workerId: workerId ?? this.workerId,
        batchId: batchId.present ? batchId.value : this.batchId,
        task: task ?? this.task,
        startTime: startTime ?? this.startTime,
        endTime: endTime.present ? endTime.value : this.endTime,
        durationHours:
            durationHours.present ? durationHours.value : this.durationHours,
        status: status ?? this.status,
      );
  AssignmentDbModel copyWithCompanion(AssignmentsTableCompanion data) {
    return AssignmentDbModel(
      id: data.id.present ? data.id.value : this.id,
      workerId: data.workerId.present ? data.workerId.value : this.workerId,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      task: data.task.present ? data.task.value : this.task,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      durationHours: data.durationHours.present
          ? data.durationHours.value
          : this.durationHours,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssignmentDbModel(')
          ..write('id: $id, ')
          ..write('workerId: $workerId, ')
          ..write('batchId: $batchId, ')
          ..write('task: $task, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('durationHours: $durationHours, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, workerId, batchId, task, startTime, endTime, durationHours, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssignmentDbModel &&
          other.id == this.id &&
          other.workerId == this.workerId &&
          other.batchId == this.batchId &&
          other.task == this.task &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.durationHours == this.durationHours &&
          other.status == this.status);
}

class AssignmentsTableCompanion extends UpdateCompanion<AssignmentDbModel> {
  final Value<String> id;
  final Value<String> workerId;
  final Value<String?> batchId;
  final Value<String> task;
  final Value<DateTime> startTime;
  final Value<DateTime?> endTime;
  final Value<double?> durationHours;
  final Value<String> status;
  final Value<int> rowid;
  const AssignmentsTableCompanion({
    this.id = const Value.absent(),
    this.workerId = const Value.absent(),
    this.batchId = const Value.absent(),
    this.task = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.durationHours = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AssignmentsTableCompanion.insert({
    required String id,
    required String workerId,
    this.batchId = const Value.absent(),
    required String task,
    required DateTime startTime,
    this.endTime = const Value.absent(),
    this.durationHours = const Value.absent(),
    required String status,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        workerId = Value(workerId),
        task = Value(task),
        startTime = Value(startTime),
        status = Value(status);
  static Insertable<AssignmentDbModel> custom({
    Expression<String>? id,
    Expression<String>? workerId,
    Expression<String>? batchId,
    Expression<String>? task,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<double>? durationHours,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workerId != null) 'worker_id': workerId,
      if (batchId != null) 'batch_id': batchId,
      if (task != null) 'task': task,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (durationHours != null) 'duration_hours': durationHours,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AssignmentsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? workerId,
      Value<String?>? batchId,
      Value<String>? task,
      Value<DateTime>? startTime,
      Value<DateTime?>? endTime,
      Value<double?>? durationHours,
      Value<String>? status,
      Value<int>? rowid}) {
    return AssignmentsTableCompanion(
      id: id ?? this.id,
      workerId: workerId ?? this.workerId,
      batchId: batchId ?? this.batchId,
      task: task ?? this.task,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      durationHours: durationHours ?? this.durationHours,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (workerId.present) {
      map['worker_id'] = Variable<String>(workerId.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (task.present) {
      map['task'] = Variable<String>(task.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (durationHours.present) {
      map['duration_hours'] = Variable<double>(durationHours.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssignmentsTableCompanion(')
          ..write('id: $id, ')
          ..write('workerId: $workerId, ')
          ..write('batchId: $batchId, ')
          ..write('task: $task, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('durationHours: $durationHours, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WagesTableTable extends WagesTable
    with TableInfo<$WagesTableTable, WageDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WagesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workerIdMeta =
      const VerificationMeta('workerId');
  @override
  late final GeneratedColumn<String> workerId = GeneratedColumn<String>(
      'worker_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES workers_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _baseWageMeta =
      const VerificationMeta('baseWage');
  @override
  late final GeneratedColumn<double> baseWage = GeneratedColumn<double>(
      'base_wage', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _overtimePayMeta =
      const VerificationMeta('overtimePay');
  @override
  late final GeneratedColumn<double> overtimePay = GeneratedColumn<double>(
      'overtime_pay', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _bonusesMeta =
      const VerificationMeta('bonuses');
  @override
  late final GeneratedColumn<double> bonuses = GeneratedColumn<double>(
      'bonuses', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _deductionsMeta =
      const VerificationMeta('deductions');
  @override
  late final GeneratedColumn<double> deductions = GeneratedColumn<double>(
      'deductions', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _netPayMeta = const VerificationMeta('netPay');
  @override
  late final GeneratedColumn<double> netPay = GeneratedColumn<double>(
      'net_pay', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _paymentDateMeta =
      const VerificationMeta('paymentDate');
  @override
  late final GeneratedColumn<DateTime> paymentDate = GeneratedColumn<DateTime>(
      'payment_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _referenceNotesMeta =
      const VerificationMeta('referenceNotes');
  @override
  late final GeneratedColumn<String> referenceNotes = GeneratedColumn<String>(
      'reference_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        workerId,
        baseWage,
        overtimePay,
        bonuses,
        deductions,
        netPay,
        paymentDate,
        paymentMethod,
        referenceNotes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'wages_table';
  @override
  VerificationContext validateIntegrity(Insertable<WageDbModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('worker_id')) {
      context.handle(_workerIdMeta,
          workerId.isAcceptableOrUnknown(data['worker_id']!, _workerIdMeta));
    } else if (isInserting) {
      context.missing(_workerIdMeta);
    }
    if (data.containsKey('base_wage')) {
      context.handle(_baseWageMeta,
          baseWage.isAcceptableOrUnknown(data['base_wage']!, _baseWageMeta));
    } else if (isInserting) {
      context.missing(_baseWageMeta);
    }
    if (data.containsKey('overtime_pay')) {
      context.handle(
          _overtimePayMeta,
          overtimePay.isAcceptableOrUnknown(
              data['overtime_pay']!, _overtimePayMeta));
    } else if (isInserting) {
      context.missing(_overtimePayMeta);
    }
    if (data.containsKey('bonuses')) {
      context.handle(_bonusesMeta,
          bonuses.isAcceptableOrUnknown(data['bonuses']!, _bonusesMeta));
    } else if (isInserting) {
      context.missing(_bonusesMeta);
    }
    if (data.containsKey('deductions')) {
      context.handle(
          _deductionsMeta,
          deductions.isAcceptableOrUnknown(
              data['deductions']!, _deductionsMeta));
    } else if (isInserting) {
      context.missing(_deductionsMeta);
    }
    if (data.containsKey('net_pay')) {
      context.handle(_netPayMeta,
          netPay.isAcceptableOrUnknown(data['net_pay']!, _netPayMeta));
    } else if (isInserting) {
      context.missing(_netPayMeta);
    }
    if (data.containsKey('payment_date')) {
      context.handle(
          _paymentDateMeta,
          paymentDate.isAcceptableOrUnknown(
              data['payment_date']!, _paymentDateMeta));
    } else if (isInserting) {
      context.missing(_paymentDateMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    if (data.containsKey('reference_notes')) {
      context.handle(
          _referenceNotesMeta,
          referenceNotes.isAcceptableOrUnknown(
              data['reference_notes']!, _referenceNotesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WageDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WageDbModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      workerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}worker_id'])!,
      baseWage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}base_wage'])!,
      overtimePay: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}overtime_pay'])!,
      bonuses: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}bonuses'])!,
      deductions: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}deductions'])!,
      netPay: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}net_pay'])!,
      paymentDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}payment_date'])!,
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method'])!,
      referenceNotes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reference_notes']),
    );
  }

  @override
  $WagesTableTable createAlias(String alias) {
    return $WagesTableTable(attachedDatabase, alias);
  }
}

class WageDbModel extends DataClass implements Insertable<WageDbModel> {
  final String id;
  final String workerId;
  final double baseWage;
  final double overtimePay;
  final double bonuses;
  final double deductions;
  final double netPay;
  final DateTime paymentDate;
  final String paymentMethod;
  final String? referenceNotes;
  const WageDbModel(
      {required this.id,
      required this.workerId,
      required this.baseWage,
      required this.overtimePay,
      required this.bonuses,
      required this.deductions,
      required this.netPay,
      required this.paymentDate,
      required this.paymentMethod,
      this.referenceNotes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['worker_id'] = Variable<String>(workerId);
    map['base_wage'] = Variable<double>(baseWage);
    map['overtime_pay'] = Variable<double>(overtimePay);
    map['bonuses'] = Variable<double>(bonuses);
    map['deductions'] = Variable<double>(deductions);
    map['net_pay'] = Variable<double>(netPay);
    map['payment_date'] = Variable<DateTime>(paymentDate);
    map['payment_method'] = Variable<String>(paymentMethod);
    if (!nullToAbsent || referenceNotes != null) {
      map['reference_notes'] = Variable<String>(referenceNotes);
    }
    return map;
  }

  WagesTableCompanion toCompanion(bool nullToAbsent) {
    return WagesTableCompanion(
      id: Value(id),
      workerId: Value(workerId),
      baseWage: Value(baseWage),
      overtimePay: Value(overtimePay),
      bonuses: Value(bonuses),
      deductions: Value(deductions),
      netPay: Value(netPay),
      paymentDate: Value(paymentDate),
      paymentMethod: Value(paymentMethod),
      referenceNotes: referenceNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(referenceNotes),
    );
  }

  factory WageDbModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WageDbModel(
      id: serializer.fromJson<String>(json['id']),
      workerId: serializer.fromJson<String>(json['workerId']),
      baseWage: serializer.fromJson<double>(json['baseWage']),
      overtimePay: serializer.fromJson<double>(json['overtimePay']),
      bonuses: serializer.fromJson<double>(json['bonuses']),
      deductions: serializer.fromJson<double>(json['deductions']),
      netPay: serializer.fromJson<double>(json['netPay']),
      paymentDate: serializer.fromJson<DateTime>(json['paymentDate']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      referenceNotes: serializer.fromJson<String?>(json['referenceNotes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'workerId': serializer.toJson<String>(workerId),
      'baseWage': serializer.toJson<double>(baseWage),
      'overtimePay': serializer.toJson<double>(overtimePay),
      'bonuses': serializer.toJson<double>(bonuses),
      'deductions': serializer.toJson<double>(deductions),
      'netPay': serializer.toJson<double>(netPay),
      'paymentDate': serializer.toJson<DateTime>(paymentDate),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'referenceNotes': serializer.toJson<String?>(referenceNotes),
    };
  }

  WageDbModel copyWith(
          {String? id,
          String? workerId,
          double? baseWage,
          double? overtimePay,
          double? bonuses,
          double? deductions,
          double? netPay,
          DateTime? paymentDate,
          String? paymentMethod,
          Value<String?> referenceNotes = const Value.absent()}) =>
      WageDbModel(
        id: id ?? this.id,
        workerId: workerId ?? this.workerId,
        baseWage: baseWage ?? this.baseWage,
        overtimePay: overtimePay ?? this.overtimePay,
        bonuses: bonuses ?? this.bonuses,
        deductions: deductions ?? this.deductions,
        netPay: netPay ?? this.netPay,
        paymentDate: paymentDate ?? this.paymentDate,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        referenceNotes:
            referenceNotes.present ? referenceNotes.value : this.referenceNotes,
      );
  WageDbModel copyWithCompanion(WagesTableCompanion data) {
    return WageDbModel(
      id: data.id.present ? data.id.value : this.id,
      workerId: data.workerId.present ? data.workerId.value : this.workerId,
      baseWage: data.baseWage.present ? data.baseWage.value : this.baseWage,
      overtimePay:
          data.overtimePay.present ? data.overtimePay.value : this.overtimePay,
      bonuses: data.bonuses.present ? data.bonuses.value : this.bonuses,
      deductions:
          data.deductions.present ? data.deductions.value : this.deductions,
      netPay: data.netPay.present ? data.netPay.value : this.netPay,
      paymentDate:
          data.paymentDate.present ? data.paymentDate.value : this.paymentDate,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      referenceNotes: data.referenceNotes.present
          ? data.referenceNotes.value
          : this.referenceNotes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WageDbModel(')
          ..write('id: $id, ')
          ..write('workerId: $workerId, ')
          ..write('baseWage: $baseWage, ')
          ..write('overtimePay: $overtimePay, ')
          ..write('bonuses: $bonuses, ')
          ..write('deductions: $deductions, ')
          ..write('netPay: $netPay, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('referenceNotes: $referenceNotes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, workerId, baseWage, overtimePay, bonuses,
      deductions, netPay, paymentDate, paymentMethod, referenceNotes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WageDbModel &&
          other.id == this.id &&
          other.workerId == this.workerId &&
          other.baseWage == this.baseWage &&
          other.overtimePay == this.overtimePay &&
          other.bonuses == this.bonuses &&
          other.deductions == this.deductions &&
          other.netPay == this.netPay &&
          other.paymentDate == this.paymentDate &&
          other.paymentMethod == this.paymentMethod &&
          other.referenceNotes == this.referenceNotes);
}

class WagesTableCompanion extends UpdateCompanion<WageDbModel> {
  final Value<String> id;
  final Value<String> workerId;
  final Value<double> baseWage;
  final Value<double> overtimePay;
  final Value<double> bonuses;
  final Value<double> deductions;
  final Value<double> netPay;
  final Value<DateTime> paymentDate;
  final Value<String> paymentMethod;
  final Value<String?> referenceNotes;
  final Value<int> rowid;
  const WagesTableCompanion({
    this.id = const Value.absent(),
    this.workerId = const Value.absent(),
    this.baseWage = const Value.absent(),
    this.overtimePay = const Value.absent(),
    this.bonuses = const Value.absent(),
    this.deductions = const Value.absent(),
    this.netPay = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.referenceNotes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WagesTableCompanion.insert({
    required String id,
    required String workerId,
    required double baseWage,
    required double overtimePay,
    required double bonuses,
    required double deductions,
    required double netPay,
    required DateTime paymentDate,
    required String paymentMethod,
    this.referenceNotes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        workerId = Value(workerId),
        baseWage = Value(baseWage),
        overtimePay = Value(overtimePay),
        bonuses = Value(bonuses),
        deductions = Value(deductions),
        netPay = Value(netPay),
        paymentDate = Value(paymentDate),
        paymentMethod = Value(paymentMethod);
  static Insertable<WageDbModel> custom({
    Expression<String>? id,
    Expression<String>? workerId,
    Expression<double>? baseWage,
    Expression<double>? overtimePay,
    Expression<double>? bonuses,
    Expression<double>? deductions,
    Expression<double>? netPay,
    Expression<DateTime>? paymentDate,
    Expression<String>? paymentMethod,
    Expression<String>? referenceNotes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workerId != null) 'worker_id': workerId,
      if (baseWage != null) 'base_wage': baseWage,
      if (overtimePay != null) 'overtime_pay': overtimePay,
      if (bonuses != null) 'bonuses': bonuses,
      if (deductions != null) 'deductions': deductions,
      if (netPay != null) 'net_pay': netPay,
      if (paymentDate != null) 'payment_date': paymentDate,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (referenceNotes != null) 'reference_notes': referenceNotes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WagesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? workerId,
      Value<double>? baseWage,
      Value<double>? overtimePay,
      Value<double>? bonuses,
      Value<double>? deductions,
      Value<double>? netPay,
      Value<DateTime>? paymentDate,
      Value<String>? paymentMethod,
      Value<String?>? referenceNotes,
      Value<int>? rowid}) {
    return WagesTableCompanion(
      id: id ?? this.id,
      workerId: workerId ?? this.workerId,
      baseWage: baseWage ?? this.baseWage,
      overtimePay: overtimePay ?? this.overtimePay,
      bonuses: bonuses ?? this.bonuses,
      deductions: deductions ?? this.deductions,
      netPay: netPay ?? this.netPay,
      paymentDate: paymentDate ?? this.paymentDate,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      referenceNotes: referenceNotes ?? this.referenceNotes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (workerId.present) {
      map['worker_id'] = Variable<String>(workerId.value);
    }
    if (baseWage.present) {
      map['base_wage'] = Variable<double>(baseWage.value);
    }
    if (overtimePay.present) {
      map['overtime_pay'] = Variable<double>(overtimePay.value);
    }
    if (bonuses.present) {
      map['bonuses'] = Variable<double>(bonuses.value);
    }
    if (deductions.present) {
      map['deductions'] = Variable<double>(deductions.value);
    }
    if (netPay.present) {
      map['net_pay'] = Variable<double>(netPay.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = Variable<DateTime>(paymentDate.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (referenceNotes.present) {
      map['reference_notes'] = Variable<String>(referenceNotes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WagesTableCompanion(')
          ..write('id: $id, ')
          ..write('workerId: $workerId, ')
          ..write('baseWage: $baseWage, ')
          ..write('overtimePay: $overtimePay, ')
          ..write('bonuses: $bonuses, ')
          ..write('deductions: $deductions, ')
          ..write('netPay: $netPay, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('referenceNotes: $referenceNotes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FeedingLogsTableTable extends FeedingLogsTable
    with TableInfo<$FeedingLogsTableTable, FeedingLogDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeedingLogsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _batchIdMeta =
      const VerificationMeta('batchId');
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
      'batch_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES batches_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<String> time = GeneratedColumn<String>(
      'time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _leafTypeMeta =
      const VerificationMeta('leafType');
  @override
  late final GeneratedColumn<String> leafType = GeneratedColumn<String>(
      'leaf_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _leafAgeMeta =
      const VerificationMeta('leafAge');
  @override
  late final GeneratedColumn<String> leafAge = GeneratedColumn<String>(
      'leaf_age', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _leafQuantityMeta =
      const VerificationMeta('leafQuantity');
  @override
  late final GeneratedColumn<double> leafQuantity = GeneratedColumn<double>(
      'leaf_quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _feedingRoundMeta =
      const VerificationMeta('feedingRound');
  @override
  late final GeneratedColumn<int> feedingRound = GeneratedColumn<int>(
      'feeding_round', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _workerIdMeta =
      const VerificationMeta('workerId');
  @override
  late final GeneratedColumn<String> workerId = GeneratedColumn<String>(
      'worker_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _remarksMeta =
      const VerificationMeta('remarks');
  @override
  late final GeneratedColumn<String> remarks = GeneratedColumn<String>(
      'remarks', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        batchId,
        date,
        time,
        leafType,
        leafAge,
        leafQuantity,
        feedingRound,
        workerId,
        remarks
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'feeding_logs_table';
  @override
  VerificationContext validateIntegrity(Insertable<FeedingLogDbModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('batch_id')) {
      context.handle(_batchIdMeta,
          batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta));
    } else if (isInserting) {
      context.missing(_batchIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('leaf_type')) {
      context.handle(_leafTypeMeta,
          leafType.isAcceptableOrUnknown(data['leaf_type']!, _leafTypeMeta));
    } else if (isInserting) {
      context.missing(_leafTypeMeta);
    }
    if (data.containsKey('leaf_age')) {
      context.handle(_leafAgeMeta,
          leafAge.isAcceptableOrUnknown(data['leaf_age']!, _leafAgeMeta));
    } else if (isInserting) {
      context.missing(_leafAgeMeta);
    }
    if (data.containsKey('leaf_quantity')) {
      context.handle(
          _leafQuantityMeta,
          leafQuantity.isAcceptableOrUnknown(
              data['leaf_quantity']!, _leafQuantityMeta));
    } else if (isInserting) {
      context.missing(_leafQuantityMeta);
    }
    if (data.containsKey('feeding_round')) {
      context.handle(
          _feedingRoundMeta,
          feedingRound.isAcceptableOrUnknown(
              data['feeding_round']!, _feedingRoundMeta));
    } else if (isInserting) {
      context.missing(_feedingRoundMeta);
    }
    if (data.containsKey('worker_id')) {
      context.handle(_workerIdMeta,
          workerId.isAcceptableOrUnknown(data['worker_id']!, _workerIdMeta));
    }
    if (data.containsKey('remarks')) {
      context.handle(_remarksMeta,
          remarks.isAcceptableOrUnknown(data['remarks']!, _remarksMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeedingLogDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FeedingLogDbModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      batchId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}batch_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}time'])!,
      leafType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}leaf_type'])!,
      leafAge: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}leaf_age'])!,
      leafQuantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}leaf_quantity'])!,
      feedingRound: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}feeding_round'])!,
      workerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}worker_id']),
      remarks: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remarks']),
    );
  }

  @override
  $FeedingLogsTableTable createAlias(String alias) {
    return $FeedingLogsTableTable(attachedDatabase, alias);
  }
}

class FeedingLogDbModel extends DataClass
    implements Insertable<FeedingLogDbModel> {
  final String id;
  final String batchId;
  final DateTime date;
  final String time;
  final String leafType;
  final String leafAge;
  final double leafQuantity;
  final int feedingRound;
  final String? workerId;
  final String? remarks;
  const FeedingLogDbModel(
      {required this.id,
      required this.batchId,
      required this.date,
      required this.time,
      required this.leafType,
      required this.leafAge,
      required this.leafQuantity,
      required this.feedingRound,
      this.workerId,
      this.remarks});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['batch_id'] = Variable<String>(batchId);
    map['date'] = Variable<DateTime>(date);
    map['time'] = Variable<String>(time);
    map['leaf_type'] = Variable<String>(leafType);
    map['leaf_age'] = Variable<String>(leafAge);
    map['leaf_quantity'] = Variable<double>(leafQuantity);
    map['feeding_round'] = Variable<int>(feedingRound);
    if (!nullToAbsent || workerId != null) {
      map['worker_id'] = Variable<String>(workerId);
    }
    if (!nullToAbsent || remarks != null) {
      map['remarks'] = Variable<String>(remarks);
    }
    return map;
  }

  FeedingLogsTableCompanion toCompanion(bool nullToAbsent) {
    return FeedingLogsTableCompanion(
      id: Value(id),
      batchId: Value(batchId),
      date: Value(date),
      time: Value(time),
      leafType: Value(leafType),
      leafAge: Value(leafAge),
      leafQuantity: Value(leafQuantity),
      feedingRound: Value(feedingRound),
      workerId: workerId == null && nullToAbsent
          ? const Value.absent()
          : Value(workerId),
      remarks: remarks == null && nullToAbsent
          ? const Value.absent()
          : Value(remarks),
    );
  }

  factory FeedingLogDbModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FeedingLogDbModel(
      id: serializer.fromJson<String>(json['id']),
      batchId: serializer.fromJson<String>(json['batchId']),
      date: serializer.fromJson<DateTime>(json['date']),
      time: serializer.fromJson<String>(json['time']),
      leafType: serializer.fromJson<String>(json['leafType']),
      leafAge: serializer.fromJson<String>(json['leafAge']),
      leafQuantity: serializer.fromJson<double>(json['leafQuantity']),
      feedingRound: serializer.fromJson<int>(json['feedingRound']),
      workerId: serializer.fromJson<String?>(json['workerId']),
      remarks: serializer.fromJson<String?>(json['remarks']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'batchId': serializer.toJson<String>(batchId),
      'date': serializer.toJson<DateTime>(date),
      'time': serializer.toJson<String>(time),
      'leafType': serializer.toJson<String>(leafType),
      'leafAge': serializer.toJson<String>(leafAge),
      'leafQuantity': serializer.toJson<double>(leafQuantity),
      'feedingRound': serializer.toJson<int>(feedingRound),
      'workerId': serializer.toJson<String?>(workerId),
      'remarks': serializer.toJson<String?>(remarks),
    };
  }

  FeedingLogDbModel copyWith(
          {String? id,
          String? batchId,
          DateTime? date,
          String? time,
          String? leafType,
          String? leafAge,
          double? leafQuantity,
          int? feedingRound,
          Value<String?> workerId = const Value.absent(),
          Value<String?> remarks = const Value.absent()}) =>
      FeedingLogDbModel(
        id: id ?? this.id,
        batchId: batchId ?? this.batchId,
        date: date ?? this.date,
        time: time ?? this.time,
        leafType: leafType ?? this.leafType,
        leafAge: leafAge ?? this.leafAge,
        leafQuantity: leafQuantity ?? this.leafQuantity,
        feedingRound: feedingRound ?? this.feedingRound,
        workerId: workerId.present ? workerId.value : this.workerId,
        remarks: remarks.present ? remarks.value : this.remarks,
      );
  FeedingLogDbModel copyWithCompanion(FeedingLogsTableCompanion data) {
    return FeedingLogDbModel(
      id: data.id.present ? data.id.value : this.id,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      date: data.date.present ? data.date.value : this.date,
      time: data.time.present ? data.time.value : this.time,
      leafType: data.leafType.present ? data.leafType.value : this.leafType,
      leafAge: data.leafAge.present ? data.leafAge.value : this.leafAge,
      leafQuantity: data.leafQuantity.present
          ? data.leafQuantity.value
          : this.leafQuantity,
      feedingRound: data.feedingRound.present
          ? data.feedingRound.value
          : this.feedingRound,
      workerId: data.workerId.present ? data.workerId.value : this.workerId,
      remarks: data.remarks.present ? data.remarks.value : this.remarks,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FeedingLogDbModel(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('date: $date, ')
          ..write('time: $time, ')
          ..write('leafType: $leafType, ')
          ..write('leafAge: $leafAge, ')
          ..write('leafQuantity: $leafQuantity, ')
          ..write('feedingRound: $feedingRound, ')
          ..write('workerId: $workerId, ')
          ..write('remarks: $remarks')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, batchId, date, time, leafType, leafAge,
      leafQuantity, feedingRound, workerId, remarks);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeedingLogDbModel &&
          other.id == this.id &&
          other.batchId == this.batchId &&
          other.date == this.date &&
          other.time == this.time &&
          other.leafType == this.leafType &&
          other.leafAge == this.leafAge &&
          other.leafQuantity == this.leafQuantity &&
          other.feedingRound == this.feedingRound &&
          other.workerId == this.workerId &&
          other.remarks == this.remarks);
}

class FeedingLogsTableCompanion extends UpdateCompanion<FeedingLogDbModel> {
  final Value<String> id;
  final Value<String> batchId;
  final Value<DateTime> date;
  final Value<String> time;
  final Value<String> leafType;
  final Value<String> leafAge;
  final Value<double> leafQuantity;
  final Value<int> feedingRound;
  final Value<String?> workerId;
  final Value<String?> remarks;
  final Value<int> rowid;
  const FeedingLogsTableCompanion({
    this.id = const Value.absent(),
    this.batchId = const Value.absent(),
    this.date = const Value.absent(),
    this.time = const Value.absent(),
    this.leafType = const Value.absent(),
    this.leafAge = const Value.absent(),
    this.leafQuantity = const Value.absent(),
    this.feedingRound = const Value.absent(),
    this.workerId = const Value.absent(),
    this.remarks = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FeedingLogsTableCompanion.insert({
    required String id,
    required String batchId,
    required DateTime date,
    required String time,
    required String leafType,
    required String leafAge,
    required double leafQuantity,
    required int feedingRound,
    this.workerId = const Value.absent(),
    this.remarks = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        batchId = Value(batchId),
        date = Value(date),
        time = Value(time),
        leafType = Value(leafType),
        leafAge = Value(leafAge),
        leafQuantity = Value(leafQuantity),
        feedingRound = Value(feedingRound);
  static Insertable<FeedingLogDbModel> custom({
    Expression<String>? id,
    Expression<String>? batchId,
    Expression<DateTime>? date,
    Expression<String>? time,
    Expression<String>? leafType,
    Expression<String>? leafAge,
    Expression<double>? leafQuantity,
    Expression<int>? feedingRound,
    Expression<String>? workerId,
    Expression<String>? remarks,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (batchId != null) 'batch_id': batchId,
      if (date != null) 'date': date,
      if (time != null) 'time': time,
      if (leafType != null) 'leaf_type': leafType,
      if (leafAge != null) 'leaf_age': leafAge,
      if (leafQuantity != null) 'leaf_quantity': leafQuantity,
      if (feedingRound != null) 'feeding_round': feedingRound,
      if (workerId != null) 'worker_id': workerId,
      if (remarks != null) 'remarks': remarks,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FeedingLogsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? batchId,
      Value<DateTime>? date,
      Value<String>? time,
      Value<String>? leafType,
      Value<String>? leafAge,
      Value<double>? leafQuantity,
      Value<int>? feedingRound,
      Value<String?>? workerId,
      Value<String?>? remarks,
      Value<int>? rowid}) {
    return FeedingLogsTableCompanion(
      id: id ?? this.id,
      batchId: batchId ?? this.batchId,
      date: date ?? this.date,
      time: time ?? this.time,
      leafType: leafType ?? this.leafType,
      leafAge: leafAge ?? this.leafAge,
      leafQuantity: leafQuantity ?? this.leafQuantity,
      feedingRound: feedingRound ?? this.feedingRound,
      workerId: workerId ?? this.workerId,
      remarks: remarks ?? this.remarks,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (time.present) {
      map['time'] = Variable<String>(time.value);
    }
    if (leafType.present) {
      map['leaf_type'] = Variable<String>(leafType.value);
    }
    if (leafAge.present) {
      map['leaf_age'] = Variable<String>(leafAge.value);
    }
    if (leafQuantity.present) {
      map['leaf_quantity'] = Variable<double>(leafQuantity.value);
    }
    if (feedingRound.present) {
      map['feeding_round'] = Variable<int>(feedingRound.value);
    }
    if (workerId.present) {
      map['worker_id'] = Variable<String>(workerId.value);
    }
    if (remarks.present) {
      map['remarks'] = Variable<String>(remarks.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeedingLogsTableCompanion(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('date: $date, ')
          ..write('time: $time, ')
          ..write('leafType: $leafType, ')
          ..write('leafAge: $leafAge, ')
          ..write('leafQuantity: $leafQuantity, ')
          ..write('feedingRound: $feedingRound, ')
          ..write('workerId: $workerId, ')
          ..write('remarks: $remarks, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EnvironmentalLogsTableTable extends EnvironmentalLogsTable
    with TableInfo<$EnvironmentalLogsTableTable, EnvironmentalReadingDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EnvironmentalLogsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _batchIdMeta =
      const VerificationMeta('batchId');
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
      'batch_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES batches_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _temperatureMeta =
      const VerificationMeta('temperature');
  @override
  late final GeneratedColumn<double> temperature = GeneratedColumn<double>(
      'temperature', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _humidityMeta =
      const VerificationMeta('humidity');
  @override
  late final GeneratedColumn<double> humidity = GeneratedColumn<double>(
      'humidity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _ventilationStatusMeta =
      const VerificationMeta('ventilationStatus');
  @override
  late final GeneratedColumn<bool> ventilationStatus = GeneratedColumn<bool>(
      'ventilation_status', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("ventilation_status" IN (0, 1))'));
  static const VerificationMeta _weatherNotesMeta =
      const VerificationMeta('weatherNotes');
  @override
  late final GeneratedColumn<String> weatherNotes = GeneratedColumn<String>(
      'weather_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        batchId,
        timestamp,
        temperature,
        humidity,
        ventilationStatus,
        weatherNotes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'environmental_logs_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<EnvironmentalReadingDbModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('batch_id')) {
      context.handle(_batchIdMeta,
          batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta));
    } else if (isInserting) {
      context.missing(_batchIdMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('temperature')) {
      context.handle(
          _temperatureMeta,
          temperature.isAcceptableOrUnknown(
              data['temperature']!, _temperatureMeta));
    } else if (isInserting) {
      context.missing(_temperatureMeta);
    }
    if (data.containsKey('humidity')) {
      context.handle(_humidityMeta,
          humidity.isAcceptableOrUnknown(data['humidity']!, _humidityMeta));
    } else if (isInserting) {
      context.missing(_humidityMeta);
    }
    if (data.containsKey('ventilation_status')) {
      context.handle(
          _ventilationStatusMeta,
          ventilationStatus.isAcceptableOrUnknown(
              data['ventilation_status']!, _ventilationStatusMeta));
    } else if (isInserting) {
      context.missing(_ventilationStatusMeta);
    }
    if (data.containsKey('weather_notes')) {
      context.handle(
          _weatherNotesMeta,
          weatherNotes.isAcceptableOrUnknown(
              data['weather_notes']!, _weatherNotesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EnvironmentalReadingDbModel map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EnvironmentalReadingDbModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      batchId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}batch_id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      temperature: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}temperature'])!,
      humidity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}humidity'])!,
      ventilationStatus: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}ventilation_status'])!,
      weatherNotes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}weather_notes']),
    );
  }

  @override
  $EnvironmentalLogsTableTable createAlias(String alias) {
    return $EnvironmentalLogsTableTable(attachedDatabase, alias);
  }
}

class EnvironmentalReadingDbModel extends DataClass
    implements Insertable<EnvironmentalReadingDbModel> {
  final String id;
  final String batchId;
  final DateTime timestamp;
  final double temperature;
  final double humidity;
  final bool ventilationStatus;
  final String? weatherNotes;
  const EnvironmentalReadingDbModel(
      {required this.id,
      required this.batchId,
      required this.timestamp,
      required this.temperature,
      required this.humidity,
      required this.ventilationStatus,
      this.weatherNotes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['batch_id'] = Variable<String>(batchId);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['temperature'] = Variable<double>(temperature);
    map['humidity'] = Variable<double>(humidity);
    map['ventilation_status'] = Variable<bool>(ventilationStatus);
    if (!nullToAbsent || weatherNotes != null) {
      map['weather_notes'] = Variable<String>(weatherNotes);
    }
    return map;
  }

  EnvironmentalLogsTableCompanion toCompanion(bool nullToAbsent) {
    return EnvironmentalLogsTableCompanion(
      id: Value(id),
      batchId: Value(batchId),
      timestamp: Value(timestamp),
      temperature: Value(temperature),
      humidity: Value(humidity),
      ventilationStatus: Value(ventilationStatus),
      weatherNotes: weatherNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(weatherNotes),
    );
  }

  factory EnvironmentalReadingDbModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EnvironmentalReadingDbModel(
      id: serializer.fromJson<String>(json['id']),
      batchId: serializer.fromJson<String>(json['batchId']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      temperature: serializer.fromJson<double>(json['temperature']),
      humidity: serializer.fromJson<double>(json['humidity']),
      ventilationStatus: serializer.fromJson<bool>(json['ventilationStatus']),
      weatherNotes: serializer.fromJson<String?>(json['weatherNotes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'batchId': serializer.toJson<String>(batchId),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'temperature': serializer.toJson<double>(temperature),
      'humidity': serializer.toJson<double>(humidity),
      'ventilationStatus': serializer.toJson<bool>(ventilationStatus),
      'weatherNotes': serializer.toJson<String?>(weatherNotes),
    };
  }

  EnvironmentalReadingDbModel copyWith(
          {String? id,
          String? batchId,
          DateTime? timestamp,
          double? temperature,
          double? humidity,
          bool? ventilationStatus,
          Value<String?> weatherNotes = const Value.absent()}) =>
      EnvironmentalReadingDbModel(
        id: id ?? this.id,
        batchId: batchId ?? this.batchId,
        timestamp: timestamp ?? this.timestamp,
        temperature: temperature ?? this.temperature,
        humidity: humidity ?? this.humidity,
        ventilationStatus: ventilationStatus ?? this.ventilationStatus,
        weatherNotes:
            weatherNotes.present ? weatherNotes.value : this.weatherNotes,
      );
  EnvironmentalReadingDbModel copyWithCompanion(
      EnvironmentalLogsTableCompanion data) {
    return EnvironmentalReadingDbModel(
      id: data.id.present ? data.id.value : this.id,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      temperature:
          data.temperature.present ? data.temperature.value : this.temperature,
      humidity: data.humidity.present ? data.humidity.value : this.humidity,
      ventilationStatus: data.ventilationStatus.present
          ? data.ventilationStatus.value
          : this.ventilationStatus,
      weatherNotes: data.weatherNotes.present
          ? data.weatherNotes.value
          : this.weatherNotes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EnvironmentalReadingDbModel(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('timestamp: $timestamp, ')
          ..write('temperature: $temperature, ')
          ..write('humidity: $humidity, ')
          ..write('ventilationStatus: $ventilationStatus, ')
          ..write('weatherNotes: $weatherNotes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, batchId, timestamp, temperature, humidity,
      ventilationStatus, weatherNotes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EnvironmentalReadingDbModel &&
          other.id == this.id &&
          other.batchId == this.batchId &&
          other.timestamp == this.timestamp &&
          other.temperature == this.temperature &&
          other.humidity == this.humidity &&
          other.ventilationStatus == this.ventilationStatus &&
          other.weatherNotes == this.weatherNotes);
}

class EnvironmentalLogsTableCompanion
    extends UpdateCompanion<EnvironmentalReadingDbModel> {
  final Value<String> id;
  final Value<String> batchId;
  final Value<DateTime> timestamp;
  final Value<double> temperature;
  final Value<double> humidity;
  final Value<bool> ventilationStatus;
  final Value<String?> weatherNotes;
  final Value<int> rowid;
  const EnvironmentalLogsTableCompanion({
    this.id = const Value.absent(),
    this.batchId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.temperature = const Value.absent(),
    this.humidity = const Value.absent(),
    this.ventilationStatus = const Value.absent(),
    this.weatherNotes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EnvironmentalLogsTableCompanion.insert({
    required String id,
    required String batchId,
    required DateTime timestamp,
    required double temperature,
    required double humidity,
    required bool ventilationStatus,
    this.weatherNotes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        batchId = Value(batchId),
        timestamp = Value(timestamp),
        temperature = Value(temperature),
        humidity = Value(humidity),
        ventilationStatus = Value(ventilationStatus);
  static Insertable<EnvironmentalReadingDbModel> custom({
    Expression<String>? id,
    Expression<String>? batchId,
    Expression<DateTime>? timestamp,
    Expression<double>? temperature,
    Expression<double>? humidity,
    Expression<bool>? ventilationStatus,
    Expression<String>? weatherNotes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (batchId != null) 'batch_id': batchId,
      if (timestamp != null) 'timestamp': timestamp,
      if (temperature != null) 'temperature': temperature,
      if (humidity != null) 'humidity': humidity,
      if (ventilationStatus != null) 'ventilation_status': ventilationStatus,
      if (weatherNotes != null) 'weather_notes': weatherNotes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EnvironmentalLogsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? batchId,
      Value<DateTime>? timestamp,
      Value<double>? temperature,
      Value<double>? humidity,
      Value<bool>? ventilationStatus,
      Value<String?>? weatherNotes,
      Value<int>? rowid}) {
    return EnvironmentalLogsTableCompanion(
      id: id ?? this.id,
      batchId: batchId ?? this.batchId,
      timestamp: timestamp ?? this.timestamp,
      temperature: temperature ?? this.temperature,
      humidity: humidity ?? this.humidity,
      ventilationStatus: ventilationStatus ?? this.ventilationStatus,
      weatherNotes: weatherNotes ?? this.weatherNotes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (temperature.present) {
      map['temperature'] = Variable<double>(temperature.value);
    }
    if (humidity.present) {
      map['humidity'] = Variable<double>(humidity.value);
    }
    if (ventilationStatus.present) {
      map['ventilation_status'] = Variable<bool>(ventilationStatus.value);
    }
    if (weatherNotes.present) {
      map['weather_notes'] = Variable<String>(weatherNotes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EnvironmentalLogsTableCompanion(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('timestamp: $timestamp, ')
          ..write('temperature: $temperature, ')
          ..write('humidity: $humidity, ')
          ..write('ventilationStatus: $ventilationStatus, ')
          ..write('weatherNotes: $weatherNotes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MortalityLogsTableTable extends MortalityLogsTable
    with TableInfo<$MortalityLogsTableTable, MortalityLogDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MortalityLogsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _batchIdMeta =
      const VerificationMeta('batchId');
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
      'batch_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES batches_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deadCountMeta =
      const VerificationMeta('deadCount');
  @override
  late final GeneratedColumn<int> deadCount = GeneratedColumn<int>(
      'dead_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
      'reason', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workerIdMeta =
      const VerificationMeta('workerId');
  @override
  late final GeneratedColumn<String> workerId = GeneratedColumn<String>(
      'worker_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _remarksMeta =
      const VerificationMeta('remarks');
  @override
  late final GeneratedColumn<String> remarks = GeneratedColumn<String>(
      'remarks', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, batchId, date, deadCount, reason, workerId, remarks];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mortality_logs_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<MortalityLogDbModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('batch_id')) {
      context.handle(_batchIdMeta,
          batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta));
    } else if (isInserting) {
      context.missing(_batchIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('dead_count')) {
      context.handle(_deadCountMeta,
          deadCount.isAcceptableOrUnknown(data['dead_count']!, _deadCountMeta));
    } else if (isInserting) {
      context.missing(_deadCountMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(_reasonMeta,
          reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta));
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('worker_id')) {
      context.handle(_workerIdMeta,
          workerId.isAcceptableOrUnknown(data['worker_id']!, _workerIdMeta));
    }
    if (data.containsKey('remarks')) {
      context.handle(_remarksMeta,
          remarks.isAcceptableOrUnknown(data['remarks']!, _remarksMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MortalityLogDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MortalityLogDbModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      batchId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}batch_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      deadCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dead_count'])!,
      reason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reason'])!,
      workerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}worker_id']),
      remarks: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remarks']),
    );
  }

  @override
  $MortalityLogsTableTable createAlias(String alias) {
    return $MortalityLogsTableTable(attachedDatabase, alias);
  }
}

class MortalityLogDbModel extends DataClass
    implements Insertable<MortalityLogDbModel> {
  final String id;
  final String batchId;
  final DateTime date;
  final int deadCount;
  final String reason;
  final String? workerId;
  final String? remarks;
  const MortalityLogDbModel(
      {required this.id,
      required this.batchId,
      required this.date,
      required this.deadCount,
      required this.reason,
      this.workerId,
      this.remarks});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['batch_id'] = Variable<String>(batchId);
    map['date'] = Variable<DateTime>(date);
    map['dead_count'] = Variable<int>(deadCount);
    map['reason'] = Variable<String>(reason);
    if (!nullToAbsent || workerId != null) {
      map['worker_id'] = Variable<String>(workerId);
    }
    if (!nullToAbsent || remarks != null) {
      map['remarks'] = Variable<String>(remarks);
    }
    return map;
  }

  MortalityLogsTableCompanion toCompanion(bool nullToAbsent) {
    return MortalityLogsTableCompanion(
      id: Value(id),
      batchId: Value(batchId),
      date: Value(date),
      deadCount: Value(deadCount),
      reason: Value(reason),
      workerId: workerId == null && nullToAbsent
          ? const Value.absent()
          : Value(workerId),
      remarks: remarks == null && nullToAbsent
          ? const Value.absent()
          : Value(remarks),
    );
  }

  factory MortalityLogDbModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MortalityLogDbModel(
      id: serializer.fromJson<String>(json['id']),
      batchId: serializer.fromJson<String>(json['batchId']),
      date: serializer.fromJson<DateTime>(json['date']),
      deadCount: serializer.fromJson<int>(json['deadCount']),
      reason: serializer.fromJson<String>(json['reason']),
      workerId: serializer.fromJson<String?>(json['workerId']),
      remarks: serializer.fromJson<String?>(json['remarks']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'batchId': serializer.toJson<String>(batchId),
      'date': serializer.toJson<DateTime>(date),
      'deadCount': serializer.toJson<int>(deadCount),
      'reason': serializer.toJson<String>(reason),
      'workerId': serializer.toJson<String?>(workerId),
      'remarks': serializer.toJson<String?>(remarks),
    };
  }

  MortalityLogDbModel copyWith(
          {String? id,
          String? batchId,
          DateTime? date,
          int? deadCount,
          String? reason,
          Value<String?> workerId = const Value.absent(),
          Value<String?> remarks = const Value.absent()}) =>
      MortalityLogDbModel(
        id: id ?? this.id,
        batchId: batchId ?? this.batchId,
        date: date ?? this.date,
        deadCount: deadCount ?? this.deadCount,
        reason: reason ?? this.reason,
        workerId: workerId.present ? workerId.value : this.workerId,
        remarks: remarks.present ? remarks.value : this.remarks,
      );
  MortalityLogDbModel copyWithCompanion(MortalityLogsTableCompanion data) {
    return MortalityLogDbModel(
      id: data.id.present ? data.id.value : this.id,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      date: data.date.present ? data.date.value : this.date,
      deadCount: data.deadCount.present ? data.deadCount.value : this.deadCount,
      reason: data.reason.present ? data.reason.value : this.reason,
      workerId: data.workerId.present ? data.workerId.value : this.workerId,
      remarks: data.remarks.present ? data.remarks.value : this.remarks,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MortalityLogDbModel(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('date: $date, ')
          ..write('deadCount: $deadCount, ')
          ..write('reason: $reason, ')
          ..write('workerId: $workerId, ')
          ..write('remarks: $remarks')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, batchId, date, deadCount, reason, workerId, remarks);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MortalityLogDbModel &&
          other.id == this.id &&
          other.batchId == this.batchId &&
          other.date == this.date &&
          other.deadCount == this.deadCount &&
          other.reason == this.reason &&
          other.workerId == this.workerId &&
          other.remarks == this.remarks);
}

class MortalityLogsTableCompanion extends UpdateCompanion<MortalityLogDbModel> {
  final Value<String> id;
  final Value<String> batchId;
  final Value<DateTime> date;
  final Value<int> deadCount;
  final Value<String> reason;
  final Value<String?> workerId;
  final Value<String?> remarks;
  final Value<int> rowid;
  const MortalityLogsTableCompanion({
    this.id = const Value.absent(),
    this.batchId = const Value.absent(),
    this.date = const Value.absent(),
    this.deadCount = const Value.absent(),
    this.reason = const Value.absent(),
    this.workerId = const Value.absent(),
    this.remarks = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MortalityLogsTableCompanion.insert({
    required String id,
    required String batchId,
    required DateTime date,
    required int deadCount,
    required String reason,
    this.workerId = const Value.absent(),
    this.remarks = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        batchId = Value(batchId),
        date = Value(date),
        deadCount = Value(deadCount),
        reason = Value(reason);
  static Insertable<MortalityLogDbModel> custom({
    Expression<String>? id,
    Expression<String>? batchId,
    Expression<DateTime>? date,
    Expression<int>? deadCount,
    Expression<String>? reason,
    Expression<String>? workerId,
    Expression<String>? remarks,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (batchId != null) 'batch_id': batchId,
      if (date != null) 'date': date,
      if (deadCount != null) 'dead_count': deadCount,
      if (reason != null) 'reason': reason,
      if (workerId != null) 'worker_id': workerId,
      if (remarks != null) 'remarks': remarks,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MortalityLogsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? batchId,
      Value<DateTime>? date,
      Value<int>? deadCount,
      Value<String>? reason,
      Value<String?>? workerId,
      Value<String?>? remarks,
      Value<int>? rowid}) {
    return MortalityLogsTableCompanion(
      id: id ?? this.id,
      batchId: batchId ?? this.batchId,
      date: date ?? this.date,
      deadCount: deadCount ?? this.deadCount,
      reason: reason ?? this.reason,
      workerId: workerId ?? this.workerId,
      remarks: remarks ?? this.remarks,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (deadCount.present) {
      map['dead_count'] = Variable<int>(deadCount.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (workerId.present) {
      map['worker_id'] = Variable<String>(workerId.value);
    }
    if (remarks.present) {
      map['remarks'] = Variable<String>(remarks.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MortalityLogsTableCompanion(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('date: $date, ')
          ..write('deadCount: $deadCount, ')
          ..write('reason: $reason, ')
          ..write('workerId: $workerId, ')
          ..write('remarks: $remarks, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HarvestsTableTable extends HarvestsTable
    with TableInfo<$HarvestsTableTable, HarvestRecordDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HarvestsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _batchIdMeta =
      const VerificationMeta('batchId');
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
      'batch_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES batches_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _harvestDateMeta =
      const VerificationMeta('harvestDate');
  @override
  late final GeneratedColumn<DateTime> harvestDate = GeneratedColumn<DateTime>(
      'harvest_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _actualHarvestDurationMeta =
      const VerificationMeta('actualHarvestDuration');
  @override
  late final GeneratedColumn<double> actualHarvestDuration =
      GeneratedColumn<double>('actual_harvest_duration', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _grossWeightMeta =
      const VerificationMeta('grossWeight');
  @override
  late final GeneratedColumn<double> grossWeight = GeneratedColumn<double>(
      'gross_weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _netSaleableWeightMeta =
      const VerificationMeta('netSaleableWeight');
  @override
  late final GeneratedColumn<double> netSaleableWeight =
      GeneratedColumn<double>('net_saleable_weight', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _rejectedWeightMeta =
      const VerificationMeta('rejectedWeight');
  @override
  late final GeneratedColumn<double> rejectedWeight = GeneratedColumn<double>(
      'rejected_weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _moisturePercentageMeta =
      const VerificationMeta('moisturePercentage');
  @override
  late final GeneratedColumn<double> moisturePercentage =
      GeneratedColumn<double>('moisture_percentage', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _wastePercentageMeta =
      const VerificationMeta('wastePercentage');
  @override
  late final GeneratedColumn<double> wastePercentage = GeneratedColumn<double>(
      'waste_percentage', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _averageCocoonSizeMeta =
      const VerificationMeta('averageCocoonSize');
  @override
  late final GeneratedColumn<double> averageCocoonSize =
      GeneratedColumn<double>('average_cocoon_size', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _gradeAWeightMeta =
      const VerificationMeta('gradeAWeight');
  @override
  late final GeneratedColumn<double> gradeAWeight = GeneratedColumn<double>(
      'grade_a_weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _gradeBWeightMeta =
      const VerificationMeta('gradeBWeight');
  @override
  late final GeneratedColumn<double> gradeBWeight = GeneratedColumn<double>(
      'grade_b_weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _gradeCWeightMeta =
      const VerificationMeta('gradeCWeight');
  @override
  late final GeneratedColumn<double> gradeCWeight = GeneratedColumn<double>(
      'grade_c_weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _yieldPercentageMeta =
      const VerificationMeta('yieldPercentage');
  @override
  late final GeneratedColumn<double> yieldPercentage = GeneratedColumn<double>(
      'yield_percentage', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _survivalRateMeta =
      const VerificationMeta('survivalRate');
  @override
  late final GeneratedColumn<double> survivalRate = GeneratedColumn<double>(
      'survival_rate', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _feedConversionRatioMeta =
      const VerificationMeta('feedConversionRatio');
  @override
  late final GeneratedColumn<double> feedConversionRatio =
      GeneratedColumn<double>('feed_conversion_ratio', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _mortalityPercentageMeta =
      const VerificationMeta('mortalityPercentage');
  @override
  late final GeneratedColumn<double> mortalityPercentage =
      GeneratedColumn<double>('mortality_percentage', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _harvestEfficiencyMeta =
      const VerificationMeta('harvestEfficiency');
  @override
  late final GeneratedColumn<double> harvestEfficiency =
      GeneratedColumn<double>('harvest_efficiency', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _harvestedByMeta =
      const VerificationMeta('harvestedBy');
  @override
  late final GeneratedColumn<String> harvestedBy = GeneratedColumn<String>(
      'harvested_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _remarksMeta =
      const VerificationMeta('remarks');
  @override
  late final GeneratedColumn<String> remarks = GeneratedColumn<String>(
      'remarks', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        batchId,
        harvestDate,
        actualHarvestDuration,
        grossWeight,
        netSaleableWeight,
        rejectedWeight,
        moisturePercentage,
        wastePercentage,
        averageCocoonSize,
        gradeAWeight,
        gradeBWeight,
        gradeCWeight,
        yieldPercentage,
        survivalRate,
        feedConversionRatio,
        mortalityPercentage,
        harvestEfficiency,
        harvestedBy,
        remarks
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'harvests_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<HarvestRecordDbModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('batch_id')) {
      context.handle(_batchIdMeta,
          batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta));
    } else if (isInserting) {
      context.missing(_batchIdMeta);
    }
    if (data.containsKey('harvest_date')) {
      context.handle(
          _harvestDateMeta,
          harvestDate.isAcceptableOrUnknown(
              data['harvest_date']!, _harvestDateMeta));
    } else if (isInserting) {
      context.missing(_harvestDateMeta);
    }
    if (data.containsKey('actual_harvest_duration')) {
      context.handle(
          _actualHarvestDurationMeta,
          actualHarvestDuration.isAcceptableOrUnknown(
              data['actual_harvest_duration']!, _actualHarvestDurationMeta));
    } else if (isInserting) {
      context.missing(_actualHarvestDurationMeta);
    }
    if (data.containsKey('gross_weight')) {
      context.handle(
          _grossWeightMeta,
          grossWeight.isAcceptableOrUnknown(
              data['gross_weight']!, _grossWeightMeta));
    } else if (isInserting) {
      context.missing(_grossWeightMeta);
    }
    if (data.containsKey('net_saleable_weight')) {
      context.handle(
          _netSaleableWeightMeta,
          netSaleableWeight.isAcceptableOrUnknown(
              data['net_saleable_weight']!, _netSaleableWeightMeta));
    } else if (isInserting) {
      context.missing(_netSaleableWeightMeta);
    }
    if (data.containsKey('rejected_weight')) {
      context.handle(
          _rejectedWeightMeta,
          rejectedWeight.isAcceptableOrUnknown(
              data['rejected_weight']!, _rejectedWeightMeta));
    } else if (isInserting) {
      context.missing(_rejectedWeightMeta);
    }
    if (data.containsKey('moisture_percentage')) {
      context.handle(
          _moisturePercentageMeta,
          moisturePercentage.isAcceptableOrUnknown(
              data['moisture_percentage']!, _moisturePercentageMeta));
    } else if (isInserting) {
      context.missing(_moisturePercentageMeta);
    }
    if (data.containsKey('waste_percentage')) {
      context.handle(
          _wastePercentageMeta,
          wastePercentage.isAcceptableOrUnknown(
              data['waste_percentage']!, _wastePercentageMeta));
    } else if (isInserting) {
      context.missing(_wastePercentageMeta);
    }
    if (data.containsKey('average_cocoon_size')) {
      context.handle(
          _averageCocoonSizeMeta,
          averageCocoonSize.isAcceptableOrUnknown(
              data['average_cocoon_size']!, _averageCocoonSizeMeta));
    } else if (isInserting) {
      context.missing(_averageCocoonSizeMeta);
    }
    if (data.containsKey('grade_a_weight')) {
      context.handle(
          _gradeAWeightMeta,
          gradeAWeight.isAcceptableOrUnknown(
              data['grade_a_weight']!, _gradeAWeightMeta));
    } else if (isInserting) {
      context.missing(_gradeAWeightMeta);
    }
    if (data.containsKey('grade_b_weight')) {
      context.handle(
          _gradeBWeightMeta,
          gradeBWeight.isAcceptableOrUnknown(
              data['grade_b_weight']!, _gradeBWeightMeta));
    } else if (isInserting) {
      context.missing(_gradeBWeightMeta);
    }
    if (data.containsKey('grade_c_weight')) {
      context.handle(
          _gradeCWeightMeta,
          gradeCWeight.isAcceptableOrUnknown(
              data['grade_c_weight']!, _gradeCWeightMeta));
    } else if (isInserting) {
      context.missing(_gradeCWeightMeta);
    }
    if (data.containsKey('yield_percentage')) {
      context.handle(
          _yieldPercentageMeta,
          yieldPercentage.isAcceptableOrUnknown(
              data['yield_percentage']!, _yieldPercentageMeta));
    } else if (isInserting) {
      context.missing(_yieldPercentageMeta);
    }
    if (data.containsKey('survival_rate')) {
      context.handle(
          _survivalRateMeta,
          survivalRate.isAcceptableOrUnknown(
              data['survival_rate']!, _survivalRateMeta));
    } else if (isInserting) {
      context.missing(_survivalRateMeta);
    }
    if (data.containsKey('feed_conversion_ratio')) {
      context.handle(
          _feedConversionRatioMeta,
          feedConversionRatio.isAcceptableOrUnknown(
              data['feed_conversion_ratio']!, _feedConversionRatioMeta));
    } else if (isInserting) {
      context.missing(_feedConversionRatioMeta);
    }
    if (data.containsKey('mortality_percentage')) {
      context.handle(
          _mortalityPercentageMeta,
          mortalityPercentage.isAcceptableOrUnknown(
              data['mortality_percentage']!, _mortalityPercentageMeta));
    } else if (isInserting) {
      context.missing(_mortalityPercentageMeta);
    }
    if (data.containsKey('harvest_efficiency')) {
      context.handle(
          _harvestEfficiencyMeta,
          harvestEfficiency.isAcceptableOrUnknown(
              data['harvest_efficiency']!, _harvestEfficiencyMeta));
    } else if (isInserting) {
      context.missing(_harvestEfficiencyMeta);
    }
    if (data.containsKey('harvested_by')) {
      context.handle(
          _harvestedByMeta,
          harvestedBy.isAcceptableOrUnknown(
              data['harvested_by']!, _harvestedByMeta));
    }
    if (data.containsKey('remarks')) {
      context.handle(_remarksMeta,
          remarks.isAcceptableOrUnknown(data['remarks']!, _remarksMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HarvestRecordDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HarvestRecordDbModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      batchId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}batch_id'])!,
      harvestDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}harvest_date'])!,
      actualHarvestDuration: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}actual_harvest_duration'])!,
      grossWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}gross_weight'])!,
      netSaleableWeight: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}net_saleable_weight'])!,
      rejectedWeight: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}rejected_weight'])!,
      moisturePercentage: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}moisture_percentage'])!,
      wastePercentage: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}waste_percentage'])!,
      averageCocoonSize: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}average_cocoon_size'])!,
      gradeAWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}grade_a_weight'])!,
      gradeBWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}grade_b_weight'])!,
      gradeCWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}grade_c_weight'])!,
      yieldPercentage: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}yield_percentage'])!,
      survivalRate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}survival_rate'])!,
      feedConversionRatio: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}feed_conversion_ratio'])!,
      mortalityPercentage: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}mortality_percentage'])!,
      harvestEfficiency: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}harvest_efficiency'])!,
      harvestedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}harvested_by']),
      remarks: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remarks']),
    );
  }

  @override
  $HarvestsTableTable createAlias(String alias) {
    return $HarvestsTableTable(attachedDatabase, alias);
  }
}

class HarvestRecordDbModel extends DataClass
    implements Insertable<HarvestRecordDbModel> {
  final String id;
  final String batchId;
  final DateTime harvestDate;
  final double actualHarvestDuration;
  final double grossWeight;
  final double netSaleableWeight;
  final double rejectedWeight;
  final double moisturePercentage;
  final double wastePercentage;
  final double averageCocoonSize;
  final double gradeAWeight;
  final double gradeBWeight;
  final double gradeCWeight;
  final double yieldPercentage;
  final double survivalRate;
  final double feedConversionRatio;
  final double mortalityPercentage;
  final double harvestEfficiency;
  final String? harvestedBy;
  final String? remarks;
  const HarvestRecordDbModel(
      {required this.id,
      required this.batchId,
      required this.harvestDate,
      required this.actualHarvestDuration,
      required this.grossWeight,
      required this.netSaleableWeight,
      required this.rejectedWeight,
      required this.moisturePercentage,
      required this.wastePercentage,
      required this.averageCocoonSize,
      required this.gradeAWeight,
      required this.gradeBWeight,
      required this.gradeCWeight,
      required this.yieldPercentage,
      required this.survivalRate,
      required this.feedConversionRatio,
      required this.mortalityPercentage,
      required this.harvestEfficiency,
      this.harvestedBy,
      this.remarks});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['batch_id'] = Variable<String>(batchId);
    map['harvest_date'] = Variable<DateTime>(harvestDate);
    map['actual_harvest_duration'] = Variable<double>(actualHarvestDuration);
    map['gross_weight'] = Variable<double>(grossWeight);
    map['net_saleable_weight'] = Variable<double>(netSaleableWeight);
    map['rejected_weight'] = Variable<double>(rejectedWeight);
    map['moisture_percentage'] = Variable<double>(moisturePercentage);
    map['waste_percentage'] = Variable<double>(wastePercentage);
    map['average_cocoon_size'] = Variable<double>(averageCocoonSize);
    map['grade_a_weight'] = Variable<double>(gradeAWeight);
    map['grade_b_weight'] = Variable<double>(gradeBWeight);
    map['grade_c_weight'] = Variable<double>(gradeCWeight);
    map['yield_percentage'] = Variable<double>(yieldPercentage);
    map['survival_rate'] = Variable<double>(survivalRate);
    map['feed_conversion_ratio'] = Variable<double>(feedConversionRatio);
    map['mortality_percentage'] = Variable<double>(mortalityPercentage);
    map['harvest_efficiency'] = Variable<double>(harvestEfficiency);
    if (!nullToAbsent || harvestedBy != null) {
      map['harvested_by'] = Variable<String>(harvestedBy);
    }
    if (!nullToAbsent || remarks != null) {
      map['remarks'] = Variable<String>(remarks);
    }
    return map;
  }

  HarvestsTableCompanion toCompanion(bool nullToAbsent) {
    return HarvestsTableCompanion(
      id: Value(id),
      batchId: Value(batchId),
      harvestDate: Value(harvestDate),
      actualHarvestDuration: Value(actualHarvestDuration),
      grossWeight: Value(grossWeight),
      netSaleableWeight: Value(netSaleableWeight),
      rejectedWeight: Value(rejectedWeight),
      moisturePercentage: Value(moisturePercentage),
      wastePercentage: Value(wastePercentage),
      averageCocoonSize: Value(averageCocoonSize),
      gradeAWeight: Value(gradeAWeight),
      gradeBWeight: Value(gradeBWeight),
      gradeCWeight: Value(gradeCWeight),
      yieldPercentage: Value(yieldPercentage),
      survivalRate: Value(survivalRate),
      feedConversionRatio: Value(feedConversionRatio),
      mortalityPercentage: Value(mortalityPercentage),
      harvestEfficiency: Value(harvestEfficiency),
      harvestedBy: harvestedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(harvestedBy),
      remarks: remarks == null && nullToAbsent
          ? const Value.absent()
          : Value(remarks),
    );
  }

  factory HarvestRecordDbModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HarvestRecordDbModel(
      id: serializer.fromJson<String>(json['id']),
      batchId: serializer.fromJson<String>(json['batchId']),
      harvestDate: serializer.fromJson<DateTime>(json['harvestDate']),
      actualHarvestDuration:
          serializer.fromJson<double>(json['actualHarvestDuration']),
      grossWeight: serializer.fromJson<double>(json['grossWeight']),
      netSaleableWeight: serializer.fromJson<double>(json['netSaleableWeight']),
      rejectedWeight: serializer.fromJson<double>(json['rejectedWeight']),
      moisturePercentage:
          serializer.fromJson<double>(json['moisturePercentage']),
      wastePercentage: serializer.fromJson<double>(json['wastePercentage']),
      averageCocoonSize: serializer.fromJson<double>(json['averageCocoonSize']),
      gradeAWeight: serializer.fromJson<double>(json['gradeAWeight']),
      gradeBWeight: serializer.fromJson<double>(json['gradeBWeight']),
      gradeCWeight: serializer.fromJson<double>(json['gradeCWeight']),
      yieldPercentage: serializer.fromJson<double>(json['yieldPercentage']),
      survivalRate: serializer.fromJson<double>(json['survivalRate']),
      feedConversionRatio:
          serializer.fromJson<double>(json['feedConversionRatio']),
      mortalityPercentage:
          serializer.fromJson<double>(json['mortalityPercentage']),
      harvestEfficiency: serializer.fromJson<double>(json['harvestEfficiency']),
      harvestedBy: serializer.fromJson<String?>(json['harvestedBy']),
      remarks: serializer.fromJson<String?>(json['remarks']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'batchId': serializer.toJson<String>(batchId),
      'harvestDate': serializer.toJson<DateTime>(harvestDate),
      'actualHarvestDuration': serializer.toJson<double>(actualHarvestDuration),
      'grossWeight': serializer.toJson<double>(grossWeight),
      'netSaleableWeight': serializer.toJson<double>(netSaleableWeight),
      'rejectedWeight': serializer.toJson<double>(rejectedWeight),
      'moisturePercentage': serializer.toJson<double>(moisturePercentage),
      'wastePercentage': serializer.toJson<double>(wastePercentage),
      'averageCocoonSize': serializer.toJson<double>(averageCocoonSize),
      'gradeAWeight': serializer.toJson<double>(gradeAWeight),
      'gradeBWeight': serializer.toJson<double>(gradeBWeight),
      'gradeCWeight': serializer.toJson<double>(gradeCWeight),
      'yieldPercentage': serializer.toJson<double>(yieldPercentage),
      'survivalRate': serializer.toJson<double>(survivalRate),
      'feedConversionRatio': serializer.toJson<double>(feedConversionRatio),
      'mortalityPercentage': serializer.toJson<double>(mortalityPercentage),
      'harvestEfficiency': serializer.toJson<double>(harvestEfficiency),
      'harvestedBy': serializer.toJson<String?>(harvestedBy),
      'remarks': serializer.toJson<String?>(remarks),
    };
  }

  HarvestRecordDbModel copyWith(
          {String? id,
          String? batchId,
          DateTime? harvestDate,
          double? actualHarvestDuration,
          double? grossWeight,
          double? netSaleableWeight,
          double? rejectedWeight,
          double? moisturePercentage,
          double? wastePercentage,
          double? averageCocoonSize,
          double? gradeAWeight,
          double? gradeBWeight,
          double? gradeCWeight,
          double? yieldPercentage,
          double? survivalRate,
          double? feedConversionRatio,
          double? mortalityPercentage,
          double? harvestEfficiency,
          Value<String?> harvestedBy = const Value.absent(),
          Value<String?> remarks = const Value.absent()}) =>
      HarvestRecordDbModel(
        id: id ?? this.id,
        batchId: batchId ?? this.batchId,
        harvestDate: harvestDate ?? this.harvestDate,
        actualHarvestDuration:
            actualHarvestDuration ?? this.actualHarvestDuration,
        grossWeight: grossWeight ?? this.grossWeight,
        netSaleableWeight: netSaleableWeight ?? this.netSaleableWeight,
        rejectedWeight: rejectedWeight ?? this.rejectedWeight,
        moisturePercentage: moisturePercentage ?? this.moisturePercentage,
        wastePercentage: wastePercentage ?? this.wastePercentage,
        averageCocoonSize: averageCocoonSize ?? this.averageCocoonSize,
        gradeAWeight: gradeAWeight ?? this.gradeAWeight,
        gradeBWeight: gradeBWeight ?? this.gradeBWeight,
        gradeCWeight: gradeCWeight ?? this.gradeCWeight,
        yieldPercentage: yieldPercentage ?? this.yieldPercentage,
        survivalRate: survivalRate ?? this.survivalRate,
        feedConversionRatio: feedConversionRatio ?? this.feedConversionRatio,
        mortalityPercentage: mortalityPercentage ?? this.mortalityPercentage,
        harvestEfficiency: harvestEfficiency ?? this.harvestEfficiency,
        harvestedBy: harvestedBy.present ? harvestedBy.value : this.harvestedBy,
        remarks: remarks.present ? remarks.value : this.remarks,
      );
  HarvestRecordDbModel copyWithCompanion(HarvestsTableCompanion data) {
    return HarvestRecordDbModel(
      id: data.id.present ? data.id.value : this.id,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      harvestDate:
          data.harvestDate.present ? data.harvestDate.value : this.harvestDate,
      actualHarvestDuration: data.actualHarvestDuration.present
          ? data.actualHarvestDuration.value
          : this.actualHarvestDuration,
      grossWeight:
          data.grossWeight.present ? data.grossWeight.value : this.grossWeight,
      netSaleableWeight: data.netSaleableWeight.present
          ? data.netSaleableWeight.value
          : this.netSaleableWeight,
      rejectedWeight: data.rejectedWeight.present
          ? data.rejectedWeight.value
          : this.rejectedWeight,
      moisturePercentage: data.moisturePercentage.present
          ? data.moisturePercentage.value
          : this.moisturePercentage,
      wastePercentage: data.wastePercentage.present
          ? data.wastePercentage.value
          : this.wastePercentage,
      averageCocoonSize: data.averageCocoonSize.present
          ? data.averageCocoonSize.value
          : this.averageCocoonSize,
      gradeAWeight: data.gradeAWeight.present
          ? data.gradeAWeight.value
          : this.gradeAWeight,
      gradeBWeight: data.gradeBWeight.present
          ? data.gradeBWeight.value
          : this.gradeBWeight,
      gradeCWeight: data.gradeCWeight.present
          ? data.gradeCWeight.value
          : this.gradeCWeight,
      yieldPercentage: data.yieldPercentage.present
          ? data.yieldPercentage.value
          : this.yieldPercentage,
      survivalRate: data.survivalRate.present
          ? data.survivalRate.value
          : this.survivalRate,
      feedConversionRatio: data.feedConversionRatio.present
          ? data.feedConversionRatio.value
          : this.feedConversionRatio,
      mortalityPercentage: data.mortalityPercentage.present
          ? data.mortalityPercentage.value
          : this.mortalityPercentage,
      harvestEfficiency: data.harvestEfficiency.present
          ? data.harvestEfficiency.value
          : this.harvestEfficiency,
      harvestedBy:
          data.harvestedBy.present ? data.harvestedBy.value : this.harvestedBy,
      remarks: data.remarks.present ? data.remarks.value : this.remarks,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HarvestRecordDbModel(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('harvestDate: $harvestDate, ')
          ..write('actualHarvestDuration: $actualHarvestDuration, ')
          ..write('grossWeight: $grossWeight, ')
          ..write('netSaleableWeight: $netSaleableWeight, ')
          ..write('rejectedWeight: $rejectedWeight, ')
          ..write('moisturePercentage: $moisturePercentage, ')
          ..write('wastePercentage: $wastePercentage, ')
          ..write('averageCocoonSize: $averageCocoonSize, ')
          ..write('gradeAWeight: $gradeAWeight, ')
          ..write('gradeBWeight: $gradeBWeight, ')
          ..write('gradeCWeight: $gradeCWeight, ')
          ..write('yieldPercentage: $yieldPercentage, ')
          ..write('survivalRate: $survivalRate, ')
          ..write('feedConversionRatio: $feedConversionRatio, ')
          ..write('mortalityPercentage: $mortalityPercentage, ')
          ..write('harvestEfficiency: $harvestEfficiency, ')
          ..write('harvestedBy: $harvestedBy, ')
          ..write('remarks: $remarks')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      batchId,
      harvestDate,
      actualHarvestDuration,
      grossWeight,
      netSaleableWeight,
      rejectedWeight,
      moisturePercentage,
      wastePercentage,
      averageCocoonSize,
      gradeAWeight,
      gradeBWeight,
      gradeCWeight,
      yieldPercentage,
      survivalRate,
      feedConversionRatio,
      mortalityPercentage,
      harvestEfficiency,
      harvestedBy,
      remarks);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HarvestRecordDbModel &&
          other.id == this.id &&
          other.batchId == this.batchId &&
          other.harvestDate == this.harvestDate &&
          other.actualHarvestDuration == this.actualHarvestDuration &&
          other.grossWeight == this.grossWeight &&
          other.netSaleableWeight == this.netSaleableWeight &&
          other.rejectedWeight == this.rejectedWeight &&
          other.moisturePercentage == this.moisturePercentage &&
          other.wastePercentage == this.wastePercentage &&
          other.averageCocoonSize == this.averageCocoonSize &&
          other.gradeAWeight == this.gradeAWeight &&
          other.gradeBWeight == this.gradeBWeight &&
          other.gradeCWeight == this.gradeCWeight &&
          other.yieldPercentage == this.yieldPercentage &&
          other.survivalRate == this.survivalRate &&
          other.feedConversionRatio == this.feedConversionRatio &&
          other.mortalityPercentage == this.mortalityPercentage &&
          other.harvestEfficiency == this.harvestEfficiency &&
          other.harvestedBy == this.harvestedBy &&
          other.remarks == this.remarks);
}

class HarvestsTableCompanion extends UpdateCompanion<HarvestRecordDbModel> {
  final Value<String> id;
  final Value<String> batchId;
  final Value<DateTime> harvestDate;
  final Value<double> actualHarvestDuration;
  final Value<double> grossWeight;
  final Value<double> netSaleableWeight;
  final Value<double> rejectedWeight;
  final Value<double> moisturePercentage;
  final Value<double> wastePercentage;
  final Value<double> averageCocoonSize;
  final Value<double> gradeAWeight;
  final Value<double> gradeBWeight;
  final Value<double> gradeCWeight;
  final Value<double> yieldPercentage;
  final Value<double> survivalRate;
  final Value<double> feedConversionRatio;
  final Value<double> mortalityPercentage;
  final Value<double> harvestEfficiency;
  final Value<String?> harvestedBy;
  final Value<String?> remarks;
  final Value<int> rowid;
  const HarvestsTableCompanion({
    this.id = const Value.absent(),
    this.batchId = const Value.absent(),
    this.harvestDate = const Value.absent(),
    this.actualHarvestDuration = const Value.absent(),
    this.grossWeight = const Value.absent(),
    this.netSaleableWeight = const Value.absent(),
    this.rejectedWeight = const Value.absent(),
    this.moisturePercentage = const Value.absent(),
    this.wastePercentage = const Value.absent(),
    this.averageCocoonSize = const Value.absent(),
    this.gradeAWeight = const Value.absent(),
    this.gradeBWeight = const Value.absent(),
    this.gradeCWeight = const Value.absent(),
    this.yieldPercentage = const Value.absent(),
    this.survivalRate = const Value.absent(),
    this.feedConversionRatio = const Value.absent(),
    this.mortalityPercentage = const Value.absent(),
    this.harvestEfficiency = const Value.absent(),
    this.harvestedBy = const Value.absent(),
    this.remarks = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HarvestsTableCompanion.insert({
    required String id,
    required String batchId,
    required DateTime harvestDate,
    required double actualHarvestDuration,
    required double grossWeight,
    required double netSaleableWeight,
    required double rejectedWeight,
    required double moisturePercentage,
    required double wastePercentage,
    required double averageCocoonSize,
    required double gradeAWeight,
    required double gradeBWeight,
    required double gradeCWeight,
    required double yieldPercentage,
    required double survivalRate,
    required double feedConversionRatio,
    required double mortalityPercentage,
    required double harvestEfficiency,
    this.harvestedBy = const Value.absent(),
    this.remarks = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        batchId = Value(batchId),
        harvestDate = Value(harvestDate),
        actualHarvestDuration = Value(actualHarvestDuration),
        grossWeight = Value(grossWeight),
        netSaleableWeight = Value(netSaleableWeight),
        rejectedWeight = Value(rejectedWeight),
        moisturePercentage = Value(moisturePercentage),
        wastePercentage = Value(wastePercentage),
        averageCocoonSize = Value(averageCocoonSize),
        gradeAWeight = Value(gradeAWeight),
        gradeBWeight = Value(gradeBWeight),
        gradeCWeight = Value(gradeCWeight),
        yieldPercentage = Value(yieldPercentage),
        survivalRate = Value(survivalRate),
        feedConversionRatio = Value(feedConversionRatio),
        mortalityPercentage = Value(mortalityPercentage),
        harvestEfficiency = Value(harvestEfficiency);
  static Insertable<HarvestRecordDbModel> custom({
    Expression<String>? id,
    Expression<String>? batchId,
    Expression<DateTime>? harvestDate,
    Expression<double>? actualHarvestDuration,
    Expression<double>? grossWeight,
    Expression<double>? netSaleableWeight,
    Expression<double>? rejectedWeight,
    Expression<double>? moisturePercentage,
    Expression<double>? wastePercentage,
    Expression<double>? averageCocoonSize,
    Expression<double>? gradeAWeight,
    Expression<double>? gradeBWeight,
    Expression<double>? gradeCWeight,
    Expression<double>? yieldPercentage,
    Expression<double>? survivalRate,
    Expression<double>? feedConversionRatio,
    Expression<double>? mortalityPercentage,
    Expression<double>? harvestEfficiency,
    Expression<String>? harvestedBy,
    Expression<String>? remarks,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (batchId != null) 'batch_id': batchId,
      if (harvestDate != null) 'harvest_date': harvestDate,
      if (actualHarvestDuration != null)
        'actual_harvest_duration': actualHarvestDuration,
      if (grossWeight != null) 'gross_weight': grossWeight,
      if (netSaleableWeight != null) 'net_saleable_weight': netSaleableWeight,
      if (rejectedWeight != null) 'rejected_weight': rejectedWeight,
      if (moisturePercentage != null) 'moisture_percentage': moisturePercentage,
      if (wastePercentage != null) 'waste_percentage': wastePercentage,
      if (averageCocoonSize != null) 'average_cocoon_size': averageCocoonSize,
      if (gradeAWeight != null) 'grade_a_weight': gradeAWeight,
      if (gradeBWeight != null) 'grade_b_weight': gradeBWeight,
      if (gradeCWeight != null) 'grade_c_weight': gradeCWeight,
      if (yieldPercentage != null) 'yield_percentage': yieldPercentage,
      if (survivalRate != null) 'survival_rate': survivalRate,
      if (feedConversionRatio != null)
        'feed_conversion_ratio': feedConversionRatio,
      if (mortalityPercentage != null)
        'mortality_percentage': mortalityPercentage,
      if (harvestEfficiency != null) 'harvest_efficiency': harvestEfficiency,
      if (harvestedBy != null) 'harvested_by': harvestedBy,
      if (remarks != null) 'remarks': remarks,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HarvestsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? batchId,
      Value<DateTime>? harvestDate,
      Value<double>? actualHarvestDuration,
      Value<double>? grossWeight,
      Value<double>? netSaleableWeight,
      Value<double>? rejectedWeight,
      Value<double>? moisturePercentage,
      Value<double>? wastePercentage,
      Value<double>? averageCocoonSize,
      Value<double>? gradeAWeight,
      Value<double>? gradeBWeight,
      Value<double>? gradeCWeight,
      Value<double>? yieldPercentage,
      Value<double>? survivalRate,
      Value<double>? feedConversionRatio,
      Value<double>? mortalityPercentage,
      Value<double>? harvestEfficiency,
      Value<String?>? harvestedBy,
      Value<String?>? remarks,
      Value<int>? rowid}) {
    return HarvestsTableCompanion(
      id: id ?? this.id,
      batchId: batchId ?? this.batchId,
      harvestDate: harvestDate ?? this.harvestDate,
      actualHarvestDuration:
          actualHarvestDuration ?? this.actualHarvestDuration,
      grossWeight: grossWeight ?? this.grossWeight,
      netSaleableWeight: netSaleableWeight ?? this.netSaleableWeight,
      rejectedWeight: rejectedWeight ?? this.rejectedWeight,
      moisturePercentage: moisturePercentage ?? this.moisturePercentage,
      wastePercentage: wastePercentage ?? this.wastePercentage,
      averageCocoonSize: averageCocoonSize ?? this.averageCocoonSize,
      gradeAWeight: gradeAWeight ?? this.gradeAWeight,
      gradeBWeight: gradeBWeight ?? this.gradeBWeight,
      gradeCWeight: gradeCWeight ?? this.gradeCWeight,
      yieldPercentage: yieldPercentage ?? this.yieldPercentage,
      survivalRate: survivalRate ?? this.survivalRate,
      feedConversionRatio: feedConversionRatio ?? this.feedConversionRatio,
      mortalityPercentage: mortalityPercentage ?? this.mortalityPercentage,
      harvestEfficiency: harvestEfficiency ?? this.harvestEfficiency,
      harvestedBy: harvestedBy ?? this.harvestedBy,
      remarks: remarks ?? this.remarks,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (harvestDate.present) {
      map['harvest_date'] = Variable<DateTime>(harvestDate.value);
    }
    if (actualHarvestDuration.present) {
      map['actual_harvest_duration'] =
          Variable<double>(actualHarvestDuration.value);
    }
    if (grossWeight.present) {
      map['gross_weight'] = Variable<double>(grossWeight.value);
    }
    if (netSaleableWeight.present) {
      map['net_saleable_weight'] = Variable<double>(netSaleableWeight.value);
    }
    if (rejectedWeight.present) {
      map['rejected_weight'] = Variable<double>(rejectedWeight.value);
    }
    if (moisturePercentage.present) {
      map['moisture_percentage'] = Variable<double>(moisturePercentage.value);
    }
    if (wastePercentage.present) {
      map['waste_percentage'] = Variable<double>(wastePercentage.value);
    }
    if (averageCocoonSize.present) {
      map['average_cocoon_size'] = Variable<double>(averageCocoonSize.value);
    }
    if (gradeAWeight.present) {
      map['grade_a_weight'] = Variable<double>(gradeAWeight.value);
    }
    if (gradeBWeight.present) {
      map['grade_b_weight'] = Variable<double>(gradeBWeight.value);
    }
    if (gradeCWeight.present) {
      map['grade_c_weight'] = Variable<double>(gradeCWeight.value);
    }
    if (yieldPercentage.present) {
      map['yield_percentage'] = Variable<double>(yieldPercentage.value);
    }
    if (survivalRate.present) {
      map['survival_rate'] = Variable<double>(survivalRate.value);
    }
    if (feedConversionRatio.present) {
      map['feed_conversion_ratio'] =
          Variable<double>(feedConversionRatio.value);
    }
    if (mortalityPercentage.present) {
      map['mortality_percentage'] = Variable<double>(mortalityPercentage.value);
    }
    if (harvestEfficiency.present) {
      map['harvest_efficiency'] = Variable<double>(harvestEfficiency.value);
    }
    if (harvestedBy.present) {
      map['harvested_by'] = Variable<String>(harvestedBy.value);
    }
    if (remarks.present) {
      map['remarks'] = Variable<String>(remarks.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HarvestsTableCompanion(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('harvestDate: $harvestDate, ')
          ..write('actualHarvestDuration: $actualHarvestDuration, ')
          ..write('grossWeight: $grossWeight, ')
          ..write('netSaleableWeight: $netSaleableWeight, ')
          ..write('rejectedWeight: $rejectedWeight, ')
          ..write('moisturePercentage: $moisturePercentage, ')
          ..write('wastePercentage: $wastePercentage, ')
          ..write('averageCocoonSize: $averageCocoonSize, ')
          ..write('gradeAWeight: $gradeAWeight, ')
          ..write('gradeBWeight: $gradeBWeight, ')
          ..write('gradeCWeight: $gradeCWeight, ')
          ..write('yieldPercentage: $yieldPercentage, ')
          ..write('survivalRate: $survivalRate, ')
          ..write('feedConversionRatio: $feedConversionRatio, ')
          ..write('mortalityPercentage: $mortalityPercentage, ')
          ..write('harvestEfficiency: $harvestEfficiency, ')
          ..write('harvestedBy: $harvestedBy, ')
          ..write('remarks: $remarks, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NotificationsTableTable extends NotificationsTable
    with TableInfo<$NotificationsTableTable, NotificationDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _messageMeta =
      const VerificationMeta('message');
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
      'message', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
      'priority', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool> isRead = GeneratedColumn<bool>(
      'is_read', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_read" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _referenceIdMeta =
      const VerificationMeta('referenceId');
  @override
  late final GeneratedColumn<String> referenceId = GeneratedColumn<String>(
      'reference_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, message, category, priority, timestamp, isRead, referenceId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notifications_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<NotificationDbModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('is_read')) {
      context.handle(_isReadMeta,
          isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta));
    }
    if (data.containsKey('reference_id')) {
      context.handle(
          _referenceIdMeta,
          referenceId.isAcceptableOrUnknown(
              data['reference_id']!, _referenceIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotificationDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationDbModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      message: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}priority'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      isRead: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_read'])!,
      referenceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reference_id']),
    );
  }

  @override
  $NotificationsTableTable createAlias(String alias) {
    return $NotificationsTableTable(attachedDatabase, alias);
  }
}

class NotificationDbModel extends DataClass
    implements Insertable<NotificationDbModel> {
  final String id;
  final String title;
  final String message;
  final String category;
  final String priority;
  final DateTime timestamp;
  final bool isRead;
  final String? referenceId;
  const NotificationDbModel(
      {required this.id,
      required this.title,
      required this.message,
      required this.category,
      required this.priority,
      required this.timestamp,
      required this.isRead,
      this.referenceId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['message'] = Variable<String>(message);
    map['category'] = Variable<String>(category);
    map['priority'] = Variable<String>(priority);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['is_read'] = Variable<bool>(isRead);
    if (!nullToAbsent || referenceId != null) {
      map['reference_id'] = Variable<String>(referenceId);
    }
    return map;
  }

  NotificationsTableCompanion toCompanion(bool nullToAbsent) {
    return NotificationsTableCompanion(
      id: Value(id),
      title: Value(title),
      message: Value(message),
      category: Value(category),
      priority: Value(priority),
      timestamp: Value(timestamp),
      isRead: Value(isRead),
      referenceId: referenceId == null && nullToAbsent
          ? const Value.absent()
          : Value(referenceId),
    );
  }

  factory NotificationDbModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationDbModel(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      message: serializer.fromJson<String>(json['message']),
      category: serializer.fromJson<String>(json['category']),
      priority: serializer.fromJson<String>(json['priority']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      isRead: serializer.fromJson<bool>(json['isRead']),
      referenceId: serializer.fromJson<String?>(json['referenceId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'message': serializer.toJson<String>(message),
      'category': serializer.toJson<String>(category),
      'priority': serializer.toJson<String>(priority),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'isRead': serializer.toJson<bool>(isRead),
      'referenceId': serializer.toJson<String?>(referenceId),
    };
  }

  NotificationDbModel copyWith(
          {String? id,
          String? title,
          String? message,
          String? category,
          String? priority,
          DateTime? timestamp,
          bool? isRead,
          Value<String?> referenceId = const Value.absent()}) =>
      NotificationDbModel(
        id: id ?? this.id,
        title: title ?? this.title,
        message: message ?? this.message,
        category: category ?? this.category,
        priority: priority ?? this.priority,
        timestamp: timestamp ?? this.timestamp,
        isRead: isRead ?? this.isRead,
        referenceId: referenceId.present ? referenceId.value : this.referenceId,
      );
  NotificationDbModel copyWithCompanion(NotificationsTableCompanion data) {
    return NotificationDbModel(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      message: data.message.present ? data.message.value : this.message,
      category: data.category.present ? data.category.value : this.category,
      priority: data.priority.present ? data.priority.value : this.priority,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      isRead: data.isRead.present ? data.isRead.value : this.isRead,
      referenceId:
          data.referenceId.present ? data.referenceId.value : this.referenceId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotificationDbModel(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('message: $message, ')
          ..write('category: $category, ')
          ..write('priority: $priority, ')
          ..write('timestamp: $timestamp, ')
          ..write('isRead: $isRead, ')
          ..write('referenceId: $referenceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, message, category, priority, timestamp, isRead, referenceId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationDbModel &&
          other.id == this.id &&
          other.title == this.title &&
          other.message == this.message &&
          other.category == this.category &&
          other.priority == this.priority &&
          other.timestamp == this.timestamp &&
          other.isRead == this.isRead &&
          other.referenceId == this.referenceId);
}

class NotificationsTableCompanion extends UpdateCompanion<NotificationDbModel> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> message;
  final Value<String> category;
  final Value<String> priority;
  final Value<DateTime> timestamp;
  final Value<bool> isRead;
  final Value<String?> referenceId;
  final Value<int> rowid;
  const NotificationsTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.message = const Value.absent(),
    this.category = const Value.absent(),
    this.priority = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.isRead = const Value.absent(),
    this.referenceId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotificationsTableCompanion.insert({
    required String id,
    required String title,
    required String message,
    required String category,
    required String priority,
    required DateTime timestamp,
    this.isRead = const Value.absent(),
    this.referenceId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        message = Value(message),
        category = Value(category),
        priority = Value(priority),
        timestamp = Value(timestamp);
  static Insertable<NotificationDbModel> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? message,
    Expression<String>? category,
    Expression<String>? priority,
    Expression<DateTime>? timestamp,
    Expression<bool>? isRead,
    Expression<String>? referenceId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (message != null) 'message': message,
      if (category != null) 'category': category,
      if (priority != null) 'priority': priority,
      if (timestamp != null) 'timestamp': timestamp,
      if (isRead != null) 'is_read': isRead,
      if (referenceId != null) 'reference_id': referenceId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotificationsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? message,
      Value<String>? category,
      Value<String>? priority,
      Value<DateTime>? timestamp,
      Value<bool>? isRead,
      Value<String?>? referenceId,
      Value<int>? rowid}) {
    return NotificationsTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      category: category ?? this.category,
      priority: priority ?? this.priority,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
      referenceId: referenceId ?? this.referenceId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    if (referenceId.present) {
      map['reference_id'] = Variable<String>(referenceId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationsTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('message: $message, ')
          ..write('category: $category, ')
          ..write('priority: $priority, ')
          ..write('timestamp: $timestamp, ')
          ..write('isRead: $isRead, ')
          ..write('referenceId: $referenceId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BackupsTableTable extends BackupsTable
    with TableInfo<$BackupsTableTable, BackupDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BackupsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fileNameMeta =
      const VerificationMeta('fileName');
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
      'file_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _fileSizeBytesMeta =
      const VerificationMeta('fileSizeBytes');
  @override
  late final GeneratedColumn<int> fileSizeBytes = GeneratedColumn<int>(
      'file_size_bytes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _databaseVersionMeta =
      const VerificationMeta('databaseVersion');
  @override
  late final GeneratedColumn<String> databaseVersion = GeneratedColumn<String>(
      'database_version', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _checksumMeta =
      const VerificationMeta('checksum');
  @override
  late final GeneratedColumn<String> checksum = GeneratedColumn<String>(
      'checksum', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isAutoBackupMeta =
      const VerificationMeta('isAutoBackup');
  @override
  late final GeneratedColumn<bool> isAutoBackup = GeneratedColumn<bool>(
      'is_auto_backup', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_auto_backup" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        fileName,
        filePath,
        timestamp,
        fileSizeBytes,
        databaseVersion,
        checksum,
        isAutoBackup
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'backups_table';
  @override
  VerificationContext validateIntegrity(Insertable<BackupDbModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('file_name')) {
      context.handle(_fileNameMeta,
          fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta));
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('file_size_bytes')) {
      context.handle(
          _fileSizeBytesMeta,
          fileSizeBytes.isAcceptableOrUnknown(
              data['file_size_bytes']!, _fileSizeBytesMeta));
    } else if (isInserting) {
      context.missing(_fileSizeBytesMeta);
    }
    if (data.containsKey('database_version')) {
      context.handle(
          _databaseVersionMeta,
          databaseVersion.isAcceptableOrUnknown(
              data['database_version']!, _databaseVersionMeta));
    } else if (isInserting) {
      context.missing(_databaseVersionMeta);
    }
    if (data.containsKey('checksum')) {
      context.handle(_checksumMeta,
          checksum.isAcceptableOrUnknown(data['checksum']!, _checksumMeta));
    } else if (isInserting) {
      context.missing(_checksumMeta);
    }
    if (data.containsKey('is_auto_backup')) {
      context.handle(
          _isAutoBackupMeta,
          isAutoBackup.isAcceptableOrUnknown(
              data['is_auto_backup']!, _isAutoBackupMeta));
    } else if (isInserting) {
      context.missing(_isAutoBackupMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BackupDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BackupDbModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      fileName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_name'])!,
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      fileSizeBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}file_size_bytes'])!,
      databaseVersion: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}database_version'])!,
      checksum: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}checksum'])!,
      isAutoBackup: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_auto_backup'])!,
    );
  }

  @override
  $BackupsTableTable createAlias(String alias) {
    return $BackupsTableTable(attachedDatabase, alias);
  }
}

class BackupDbModel extends DataClass implements Insertable<BackupDbModel> {
  final String id;
  final String fileName;
  final String filePath;
  final DateTime timestamp;
  final int fileSizeBytes;
  final String databaseVersion;
  final String checksum;
  final bool isAutoBackup;
  const BackupDbModel(
      {required this.id,
      required this.fileName,
      required this.filePath,
      required this.timestamp,
      required this.fileSizeBytes,
      required this.databaseVersion,
      required this.checksum,
      required this.isAutoBackup});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['file_name'] = Variable<String>(fileName);
    map['file_path'] = Variable<String>(filePath);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['file_size_bytes'] = Variable<int>(fileSizeBytes);
    map['database_version'] = Variable<String>(databaseVersion);
    map['checksum'] = Variable<String>(checksum);
    map['is_auto_backup'] = Variable<bool>(isAutoBackup);
    return map;
  }

  BackupsTableCompanion toCompanion(bool nullToAbsent) {
    return BackupsTableCompanion(
      id: Value(id),
      fileName: Value(fileName),
      filePath: Value(filePath),
      timestamp: Value(timestamp),
      fileSizeBytes: Value(fileSizeBytes),
      databaseVersion: Value(databaseVersion),
      checksum: Value(checksum),
      isAutoBackup: Value(isAutoBackup),
    );
  }

  factory BackupDbModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BackupDbModel(
      id: serializer.fromJson<String>(json['id']),
      fileName: serializer.fromJson<String>(json['fileName']),
      filePath: serializer.fromJson<String>(json['filePath']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      fileSizeBytes: serializer.fromJson<int>(json['fileSizeBytes']),
      databaseVersion: serializer.fromJson<String>(json['databaseVersion']),
      checksum: serializer.fromJson<String>(json['checksum']),
      isAutoBackup: serializer.fromJson<bool>(json['isAutoBackup']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'fileName': serializer.toJson<String>(fileName),
      'filePath': serializer.toJson<String>(filePath),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'fileSizeBytes': serializer.toJson<int>(fileSizeBytes),
      'databaseVersion': serializer.toJson<String>(databaseVersion),
      'checksum': serializer.toJson<String>(checksum),
      'isAutoBackup': serializer.toJson<bool>(isAutoBackup),
    };
  }

  BackupDbModel copyWith(
          {String? id,
          String? fileName,
          String? filePath,
          DateTime? timestamp,
          int? fileSizeBytes,
          String? databaseVersion,
          String? checksum,
          bool? isAutoBackup}) =>
      BackupDbModel(
        id: id ?? this.id,
        fileName: fileName ?? this.fileName,
        filePath: filePath ?? this.filePath,
        timestamp: timestamp ?? this.timestamp,
        fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
        databaseVersion: databaseVersion ?? this.databaseVersion,
        checksum: checksum ?? this.checksum,
        isAutoBackup: isAutoBackup ?? this.isAutoBackup,
      );
  BackupDbModel copyWithCompanion(BackupsTableCompanion data) {
    return BackupDbModel(
      id: data.id.present ? data.id.value : this.id,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      fileSizeBytes: data.fileSizeBytes.present
          ? data.fileSizeBytes.value
          : this.fileSizeBytes,
      databaseVersion: data.databaseVersion.present
          ? data.databaseVersion.value
          : this.databaseVersion,
      checksum: data.checksum.present ? data.checksum.value : this.checksum,
      isAutoBackup: data.isAutoBackup.present
          ? data.isAutoBackup.value
          : this.isAutoBackup,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BackupDbModel(')
          ..write('id: $id, ')
          ..write('fileName: $fileName, ')
          ..write('filePath: $filePath, ')
          ..write('timestamp: $timestamp, ')
          ..write('fileSizeBytes: $fileSizeBytes, ')
          ..write('databaseVersion: $databaseVersion, ')
          ..write('checksum: $checksum, ')
          ..write('isAutoBackup: $isAutoBackup')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, fileName, filePath, timestamp,
      fileSizeBytes, databaseVersion, checksum, isAutoBackup);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BackupDbModel &&
          other.id == this.id &&
          other.fileName == this.fileName &&
          other.filePath == this.filePath &&
          other.timestamp == this.timestamp &&
          other.fileSizeBytes == this.fileSizeBytes &&
          other.databaseVersion == this.databaseVersion &&
          other.checksum == this.checksum &&
          other.isAutoBackup == this.isAutoBackup);
}

class BackupsTableCompanion extends UpdateCompanion<BackupDbModel> {
  final Value<String> id;
  final Value<String> fileName;
  final Value<String> filePath;
  final Value<DateTime> timestamp;
  final Value<int> fileSizeBytes;
  final Value<String> databaseVersion;
  final Value<String> checksum;
  final Value<bool> isAutoBackup;
  final Value<int> rowid;
  const BackupsTableCompanion({
    this.id = const Value.absent(),
    this.fileName = const Value.absent(),
    this.filePath = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.fileSizeBytes = const Value.absent(),
    this.databaseVersion = const Value.absent(),
    this.checksum = const Value.absent(),
    this.isAutoBackup = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BackupsTableCompanion.insert({
    required String id,
    required String fileName,
    required String filePath,
    required DateTime timestamp,
    required int fileSizeBytes,
    required String databaseVersion,
    required String checksum,
    required bool isAutoBackup,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        fileName = Value(fileName),
        filePath = Value(filePath),
        timestamp = Value(timestamp),
        fileSizeBytes = Value(fileSizeBytes),
        databaseVersion = Value(databaseVersion),
        checksum = Value(checksum),
        isAutoBackup = Value(isAutoBackup);
  static Insertable<BackupDbModel> custom({
    Expression<String>? id,
    Expression<String>? fileName,
    Expression<String>? filePath,
    Expression<DateTime>? timestamp,
    Expression<int>? fileSizeBytes,
    Expression<String>? databaseVersion,
    Expression<String>? checksum,
    Expression<bool>? isAutoBackup,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fileName != null) 'file_name': fileName,
      if (filePath != null) 'file_path': filePath,
      if (timestamp != null) 'timestamp': timestamp,
      if (fileSizeBytes != null) 'file_size_bytes': fileSizeBytes,
      if (databaseVersion != null) 'database_version': databaseVersion,
      if (checksum != null) 'checksum': checksum,
      if (isAutoBackup != null) 'is_auto_backup': isAutoBackup,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BackupsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? fileName,
      Value<String>? filePath,
      Value<DateTime>? timestamp,
      Value<int>? fileSizeBytes,
      Value<String>? databaseVersion,
      Value<String>? checksum,
      Value<bool>? isAutoBackup,
      Value<int>? rowid}) {
    return BackupsTableCompanion(
      id: id ?? this.id,
      fileName: fileName ?? this.fileName,
      filePath: filePath ?? this.filePath,
      timestamp: timestamp ?? this.timestamp,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      databaseVersion: databaseVersion ?? this.databaseVersion,
      checksum: checksum ?? this.checksum,
      isAutoBackup: isAutoBackup ?? this.isAutoBackup,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (fileSizeBytes.present) {
      map['file_size_bytes'] = Variable<int>(fileSizeBytes.value);
    }
    if (databaseVersion.present) {
      map['database_version'] = Variable<String>(databaseVersion.value);
    }
    if (checksum.present) {
      map['checksum'] = Variable<String>(checksum.value);
    }
    if (isAutoBackup.present) {
      map['is_auto_backup'] = Variable<bool>(isAutoBackup.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BackupsTableCompanion(')
          ..write('id: $id, ')
          ..write('fileName: $fileName, ')
          ..write('filePath: $filePath, ')
          ..write('timestamp: $timestamp, ')
          ..write('fileSizeBytes: $fileSizeBytes, ')
          ..write('databaseVersion: $databaseVersion, ')
          ..write('checksum: $checksum, ')
          ..write('isAutoBackup: $isAutoBackup, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ExpenseCategoriesTableTable expenseCategoriesTable =
      $ExpenseCategoriesTableTable(this);
  late final $BatchesTableTable batchesTable = $BatchesTableTable(this);
  late final $ExpensesTableTable expensesTable = $ExpensesTableTable(this);
  late final $BuyersTableTable buyersTable = $BuyersTableTable(this);
  late final $IncomeCategoriesTableTable incomeCategoriesTable =
      $IncomeCategoriesTableTable(this);
  late final $IncomesTableTable incomesTable = $IncomesTableTable(this);
  late final $BatchTimelinesTableTable batchTimelinesTable =
      $BatchTimelinesTableTable(this);
  late final $InventoryCategoriesTableTable inventoryCategoriesTable =
      $InventoryCategoriesTableTable(this);
  late final $InventoryItemsTableTable inventoryItemsTable =
      $InventoryItemsTableTable(this);
  late final $InventoryTransactionsTableTable inventoryTransactionsTable =
      $InventoryTransactionsTableTable(this);
  late final $WorkersTableTable workersTable = $WorkersTableTable(this);
  late final $AttendanceTableTable attendanceTable =
      $AttendanceTableTable(this);
  late final $AssignmentsTableTable assignmentsTable =
      $AssignmentsTableTable(this);
  late final $WagesTableTable wagesTable = $WagesTableTable(this);
  late final $FeedingLogsTableTable feedingLogsTable =
      $FeedingLogsTableTable(this);
  late final $EnvironmentalLogsTableTable environmentalLogsTable =
      $EnvironmentalLogsTableTable(this);
  late final $MortalityLogsTableTable mortalityLogsTable =
      $MortalityLogsTableTable(this);
  late final $HarvestsTableTable harvestsTable = $HarvestsTableTable(this);
  late final $NotificationsTableTable notificationsTable =
      $NotificationsTableTable(this);
  late final $BackupsTableTable backupsTable = $BackupsTableTable(this);
  late final ExpenseDao expenseDao = ExpenseDao(this as AppDatabase);
  late final IncomeDao incomeDao = IncomeDao(this as AppDatabase);
  late final BatchDao batchDao = BatchDao(this as AppDatabase);
  late final InventoryDao inventoryDao = InventoryDao(this as AppDatabase);
  late final LabourDao labourDao = LabourDao(this as AppDatabase);
  late final FeedingDao feedingDao = FeedingDao(this as AppDatabase);
  late final HarvestDao harvestDao = HarvestDao(this as AppDatabase);
  late final ReportsDao reportsDao = ReportsDao(this as AppDatabase);
  late final NotificationDao notificationDao =
      NotificationDao(this as AppDatabase);
  late final BackupDao backupDao = BackupDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        expenseCategoriesTable,
        batchesTable,
        expensesTable,
        buyersTable,
        incomeCategoriesTable,
        incomesTable,
        batchTimelinesTable,
        inventoryCategoriesTable,
        inventoryItemsTable,
        inventoryTransactionsTable,
        workersTable,
        attendanceTable,
        assignmentsTable,
        wagesTable,
        feedingLogsTable,
        environmentalLogsTable,
        mortalityLogsTable,
        harvestsTable,
        notificationsTable,
        backupsTable
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('batches_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('expenses_table', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('batches_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('incomes_table', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('batches_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('batch_timelines_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('inventory_items_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('inventory_transactions_table',
                  kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('batches_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('inventory_transactions_table',
                  kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('workers_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('attendance_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('workers_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('assignments_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('workers_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('wages_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('batches_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('feeding_logs_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('batches_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('environmental_logs_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('batches_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('mortality_logs_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('batches_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('harvests_table', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$ExpenseCategoriesTableTableCreateCompanionBuilder
    = ExpenseCategoriesTableCompanion Function({
  required String id,
  required String name,
  required String colorCode,
  required String iconName,
  Value<int> rowid,
});
typedef $$ExpenseCategoriesTableTableUpdateCompanionBuilder
    = ExpenseCategoriesTableCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> colorCode,
  Value<String> iconName,
  Value<int> rowid,
});

final class $$ExpenseCategoriesTableTableReferences extends BaseReferences<
    _$AppDatabase, $ExpenseCategoriesTableTable, ExpenseCategoryDbModel> {
  $$ExpenseCategoriesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ExpensesTableTable, List<ExpenseDbModel>>
      _expensesTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.expensesTable,
              aliasName:
                  'expense_categories_table__id__expenses_table__category_id');

  $$ExpensesTableTableProcessedTableManager get expensesTableRefs {
    final manager = $$ExpensesTableTableTableManager($_db, $_db.expensesTable)
        .filter((f) => f.categoryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_expensesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ExpenseCategoriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $ExpenseCategoriesTableTable> {
  $$ExpenseCategoriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get colorCode => $composableBuilder(
      column: $table.colorCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnFilters(column));

  Expression<bool> expensesTableRefs(
      Expression<bool> Function($$ExpensesTableTableFilterComposer f) f) {
    final $$ExpensesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expensesTable,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableTableFilterComposer(
              $db: $db,
              $table: $db.expensesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ExpenseCategoriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpenseCategoriesTableTable> {
  $$ExpenseCategoriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get colorCode => $composableBuilder(
      column: $table.colorCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnOrderings(column));
}

class $$ExpenseCategoriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpenseCategoriesTableTable> {
  $$ExpenseCategoriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get colorCode =>
      $composableBuilder(column: $table.colorCode, builder: (column) => column);

  GeneratedColumn<String> get iconName =>
      $composableBuilder(column: $table.iconName, builder: (column) => column);

  Expression<T> expensesTableRefs<T extends Object>(
      Expression<T> Function($$ExpensesTableTableAnnotationComposer a) f) {
    final $$ExpensesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expensesTable,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.expensesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ExpenseCategoriesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExpenseCategoriesTableTable,
    ExpenseCategoryDbModel,
    $$ExpenseCategoriesTableTableFilterComposer,
    $$ExpenseCategoriesTableTableOrderingComposer,
    $$ExpenseCategoriesTableTableAnnotationComposer,
    $$ExpenseCategoriesTableTableCreateCompanionBuilder,
    $$ExpenseCategoriesTableTableUpdateCompanionBuilder,
    (ExpenseCategoryDbModel, $$ExpenseCategoriesTableTableReferences),
    ExpenseCategoryDbModel,
    PrefetchHooks Function({bool expensesTableRefs})> {
  $$ExpenseCategoriesTableTableTableManager(
      _$AppDatabase db, $ExpenseCategoriesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpenseCategoriesTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpenseCategoriesTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpenseCategoriesTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> colorCode = const Value.absent(),
            Value<String> iconName = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExpenseCategoriesTableCompanion(
            id: id,
            name: name,
            colorCode: colorCode,
            iconName: iconName,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String colorCode,
            required String iconName,
            Value<int> rowid = const Value.absent(),
          }) =>
              ExpenseCategoriesTableCompanion.insert(
            id: id,
            name: name,
            colorCode: colorCode,
            iconName: iconName,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ExpenseCategoriesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({expensesTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (expensesTableRefs) db.expensesTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (expensesTableRefs)
                    await $_getPrefetchedData<ExpenseCategoryDbModel,
                            $ExpenseCategoriesTableTable, ExpenseDbModel>(
                        currentTable: table,
                        referencedTable: $$ExpenseCategoriesTableTableReferences
                            ._expensesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ExpenseCategoriesTableTableReferences(
                                    db, table, p0)
                                .expensesTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ExpenseCategoriesTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $ExpenseCategoriesTableTable,
        ExpenseCategoryDbModel,
        $$ExpenseCategoriesTableTableFilterComposer,
        $$ExpenseCategoriesTableTableOrderingComposer,
        $$ExpenseCategoriesTableTableAnnotationComposer,
        $$ExpenseCategoriesTableTableCreateCompanionBuilder,
        $$ExpenseCategoriesTableTableUpdateCompanionBuilder,
        (ExpenseCategoryDbModel, $$ExpenseCategoriesTableTableReferences),
        ExpenseCategoryDbModel,
        PrefetchHooks Function({bool expensesTableRefs})>;
typedef $$BatchesTableTableCreateCompanionBuilder = BatchesTableCompanion
    Function({
  required String id,
  required String batchName,
  required DateTime startDate,
  required DateTime expectedHarvestDate,
  Value<DateTime?> actualHarvestDate,
  required String silkwormVariety,
  required String eggSource,
  required int numberOfDfls,
  Value<double?> dflPrice,
  required String mulberryVariety,
  required String rearingHouse,
  required String currentStage,
  required int currentAgeDays,
  required String status,
  required String healthStatus,
  required double temperature,
  required double humidity,
  Value<String?> notes,
  Value<int> rowid,
});
typedef $$BatchesTableTableUpdateCompanionBuilder = BatchesTableCompanion
    Function({
  Value<String> id,
  Value<String> batchName,
  Value<DateTime> startDate,
  Value<DateTime> expectedHarvestDate,
  Value<DateTime?> actualHarvestDate,
  Value<String> silkwormVariety,
  Value<String> eggSource,
  Value<int> numberOfDfls,
  Value<double?> dflPrice,
  Value<String> mulberryVariety,
  Value<String> rearingHouse,
  Value<String> currentStage,
  Value<int> currentAgeDays,
  Value<String> status,
  Value<String> healthStatus,
  Value<double> temperature,
  Value<double> humidity,
  Value<String?> notes,
  Value<int> rowid,
});

final class $$BatchesTableTableReferences
    extends BaseReferences<_$AppDatabase, $BatchesTableTable, BatchDbModel> {
  $$BatchesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ExpensesTableTable, List<ExpenseDbModel>>
      _expensesTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.expensesTable,
              aliasName: 'batches_table__id__expenses_table__batch_id');

  $$ExpensesTableTableProcessedTableManager get expensesTableRefs {
    final manager = $$ExpensesTableTableTableManager($_db, $_db.expensesTable)
        .filter((f) => f.batchId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_expensesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$IncomesTableTable, List<IncomeDbModel>>
      _incomesTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.incomesTable,
              aliasName: 'batches_table__id__incomes_table__batch_id');

  $$IncomesTableTableProcessedTableManager get incomesTableRefs {
    final manager = $$IncomesTableTableTableManager($_db, $_db.incomesTable)
        .filter((f) => f.batchId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_incomesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$BatchTimelinesTableTable,
      List<BatchTimelineDbModel>> _batchTimelinesTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.batchTimelinesTable,
          aliasName: 'batches_table__id__batch_timelines_table__batch_id');

  $$BatchTimelinesTableTableProcessedTableManager get batchTimelinesTableRefs {
    final manager =
        $$BatchTimelinesTableTableTableManager($_db, $_db.batchTimelinesTable)
            .filter((f) => f.batchId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_batchTimelinesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$InventoryTransactionsTableTable,
      List<InventoryTransactionDbModel>> _inventoryTransactionsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.inventoryTransactionsTable,
          aliasName:
              'batches_table__id__inventory_transactions_table__batch_id');

  $$InventoryTransactionsTableTableProcessedTableManager
      get inventoryTransactionsTableRefs {
    final manager = $$InventoryTransactionsTableTableTableManager(
            $_db, $_db.inventoryTransactionsTable)
        .filter((f) => f.batchId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult
        .readTableOrNull(_inventoryTransactionsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$FeedingLogsTableTable, List<FeedingLogDbModel>>
      _feedingLogsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.feedingLogsTable,
              aliasName: 'batches_table__id__feeding_logs_table__batch_id');

  $$FeedingLogsTableTableProcessedTableManager get feedingLogsTableRefs {
    final manager =
        $$FeedingLogsTableTableTableManager($_db, $_db.feedingLogsTable)
            .filter((f) => f.batchId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_feedingLogsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$EnvironmentalLogsTableTable,
      List<EnvironmentalReadingDbModel>> _environmentalLogsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.environmentalLogsTable,
          aliasName: 'batches_table__id__environmental_logs_table__batch_id');

  $$EnvironmentalLogsTableTableProcessedTableManager
      get environmentalLogsTableRefs {
    final manager = $$EnvironmentalLogsTableTableTableManager(
            $_db, $_db.environmentalLogsTable)
        .filter((f) => f.batchId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_environmentalLogsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$MortalityLogsTableTable,
      List<MortalityLogDbModel>> _mortalityLogsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.mortalityLogsTable,
          aliasName: 'batches_table__id__mortality_logs_table__batch_id');

  $$MortalityLogsTableTableProcessedTableManager get mortalityLogsTableRefs {
    final manager =
        $$MortalityLogsTableTableTableManager($_db, $_db.mortalityLogsTable)
            .filter((f) => f.batchId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_mortalityLogsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$HarvestsTableTable, List<HarvestRecordDbModel>>
      _harvestsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.harvestsTable,
              aliasName: 'batches_table__id__harvests_table__batch_id');

  $$HarvestsTableTableProcessedTableManager get harvestsTableRefs {
    final manager = $$HarvestsTableTableTableManager($_db, $_db.harvestsTable)
        .filter((f) => f.batchId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_harvestsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$BatchesTableTableFilterComposer
    extends Composer<_$AppDatabase, $BatchesTableTable> {
  $$BatchesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get batchName => $composableBuilder(
      column: $table.batchName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get expectedHarvestDate => $composableBuilder(
      column: $table.expectedHarvestDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get actualHarvestDate => $composableBuilder(
      column: $table.actualHarvestDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get silkwormVariety => $composableBuilder(
      column: $table.silkwormVariety,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get eggSource => $composableBuilder(
      column: $table.eggSource, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get numberOfDfls => $composableBuilder(
      column: $table.numberOfDfls, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get dflPrice => $composableBuilder(
      column: $table.dflPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mulberryVariety => $composableBuilder(
      column: $table.mulberryVariety,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get rearingHouse => $composableBuilder(
      column: $table.rearingHouse, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currentStage => $composableBuilder(
      column: $table.currentStage, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentAgeDays => $composableBuilder(
      column: $table.currentAgeDays,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get healthStatus => $composableBuilder(
      column: $table.healthStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get temperature => $composableBuilder(
      column: $table.temperature, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get humidity => $composableBuilder(
      column: $table.humidity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  Expression<bool> expensesTableRefs(
      Expression<bool> Function($$ExpensesTableTableFilterComposer f) f) {
    final $$ExpensesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expensesTable,
        getReferencedColumn: (t) => t.batchId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableTableFilterComposer(
              $db: $db,
              $table: $db.expensesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> incomesTableRefs(
      Expression<bool> Function($$IncomesTableTableFilterComposer f) f) {
    final $$IncomesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.incomesTable,
        getReferencedColumn: (t) => t.batchId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IncomesTableTableFilterComposer(
              $db: $db,
              $table: $db.incomesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> batchTimelinesTableRefs(
      Expression<bool> Function($$BatchTimelinesTableTableFilterComposer f) f) {
    final $$BatchTimelinesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.batchTimelinesTable,
        getReferencedColumn: (t) => t.batchId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchTimelinesTableTableFilterComposer(
              $db: $db,
              $table: $db.batchTimelinesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> inventoryTransactionsTableRefs(
      Expression<bool> Function(
              $$InventoryTransactionsTableTableFilterComposer f)
          f) {
    final $$InventoryTransactionsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.inventoryTransactionsTable,
            getReferencedColumn: (t) => t.batchId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$InventoryTransactionsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.inventoryTransactionsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> feedingLogsTableRefs(
      Expression<bool> Function($$FeedingLogsTableTableFilterComposer f) f) {
    final $$FeedingLogsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.feedingLogsTable,
        getReferencedColumn: (t) => t.batchId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FeedingLogsTableTableFilterComposer(
              $db: $db,
              $table: $db.feedingLogsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> environmentalLogsTableRefs(
      Expression<bool> Function($$EnvironmentalLogsTableTableFilterComposer f)
          f) {
    final $$EnvironmentalLogsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.environmentalLogsTable,
            getReferencedColumn: (t) => t.batchId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$EnvironmentalLogsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.environmentalLogsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> mortalityLogsTableRefs(
      Expression<bool> Function($$MortalityLogsTableTableFilterComposer f) f) {
    final $$MortalityLogsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.mortalityLogsTable,
        getReferencedColumn: (t) => t.batchId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MortalityLogsTableTableFilterComposer(
              $db: $db,
              $table: $db.mortalityLogsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> harvestsTableRefs(
      Expression<bool> Function($$HarvestsTableTableFilterComposer f) f) {
    final $$HarvestsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.harvestsTable,
        getReferencedColumn: (t) => t.batchId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HarvestsTableTableFilterComposer(
              $db: $db,
              $table: $db.harvestsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$BatchesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BatchesTableTable> {
  $$BatchesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get batchName => $composableBuilder(
      column: $table.batchName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get expectedHarvestDate => $composableBuilder(
      column: $table.expectedHarvestDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get actualHarvestDate => $composableBuilder(
      column: $table.actualHarvestDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get silkwormVariety => $composableBuilder(
      column: $table.silkwormVariety,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get eggSource => $composableBuilder(
      column: $table.eggSource, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get numberOfDfls => $composableBuilder(
      column: $table.numberOfDfls,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get dflPrice => $composableBuilder(
      column: $table.dflPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mulberryVariety => $composableBuilder(
      column: $table.mulberryVariety,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rearingHouse => $composableBuilder(
      column: $table.rearingHouse,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currentStage => $composableBuilder(
      column: $table.currentStage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentAgeDays => $composableBuilder(
      column: $table.currentAgeDays,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get healthStatus => $composableBuilder(
      column: $table.healthStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get temperature => $composableBuilder(
      column: $table.temperature, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get humidity => $composableBuilder(
      column: $table.humidity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));
}

class $$BatchesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BatchesTableTable> {
  $$BatchesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get batchName =>
      $composableBuilder(column: $table.batchName, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get expectedHarvestDate => $composableBuilder(
      column: $table.expectedHarvestDate, builder: (column) => column);

  GeneratedColumn<DateTime> get actualHarvestDate => $composableBuilder(
      column: $table.actualHarvestDate, builder: (column) => column);

  GeneratedColumn<String> get silkwormVariety => $composableBuilder(
      column: $table.silkwormVariety, builder: (column) => column);

  GeneratedColumn<String> get eggSource =>
      $composableBuilder(column: $table.eggSource, builder: (column) => column);

  GeneratedColumn<int> get numberOfDfls => $composableBuilder(
      column: $table.numberOfDfls, builder: (column) => column);

  GeneratedColumn<double> get dflPrice =>
      $composableBuilder(column: $table.dflPrice, builder: (column) => column);

  GeneratedColumn<String> get mulberryVariety => $composableBuilder(
      column: $table.mulberryVariety, builder: (column) => column);

  GeneratedColumn<String> get rearingHouse => $composableBuilder(
      column: $table.rearingHouse, builder: (column) => column);

  GeneratedColumn<String> get currentStage => $composableBuilder(
      column: $table.currentStage, builder: (column) => column);

  GeneratedColumn<int> get currentAgeDays => $composableBuilder(
      column: $table.currentAgeDays, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get healthStatus => $composableBuilder(
      column: $table.healthStatus, builder: (column) => column);

  GeneratedColumn<double> get temperature => $composableBuilder(
      column: $table.temperature, builder: (column) => column);

  GeneratedColumn<double> get humidity =>
      $composableBuilder(column: $table.humidity, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  Expression<T> expensesTableRefs<T extends Object>(
      Expression<T> Function($$ExpensesTableTableAnnotationComposer a) f) {
    final $$ExpensesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expensesTable,
        getReferencedColumn: (t) => t.batchId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.expensesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> incomesTableRefs<T extends Object>(
      Expression<T> Function($$IncomesTableTableAnnotationComposer a) f) {
    final $$IncomesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.incomesTable,
        getReferencedColumn: (t) => t.batchId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IncomesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.incomesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> batchTimelinesTableRefs<T extends Object>(
      Expression<T> Function($$BatchTimelinesTableTableAnnotationComposer a)
          f) {
    final $$BatchTimelinesTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.batchTimelinesTable,
            getReferencedColumn: (t) => t.batchId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$BatchTimelinesTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.batchTimelinesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> inventoryTransactionsTableRefs<T extends Object>(
      Expression<T> Function(
              $$InventoryTransactionsTableTableAnnotationComposer a)
          f) {
    final $$InventoryTransactionsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.inventoryTransactionsTable,
            getReferencedColumn: (t) => t.batchId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$InventoryTransactionsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.inventoryTransactionsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> feedingLogsTableRefs<T extends Object>(
      Expression<T> Function($$FeedingLogsTableTableAnnotationComposer a) f) {
    final $$FeedingLogsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.feedingLogsTable,
        getReferencedColumn: (t) => t.batchId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FeedingLogsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.feedingLogsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> environmentalLogsTableRefs<T extends Object>(
      Expression<T> Function($$EnvironmentalLogsTableTableAnnotationComposer a)
          f) {
    final $$EnvironmentalLogsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.environmentalLogsTable,
            getReferencedColumn: (t) => t.batchId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$EnvironmentalLogsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.environmentalLogsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> mortalityLogsTableRefs<T extends Object>(
      Expression<T> Function($$MortalityLogsTableTableAnnotationComposer a) f) {
    final $$MortalityLogsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.mortalityLogsTable,
            getReferencedColumn: (t) => t.batchId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MortalityLogsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.mortalityLogsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> harvestsTableRefs<T extends Object>(
      Expression<T> Function($$HarvestsTableTableAnnotationComposer a) f) {
    final $$HarvestsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.harvestsTable,
        getReferencedColumn: (t) => t.batchId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HarvestsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.harvestsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$BatchesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BatchesTableTable,
    BatchDbModel,
    $$BatchesTableTableFilterComposer,
    $$BatchesTableTableOrderingComposer,
    $$BatchesTableTableAnnotationComposer,
    $$BatchesTableTableCreateCompanionBuilder,
    $$BatchesTableTableUpdateCompanionBuilder,
    (BatchDbModel, $$BatchesTableTableReferences),
    BatchDbModel,
    PrefetchHooks Function(
        {bool expensesTableRefs,
        bool incomesTableRefs,
        bool batchTimelinesTableRefs,
        bool inventoryTransactionsTableRefs,
        bool feedingLogsTableRefs,
        bool environmentalLogsTableRefs,
        bool mortalityLogsTableRefs,
        bool harvestsTableRefs})> {
  $$BatchesTableTableTableManager(_$AppDatabase db, $BatchesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BatchesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BatchesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BatchesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> batchName = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime> expectedHarvestDate = const Value.absent(),
            Value<DateTime?> actualHarvestDate = const Value.absent(),
            Value<String> silkwormVariety = const Value.absent(),
            Value<String> eggSource = const Value.absent(),
            Value<int> numberOfDfls = const Value.absent(),
            Value<double?> dflPrice = const Value.absent(),
            Value<String> mulberryVariety = const Value.absent(),
            Value<String> rearingHouse = const Value.absent(),
            Value<String> currentStage = const Value.absent(),
            Value<int> currentAgeDays = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> healthStatus = const Value.absent(),
            Value<double> temperature = const Value.absent(),
            Value<double> humidity = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BatchesTableCompanion(
            id: id,
            batchName: batchName,
            startDate: startDate,
            expectedHarvestDate: expectedHarvestDate,
            actualHarvestDate: actualHarvestDate,
            silkwormVariety: silkwormVariety,
            eggSource: eggSource,
            numberOfDfls: numberOfDfls,
            dflPrice: dflPrice,
            mulberryVariety: mulberryVariety,
            rearingHouse: rearingHouse,
            currentStage: currentStage,
            currentAgeDays: currentAgeDays,
            status: status,
            healthStatus: healthStatus,
            temperature: temperature,
            humidity: humidity,
            notes: notes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String batchName,
            required DateTime startDate,
            required DateTime expectedHarvestDate,
            Value<DateTime?> actualHarvestDate = const Value.absent(),
            required String silkwormVariety,
            required String eggSource,
            required int numberOfDfls,
            Value<double?> dflPrice = const Value.absent(),
            required String mulberryVariety,
            required String rearingHouse,
            required String currentStage,
            required int currentAgeDays,
            required String status,
            required String healthStatus,
            required double temperature,
            required double humidity,
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BatchesTableCompanion.insert(
            id: id,
            batchName: batchName,
            startDate: startDate,
            expectedHarvestDate: expectedHarvestDate,
            actualHarvestDate: actualHarvestDate,
            silkwormVariety: silkwormVariety,
            eggSource: eggSource,
            numberOfDfls: numberOfDfls,
            dflPrice: dflPrice,
            mulberryVariety: mulberryVariety,
            rearingHouse: rearingHouse,
            currentStage: currentStage,
            currentAgeDays: currentAgeDays,
            status: status,
            healthStatus: healthStatus,
            temperature: temperature,
            humidity: humidity,
            notes: notes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BatchesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {expensesTableRefs = false,
              incomesTableRefs = false,
              batchTimelinesTableRefs = false,
              inventoryTransactionsTableRefs = false,
              feedingLogsTableRefs = false,
              environmentalLogsTableRefs = false,
              mortalityLogsTableRefs = false,
              harvestsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (expensesTableRefs) db.expensesTable,
                if (incomesTableRefs) db.incomesTable,
                if (batchTimelinesTableRefs) db.batchTimelinesTable,
                if (inventoryTransactionsTableRefs)
                  db.inventoryTransactionsTable,
                if (feedingLogsTableRefs) db.feedingLogsTable,
                if (environmentalLogsTableRefs) db.environmentalLogsTable,
                if (mortalityLogsTableRefs) db.mortalityLogsTable,
                if (harvestsTableRefs) db.harvestsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (expensesTableRefs)
                    await $_getPrefetchedData<BatchDbModel, $BatchesTableTable,
                            ExpenseDbModel>(
                        currentTable: table,
                        referencedTable: $$BatchesTableTableReferences
                            ._expensesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BatchesTableTableReferences(db, table, p0)
                                .expensesTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.batchId == item.id),
                        typedResults: items),
                  if (incomesTableRefs)
                    await $_getPrefetchedData<BatchDbModel, $BatchesTableTable,
                            IncomeDbModel>(
                        currentTable: table,
                        referencedTable: $$BatchesTableTableReferences
                            ._incomesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BatchesTableTableReferences(db, table, p0)
                                .incomesTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.batchId == item.id),
                        typedResults: items),
                  if (batchTimelinesTableRefs)
                    await $_getPrefetchedData<BatchDbModel, $BatchesTableTable,
                            BatchTimelineDbModel>(
                        currentTable: table,
                        referencedTable: $$BatchesTableTableReferences
                            ._batchTimelinesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BatchesTableTableReferences(db, table, p0)
                                .batchTimelinesTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.batchId == item.id),
                        typedResults: items),
                  if (inventoryTransactionsTableRefs)
                    await $_getPrefetchedData<BatchDbModel, $BatchesTableTable,
                            InventoryTransactionDbModel>(
                        currentTable: table,
                        referencedTable: $$BatchesTableTableReferences
                            ._inventoryTransactionsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BatchesTableTableReferences(db, table, p0)
                                .inventoryTransactionsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.batchId == item.id),
                        typedResults: items),
                  if (feedingLogsTableRefs)
                    await $_getPrefetchedData<BatchDbModel, $BatchesTableTable,
                            FeedingLogDbModel>(
                        currentTable: table,
                        referencedTable: $$BatchesTableTableReferences
                            ._feedingLogsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BatchesTableTableReferences(db, table, p0)
                                .feedingLogsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.batchId == item.id),
                        typedResults: items),
                  if (environmentalLogsTableRefs)
                    await $_getPrefetchedData<BatchDbModel, $BatchesTableTable,
                            EnvironmentalReadingDbModel>(
                        currentTable: table,
                        referencedTable: $$BatchesTableTableReferences
                            ._environmentalLogsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BatchesTableTableReferences(db, table, p0)
                                .environmentalLogsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.batchId == item.id),
                        typedResults: items),
                  if (mortalityLogsTableRefs)
                    await $_getPrefetchedData<BatchDbModel, $BatchesTableTable,
                            MortalityLogDbModel>(
                        currentTable: table,
                        referencedTable: $$BatchesTableTableReferences
                            ._mortalityLogsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BatchesTableTableReferences(db, table, p0)
                                .mortalityLogsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.batchId == item.id),
                        typedResults: items),
                  if (harvestsTableRefs)
                    await $_getPrefetchedData<BatchDbModel, $BatchesTableTable,
                            HarvestRecordDbModel>(
                        currentTable: table,
                        referencedTable: $$BatchesTableTableReferences
                            ._harvestsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BatchesTableTableReferences(db, table, p0)
                                .harvestsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.batchId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$BatchesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BatchesTableTable,
    BatchDbModel,
    $$BatchesTableTableFilterComposer,
    $$BatchesTableTableOrderingComposer,
    $$BatchesTableTableAnnotationComposer,
    $$BatchesTableTableCreateCompanionBuilder,
    $$BatchesTableTableUpdateCompanionBuilder,
    (BatchDbModel, $$BatchesTableTableReferences),
    BatchDbModel,
    PrefetchHooks Function(
        {bool expensesTableRefs,
        bool incomesTableRefs,
        bool batchTimelinesTableRefs,
        bool inventoryTransactionsTableRefs,
        bool feedingLogsTableRefs,
        bool environmentalLogsTableRefs,
        bool mortalityLogsTableRefs,
        bool harvestsTableRefs})>;
typedef $$ExpensesTableTableCreateCompanionBuilder = ExpensesTableCompanion
    Function({
  required String id,
  required double amount,
  Value<double?> quantity,
  required DateTime date,
  required String categoryId,
  required String paymentMethod,
  required String description,
  Value<String?> batchId,
  Value<String?> receiptUrl,
  Value<int> rowid,
});
typedef $$ExpensesTableTableUpdateCompanionBuilder = ExpensesTableCompanion
    Function({
  Value<String> id,
  Value<double> amount,
  Value<double?> quantity,
  Value<DateTime> date,
  Value<String> categoryId,
  Value<String> paymentMethod,
  Value<String> description,
  Value<String?> batchId,
  Value<String?> receiptUrl,
  Value<int> rowid,
});

final class $$ExpensesTableTableReferences
    extends BaseReferences<_$AppDatabase, $ExpensesTableTable, ExpenseDbModel> {
  $$ExpensesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ExpenseCategoriesTableTable _categoryIdTable(_$AppDatabase db) => db
      .expenseCategoriesTable
      .createAlias('expenses_table__category_id__expense_categories_table__id');

  $$ExpenseCategoriesTableTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<String>('category_id')!;

    final manager = $$ExpenseCategoriesTableTableTableManager(
            $_db, $_db.expenseCategoriesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $BatchesTableTable _batchIdTable(_$AppDatabase db) => db.batchesTable
      .createAlias('expenses_table__batch_id__batches_table__id');

  $$BatchesTableTableProcessedTableManager? get batchId {
    final $_column = $_itemColumn<String>('batch_id');
    if ($_column == null) return null;
    final manager = $$BatchesTableTableTableManager($_db, $_db.batchesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_batchIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ExpensesTableTableFilterComposer
    extends Composer<_$AppDatabase, $ExpensesTableTable> {
  $$ExpensesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get receiptUrl => $composableBuilder(
      column: $table.receiptUrl, builder: (column) => ColumnFilters(column));

  $$ExpenseCategoriesTableTableFilterComposer get categoryId {
    final $$ExpenseCategoriesTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $db.expenseCategoriesTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ExpenseCategoriesTableTableFilterComposer(
                  $db: $db,
                  $table: $db.expenseCategoriesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$BatchesTableTableFilterComposer get batchId {
    final $$BatchesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableFilterComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpensesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpensesTableTable> {
  $$ExpensesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get receiptUrl => $composableBuilder(
      column: $table.receiptUrl, builder: (column) => ColumnOrderings(column));

  $$ExpenseCategoriesTableTableOrderingComposer get categoryId {
    final $$ExpenseCategoriesTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $db.expenseCategoriesTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ExpenseCategoriesTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.expenseCategoriesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$BatchesTableTableOrderingComposer get batchId {
    final $$BatchesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableOrderingComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpensesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpensesTableTable> {
  $$ExpensesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get receiptUrl => $composableBuilder(
      column: $table.receiptUrl, builder: (column) => column);

  $$ExpenseCategoriesTableTableAnnotationComposer get categoryId {
    final $$ExpenseCategoriesTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $db.expenseCategoriesTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ExpenseCategoriesTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.expenseCategoriesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$BatchesTableTableAnnotationComposer get batchId {
    final $$BatchesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpensesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExpensesTableTable,
    ExpenseDbModel,
    $$ExpensesTableTableFilterComposer,
    $$ExpensesTableTableOrderingComposer,
    $$ExpensesTableTableAnnotationComposer,
    $$ExpensesTableTableCreateCompanionBuilder,
    $$ExpensesTableTableUpdateCompanionBuilder,
    (ExpenseDbModel, $$ExpensesTableTableReferences),
    ExpenseDbModel,
    PrefetchHooks Function({bool categoryId, bool batchId})> {
  $$ExpensesTableTableTableManager(_$AppDatabase db, $ExpensesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpensesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpensesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpensesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<double?> quantity = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> categoryId = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String?> batchId = const Value.absent(),
            Value<String?> receiptUrl = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExpensesTableCompanion(
            id: id,
            amount: amount,
            quantity: quantity,
            date: date,
            categoryId: categoryId,
            paymentMethod: paymentMethod,
            description: description,
            batchId: batchId,
            receiptUrl: receiptUrl,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required double amount,
            Value<double?> quantity = const Value.absent(),
            required DateTime date,
            required String categoryId,
            required String paymentMethod,
            required String description,
            Value<String?> batchId = const Value.absent(),
            Value<String?> receiptUrl = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExpensesTableCompanion.insert(
            id: id,
            amount: amount,
            quantity: quantity,
            date: date,
            categoryId: categoryId,
            paymentMethod: paymentMethod,
            description: description,
            batchId: batchId,
            receiptUrl: receiptUrl,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ExpensesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({categoryId = false, batchId = false}) {
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
                      dynamic>>(state) {
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$ExpensesTableTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$ExpensesTableTableReferences._categoryIdTable(db).id,
                  ) as T;
                }
                if (batchId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.batchId,
                    referencedTable:
                        $$ExpensesTableTableReferences._batchIdTable(db),
                    referencedColumn:
                        $$ExpensesTableTableReferences._batchIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ExpensesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExpensesTableTable,
    ExpenseDbModel,
    $$ExpensesTableTableFilterComposer,
    $$ExpensesTableTableOrderingComposer,
    $$ExpensesTableTableAnnotationComposer,
    $$ExpensesTableTableCreateCompanionBuilder,
    $$ExpensesTableTableUpdateCompanionBuilder,
    (ExpenseDbModel, $$ExpensesTableTableReferences),
    ExpenseDbModel,
    PrefetchHooks Function({bool categoryId, bool batchId})>;
typedef $$BuyersTableTableCreateCompanionBuilder = BuyersTableCompanion
    Function({
  required String id,
  required String name,
  required String contact,
  Value<int> rowid,
});
typedef $$BuyersTableTableUpdateCompanionBuilder = BuyersTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> contact,
  Value<int> rowid,
});

final class $$BuyersTableTableReferences
    extends BaseReferences<_$AppDatabase, $BuyersTableTable, BuyerDbModel> {
  $$BuyersTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$IncomesTableTable, List<IncomeDbModel>>
      _incomesTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.incomesTable,
              aliasName: 'buyers_table__id__incomes_table__buyer_id');

  $$IncomesTableTableProcessedTableManager get incomesTableRefs {
    final manager = $$IncomesTableTableTableManager($_db, $_db.incomesTable)
        .filter((f) => f.buyerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_incomesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$BuyersTableTableFilterComposer
    extends Composer<_$AppDatabase, $BuyersTableTable> {
  $$BuyersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contact => $composableBuilder(
      column: $table.contact, builder: (column) => ColumnFilters(column));

  Expression<bool> incomesTableRefs(
      Expression<bool> Function($$IncomesTableTableFilterComposer f) f) {
    final $$IncomesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.incomesTable,
        getReferencedColumn: (t) => t.buyerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IncomesTableTableFilterComposer(
              $db: $db,
              $table: $db.incomesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$BuyersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BuyersTableTable> {
  $$BuyersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contact => $composableBuilder(
      column: $table.contact, builder: (column) => ColumnOrderings(column));
}

class $$BuyersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BuyersTableTable> {
  $$BuyersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get contact =>
      $composableBuilder(column: $table.contact, builder: (column) => column);

  Expression<T> incomesTableRefs<T extends Object>(
      Expression<T> Function($$IncomesTableTableAnnotationComposer a) f) {
    final $$IncomesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.incomesTable,
        getReferencedColumn: (t) => t.buyerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IncomesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.incomesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$BuyersTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BuyersTableTable,
    BuyerDbModel,
    $$BuyersTableTableFilterComposer,
    $$BuyersTableTableOrderingComposer,
    $$BuyersTableTableAnnotationComposer,
    $$BuyersTableTableCreateCompanionBuilder,
    $$BuyersTableTableUpdateCompanionBuilder,
    (BuyerDbModel, $$BuyersTableTableReferences),
    BuyerDbModel,
    PrefetchHooks Function({bool incomesTableRefs})> {
  $$BuyersTableTableTableManager(_$AppDatabase db, $BuyersTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BuyersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BuyersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BuyersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> contact = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BuyersTableCompanion(
            id: id,
            name: name,
            contact: contact,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String contact,
            Value<int> rowid = const Value.absent(),
          }) =>
              BuyersTableCompanion.insert(
            id: id,
            name: name,
            contact: contact,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BuyersTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({incomesTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (incomesTableRefs) db.incomesTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (incomesTableRefs)
                    await $_getPrefetchedData<BuyerDbModel, $BuyersTableTable,
                            IncomeDbModel>(
                        currentTable: table,
                        referencedTable: $$BuyersTableTableReferences
                            ._incomesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BuyersTableTableReferences(db, table, p0)
                                .incomesTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.buyerId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$BuyersTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BuyersTableTable,
    BuyerDbModel,
    $$BuyersTableTableFilterComposer,
    $$BuyersTableTableOrderingComposer,
    $$BuyersTableTableAnnotationComposer,
    $$BuyersTableTableCreateCompanionBuilder,
    $$BuyersTableTableUpdateCompanionBuilder,
    (BuyerDbModel, $$BuyersTableTableReferences),
    BuyerDbModel,
    PrefetchHooks Function({bool incomesTableRefs})>;
typedef $$IncomeCategoriesTableTableCreateCompanionBuilder
    = IncomeCategoriesTableCompanion Function({
  required String id,
  required String name,
  required String colorCode,
  required String iconName,
  Value<int> rowid,
});
typedef $$IncomeCategoriesTableTableUpdateCompanionBuilder
    = IncomeCategoriesTableCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> colorCode,
  Value<String> iconName,
  Value<int> rowid,
});

final class $$IncomeCategoriesTableTableReferences extends BaseReferences<
    _$AppDatabase, $IncomeCategoriesTableTable, IncomeCategoryDbModel> {
  $$IncomeCategoriesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$IncomesTableTable, List<IncomeDbModel>>
      _incomesTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.incomesTable,
          aliasName: 'income_categories_table__id__incomes_table__category_id');

  $$IncomesTableTableProcessedTableManager get incomesTableRefs {
    final manager = $$IncomesTableTableTableManager($_db, $_db.incomesTable)
        .filter((f) => f.categoryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_incomesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$IncomeCategoriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $IncomeCategoriesTableTable> {
  $$IncomeCategoriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get colorCode => $composableBuilder(
      column: $table.colorCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnFilters(column));

  Expression<bool> incomesTableRefs(
      Expression<bool> Function($$IncomesTableTableFilterComposer f) f) {
    final $$IncomesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.incomesTable,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IncomesTableTableFilterComposer(
              $db: $db,
              $table: $db.incomesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$IncomeCategoriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $IncomeCategoriesTableTable> {
  $$IncomeCategoriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get colorCode => $composableBuilder(
      column: $table.colorCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnOrderings(column));
}

class $$IncomeCategoriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $IncomeCategoriesTableTable> {
  $$IncomeCategoriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get colorCode =>
      $composableBuilder(column: $table.colorCode, builder: (column) => column);

  GeneratedColumn<String> get iconName =>
      $composableBuilder(column: $table.iconName, builder: (column) => column);

  Expression<T> incomesTableRefs<T extends Object>(
      Expression<T> Function($$IncomesTableTableAnnotationComposer a) f) {
    final $$IncomesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.incomesTable,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IncomesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.incomesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$IncomeCategoriesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $IncomeCategoriesTableTable,
    IncomeCategoryDbModel,
    $$IncomeCategoriesTableTableFilterComposer,
    $$IncomeCategoriesTableTableOrderingComposer,
    $$IncomeCategoriesTableTableAnnotationComposer,
    $$IncomeCategoriesTableTableCreateCompanionBuilder,
    $$IncomeCategoriesTableTableUpdateCompanionBuilder,
    (IncomeCategoryDbModel, $$IncomeCategoriesTableTableReferences),
    IncomeCategoryDbModel,
    PrefetchHooks Function({bool incomesTableRefs})> {
  $$IncomeCategoriesTableTableTableManager(
      _$AppDatabase db, $IncomeCategoriesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IncomeCategoriesTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$IncomeCategoriesTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IncomeCategoriesTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> colorCode = const Value.absent(),
            Value<String> iconName = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              IncomeCategoriesTableCompanion(
            id: id,
            name: name,
            colorCode: colorCode,
            iconName: iconName,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String colorCode,
            required String iconName,
            Value<int> rowid = const Value.absent(),
          }) =>
              IncomeCategoriesTableCompanion.insert(
            id: id,
            name: name,
            colorCode: colorCode,
            iconName: iconName,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$IncomeCategoriesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({incomesTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (incomesTableRefs) db.incomesTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (incomesTableRefs)
                    await $_getPrefetchedData<IncomeCategoryDbModel,
                            $IncomeCategoriesTableTable, IncomeDbModel>(
                        currentTable: table,
                        referencedTable: $$IncomeCategoriesTableTableReferences
                            ._incomesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$IncomeCategoriesTableTableReferences(
                                    db, table, p0)
                                .incomesTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$IncomeCategoriesTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $IncomeCategoriesTableTable,
        IncomeCategoryDbModel,
        $$IncomeCategoriesTableTableFilterComposer,
        $$IncomeCategoriesTableTableOrderingComposer,
        $$IncomeCategoriesTableTableAnnotationComposer,
        $$IncomeCategoriesTableTableCreateCompanionBuilder,
        $$IncomeCategoriesTableTableUpdateCompanionBuilder,
        (IncomeCategoryDbModel, $$IncomeCategoriesTableTableReferences),
        IncomeCategoryDbModel,
        PrefetchHooks Function({bool incomesTableRefs})>;
typedef $$IncomesTableTableCreateCompanionBuilder = IncomesTableCompanion
    Function({
  required String id,
  required DateTime saleDate,
  Value<String?> batchId,
  required String buyerId,
  required String categoryId,
  required String cocoonGrade,
  required double quantity,
  required double rate,
  required double grossAmount,
  required double transportCharges,
  required double commission,
  required double netAmount,
  required String paymentMethod,
  required String paymentStatus,
  Value<String?> invoiceNumber,
  Value<String?> remarks,
  Value<int> rowid,
});
typedef $$IncomesTableTableUpdateCompanionBuilder = IncomesTableCompanion
    Function({
  Value<String> id,
  Value<DateTime> saleDate,
  Value<String?> batchId,
  Value<String> buyerId,
  Value<String> categoryId,
  Value<String> cocoonGrade,
  Value<double> quantity,
  Value<double> rate,
  Value<double> grossAmount,
  Value<double> transportCharges,
  Value<double> commission,
  Value<double> netAmount,
  Value<String> paymentMethod,
  Value<String> paymentStatus,
  Value<String?> invoiceNumber,
  Value<String?> remarks,
  Value<int> rowid,
});

final class $$IncomesTableTableReferences
    extends BaseReferences<_$AppDatabase, $IncomesTableTable, IncomeDbModel> {
  $$IncomesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BatchesTableTable _batchIdTable(_$AppDatabase db) =>
      db.batchesTable.createAlias('incomes_table__batch_id__batches_table__id');

  $$BatchesTableTableProcessedTableManager? get batchId {
    final $_column = $_itemColumn<String>('batch_id');
    if ($_column == null) return null;
    final manager = $$BatchesTableTableTableManager($_db, $_db.batchesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_batchIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $BuyersTableTable _buyerIdTable(_$AppDatabase db) =>
      db.buyersTable.createAlias('incomes_table__buyer_id__buyers_table__id');

  $$BuyersTableTableProcessedTableManager get buyerId {
    final $_column = $_itemColumn<String>('buyer_id')!;

    final manager = $$BuyersTableTableTableManager($_db, $_db.buyersTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_buyerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $IncomeCategoriesTableTable _categoryIdTable(_$AppDatabase db) => db
      .incomeCategoriesTable
      .createAlias('incomes_table__category_id__income_categories_table__id');

  $$IncomeCategoriesTableTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<String>('category_id')!;

    final manager = $$IncomeCategoriesTableTableTableManager(
            $_db, $_db.incomeCategoriesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$IncomesTableTableFilterComposer
    extends Composer<_$AppDatabase, $IncomesTableTable> {
  $$IncomesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get saleDate => $composableBuilder(
      column: $table.saleDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cocoonGrade => $composableBuilder(
      column: $table.cocoonGrade, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rate => $composableBuilder(
      column: $table.rate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get grossAmount => $composableBuilder(
      column: $table.grossAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get transportCharges => $composableBuilder(
      column: $table.transportCharges,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get commission => $composableBuilder(
      column: $table.commission, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get netAmount => $composableBuilder(
      column: $table.netAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get invoiceNumber => $composableBuilder(
      column: $table.invoiceNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remarks => $composableBuilder(
      column: $table.remarks, builder: (column) => ColumnFilters(column));

  $$BatchesTableTableFilterComposer get batchId {
    final $$BatchesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableFilterComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$BuyersTableTableFilterComposer get buyerId {
    final $$BuyersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.buyerId,
        referencedTable: $db.buyersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BuyersTableTableFilterComposer(
              $db: $db,
              $table: $db.buyersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$IncomeCategoriesTableTableFilterComposer get categoryId {
    final $$IncomeCategoriesTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $db.incomeCategoriesTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$IncomeCategoriesTableTableFilterComposer(
                  $db: $db,
                  $table: $db.incomeCategoriesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$IncomesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $IncomesTableTable> {
  $$IncomesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get saleDate => $composableBuilder(
      column: $table.saleDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cocoonGrade => $composableBuilder(
      column: $table.cocoonGrade, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rate => $composableBuilder(
      column: $table.rate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get grossAmount => $composableBuilder(
      column: $table.grossAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get transportCharges => $composableBuilder(
      column: $table.transportCharges,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get commission => $composableBuilder(
      column: $table.commission, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get netAmount => $composableBuilder(
      column: $table.netAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get invoiceNumber => $composableBuilder(
      column: $table.invoiceNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remarks => $composableBuilder(
      column: $table.remarks, builder: (column) => ColumnOrderings(column));

  $$BatchesTableTableOrderingComposer get batchId {
    final $$BatchesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableOrderingComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$BuyersTableTableOrderingComposer get buyerId {
    final $$BuyersTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.buyerId,
        referencedTable: $db.buyersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BuyersTableTableOrderingComposer(
              $db: $db,
              $table: $db.buyersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$IncomeCategoriesTableTableOrderingComposer get categoryId {
    final $$IncomeCategoriesTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $db.incomeCategoriesTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$IncomeCategoriesTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.incomeCategoriesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$IncomesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $IncomesTableTable> {
  $$IncomesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get saleDate =>
      $composableBuilder(column: $table.saleDate, builder: (column) => column);

  GeneratedColumn<String> get cocoonGrade => $composableBuilder(
      column: $table.cocoonGrade, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get rate =>
      $composableBuilder(column: $table.rate, builder: (column) => column);

  GeneratedColumn<double> get grossAmount => $composableBuilder(
      column: $table.grossAmount, builder: (column) => column);

  GeneratedColumn<double> get transportCharges => $composableBuilder(
      column: $table.transportCharges, builder: (column) => column);

  GeneratedColumn<double> get commission => $composableBuilder(
      column: $table.commission, builder: (column) => column);

  GeneratedColumn<double> get netAmount =>
      $composableBuilder(column: $table.netAmount, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus, builder: (column) => column);

  GeneratedColumn<String> get invoiceNumber => $composableBuilder(
      column: $table.invoiceNumber, builder: (column) => column);

  GeneratedColumn<String> get remarks =>
      $composableBuilder(column: $table.remarks, builder: (column) => column);

  $$BatchesTableTableAnnotationComposer get batchId {
    final $$BatchesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$BuyersTableTableAnnotationComposer get buyerId {
    final $$BuyersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.buyerId,
        referencedTable: $db.buyersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BuyersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.buyersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$IncomeCategoriesTableTableAnnotationComposer get categoryId {
    final $$IncomeCategoriesTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $db.incomeCategoriesTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$IncomeCategoriesTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.incomeCategoriesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$IncomesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $IncomesTableTable,
    IncomeDbModel,
    $$IncomesTableTableFilterComposer,
    $$IncomesTableTableOrderingComposer,
    $$IncomesTableTableAnnotationComposer,
    $$IncomesTableTableCreateCompanionBuilder,
    $$IncomesTableTableUpdateCompanionBuilder,
    (IncomeDbModel, $$IncomesTableTableReferences),
    IncomeDbModel,
    PrefetchHooks Function({bool batchId, bool buyerId, bool categoryId})> {
  $$IncomesTableTableTableManager(_$AppDatabase db, $IncomesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IncomesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IncomesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IncomesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> saleDate = const Value.absent(),
            Value<String?> batchId = const Value.absent(),
            Value<String> buyerId = const Value.absent(),
            Value<String> categoryId = const Value.absent(),
            Value<String> cocoonGrade = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<double> rate = const Value.absent(),
            Value<double> grossAmount = const Value.absent(),
            Value<double> transportCharges = const Value.absent(),
            Value<double> commission = const Value.absent(),
            Value<double> netAmount = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
            Value<String> paymentStatus = const Value.absent(),
            Value<String?> invoiceNumber = const Value.absent(),
            Value<String?> remarks = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              IncomesTableCompanion(
            id: id,
            saleDate: saleDate,
            batchId: batchId,
            buyerId: buyerId,
            categoryId: categoryId,
            cocoonGrade: cocoonGrade,
            quantity: quantity,
            rate: rate,
            grossAmount: grossAmount,
            transportCharges: transportCharges,
            commission: commission,
            netAmount: netAmount,
            paymentMethod: paymentMethod,
            paymentStatus: paymentStatus,
            invoiceNumber: invoiceNumber,
            remarks: remarks,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime saleDate,
            Value<String?> batchId = const Value.absent(),
            required String buyerId,
            required String categoryId,
            required String cocoonGrade,
            required double quantity,
            required double rate,
            required double grossAmount,
            required double transportCharges,
            required double commission,
            required double netAmount,
            required String paymentMethod,
            required String paymentStatus,
            Value<String?> invoiceNumber = const Value.absent(),
            Value<String?> remarks = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              IncomesTableCompanion.insert(
            id: id,
            saleDate: saleDate,
            batchId: batchId,
            buyerId: buyerId,
            categoryId: categoryId,
            cocoonGrade: cocoonGrade,
            quantity: quantity,
            rate: rate,
            grossAmount: grossAmount,
            transportCharges: transportCharges,
            commission: commission,
            netAmount: netAmount,
            paymentMethod: paymentMethod,
            paymentStatus: paymentStatus,
            invoiceNumber: invoiceNumber,
            remarks: remarks,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$IncomesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {batchId = false, buyerId = false, categoryId = false}) {
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
                      dynamic>>(state) {
                if (batchId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.batchId,
                    referencedTable:
                        $$IncomesTableTableReferences._batchIdTable(db),
                    referencedColumn:
                        $$IncomesTableTableReferences._batchIdTable(db).id,
                  ) as T;
                }
                if (buyerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.buyerId,
                    referencedTable:
                        $$IncomesTableTableReferences._buyerIdTable(db),
                    referencedColumn:
                        $$IncomesTableTableReferences._buyerIdTable(db).id,
                  ) as T;
                }
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$IncomesTableTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$IncomesTableTableReferences._categoryIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$IncomesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $IncomesTableTable,
    IncomeDbModel,
    $$IncomesTableTableFilterComposer,
    $$IncomesTableTableOrderingComposer,
    $$IncomesTableTableAnnotationComposer,
    $$IncomesTableTableCreateCompanionBuilder,
    $$IncomesTableTableUpdateCompanionBuilder,
    (IncomeDbModel, $$IncomesTableTableReferences),
    IncomeDbModel,
    PrefetchHooks Function({bool batchId, bool buyerId, bool categoryId})>;
typedef $$BatchTimelinesTableTableCreateCompanionBuilder
    = BatchTimelinesTableCompanion Function({
  required String id,
  required String batchId,
  required DateTime timestamp,
  required String eventType,
  required String description,
  Value<int> rowid,
});
typedef $$BatchTimelinesTableTableUpdateCompanionBuilder
    = BatchTimelinesTableCompanion Function({
  Value<String> id,
  Value<String> batchId,
  Value<DateTime> timestamp,
  Value<String> eventType,
  Value<String> description,
  Value<int> rowid,
});

final class $$BatchTimelinesTableTableReferences extends BaseReferences<
    _$AppDatabase, $BatchTimelinesTableTable, BatchTimelineDbModel> {
  $$BatchTimelinesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BatchesTableTable _batchIdTable(_$AppDatabase db) => db.batchesTable
      .createAlias('batch_timelines_table__batch_id__batches_table__id');

  $$BatchesTableTableProcessedTableManager get batchId {
    final $_column = $_itemColumn<String>('batch_id')!;

    final manager = $$BatchesTableTableTableManager($_db, $_db.batchesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_batchIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$BatchTimelinesTableTableFilterComposer
    extends Composer<_$AppDatabase, $BatchTimelinesTableTable> {
  $$BatchTimelinesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get eventType => $composableBuilder(
      column: $table.eventType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  $$BatchesTableTableFilterComposer get batchId {
    final $$BatchesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableFilterComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BatchTimelinesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BatchTimelinesTableTable> {
  $$BatchTimelinesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get eventType => $composableBuilder(
      column: $table.eventType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  $$BatchesTableTableOrderingComposer get batchId {
    final $$BatchesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableOrderingComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BatchTimelinesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BatchTimelinesTableTable> {
  $$BatchTimelinesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get eventType =>
      $composableBuilder(column: $table.eventType, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  $$BatchesTableTableAnnotationComposer get batchId {
    final $$BatchesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BatchTimelinesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BatchTimelinesTableTable,
    BatchTimelineDbModel,
    $$BatchTimelinesTableTableFilterComposer,
    $$BatchTimelinesTableTableOrderingComposer,
    $$BatchTimelinesTableTableAnnotationComposer,
    $$BatchTimelinesTableTableCreateCompanionBuilder,
    $$BatchTimelinesTableTableUpdateCompanionBuilder,
    (BatchTimelineDbModel, $$BatchTimelinesTableTableReferences),
    BatchTimelineDbModel,
    PrefetchHooks Function({bool batchId})> {
  $$BatchTimelinesTableTableTableManager(
      _$AppDatabase db, $BatchTimelinesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BatchTimelinesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BatchTimelinesTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BatchTimelinesTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> batchId = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<String> eventType = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BatchTimelinesTableCompanion(
            id: id,
            batchId: batchId,
            timestamp: timestamp,
            eventType: eventType,
            description: description,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String batchId,
            required DateTime timestamp,
            required String eventType,
            required String description,
            Value<int> rowid = const Value.absent(),
          }) =>
              BatchTimelinesTableCompanion.insert(
            id: id,
            batchId: batchId,
            timestamp: timestamp,
            eventType: eventType,
            description: description,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BatchTimelinesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({batchId = false}) {
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
                      dynamic>>(state) {
                if (batchId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.batchId,
                    referencedTable:
                        $$BatchTimelinesTableTableReferences._batchIdTable(db),
                    referencedColumn: $$BatchTimelinesTableTableReferences
                        ._batchIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$BatchTimelinesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BatchTimelinesTableTable,
    BatchTimelineDbModel,
    $$BatchTimelinesTableTableFilterComposer,
    $$BatchTimelinesTableTableOrderingComposer,
    $$BatchTimelinesTableTableAnnotationComposer,
    $$BatchTimelinesTableTableCreateCompanionBuilder,
    $$BatchTimelinesTableTableUpdateCompanionBuilder,
    (BatchTimelineDbModel, $$BatchTimelinesTableTableReferences),
    BatchTimelineDbModel,
    PrefetchHooks Function({bool batchId})>;
typedef $$InventoryCategoriesTableTableCreateCompanionBuilder
    = InventoryCategoriesTableCompanion Function({
  required String id,
  required String name,
  required String colorCode,
  required String iconName,
  Value<int> rowid,
});
typedef $$InventoryCategoriesTableTableUpdateCompanionBuilder
    = InventoryCategoriesTableCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> colorCode,
  Value<String> iconName,
  Value<int> rowid,
});

final class $$InventoryCategoriesTableTableReferences extends BaseReferences<
    _$AppDatabase, $InventoryCategoriesTableTable, InventoryCategoryDbModel> {
  $$InventoryCategoriesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$InventoryItemsTableTable,
      List<InventoryItemDbModel>> _inventoryItemsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.inventoryItemsTable,
          aliasName:
              'inventory_categories_table__id__inventory_items_table__category_id');

  $$InventoryItemsTableTableProcessedTableManager get inventoryItemsTableRefs {
    final manager = $$InventoryItemsTableTableTableManager(
            $_db, $_db.inventoryItemsTable)
        .filter((f) => f.categoryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_inventoryItemsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$InventoryCategoriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $InventoryCategoriesTableTable> {
  $$InventoryCategoriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get colorCode => $composableBuilder(
      column: $table.colorCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnFilters(column));

  Expression<bool> inventoryItemsTableRefs(
      Expression<bool> Function($$InventoryItemsTableTableFilterComposer f) f) {
    final $$InventoryItemsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.inventoryItemsTable,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$InventoryItemsTableTableFilterComposer(
              $db: $db,
              $table: $db.inventoryItemsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$InventoryCategoriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $InventoryCategoriesTableTable> {
  $$InventoryCategoriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get colorCode => $composableBuilder(
      column: $table.colorCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnOrderings(column));
}

class $$InventoryCategoriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $InventoryCategoriesTableTable> {
  $$InventoryCategoriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get colorCode =>
      $composableBuilder(column: $table.colorCode, builder: (column) => column);

  GeneratedColumn<String> get iconName =>
      $composableBuilder(column: $table.iconName, builder: (column) => column);

  Expression<T> inventoryItemsTableRefs<T extends Object>(
      Expression<T> Function($$InventoryItemsTableTableAnnotationComposer a)
          f) {
    final $$InventoryItemsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.inventoryItemsTable,
            getReferencedColumn: (t) => t.categoryId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$InventoryItemsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.inventoryItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$InventoryCategoriesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $InventoryCategoriesTableTable,
    InventoryCategoryDbModel,
    $$InventoryCategoriesTableTableFilterComposer,
    $$InventoryCategoriesTableTableOrderingComposer,
    $$InventoryCategoriesTableTableAnnotationComposer,
    $$InventoryCategoriesTableTableCreateCompanionBuilder,
    $$InventoryCategoriesTableTableUpdateCompanionBuilder,
    (InventoryCategoryDbModel, $$InventoryCategoriesTableTableReferences),
    InventoryCategoryDbModel,
    PrefetchHooks Function({bool inventoryItemsTableRefs})> {
  $$InventoryCategoriesTableTableTableManager(
      _$AppDatabase db, $InventoryCategoriesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventoryCategoriesTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$InventoryCategoriesTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InventoryCategoriesTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> colorCode = const Value.absent(),
            Value<String> iconName = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InventoryCategoriesTableCompanion(
            id: id,
            name: name,
            colorCode: colorCode,
            iconName: iconName,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String colorCode,
            required String iconName,
            Value<int> rowid = const Value.absent(),
          }) =>
              InventoryCategoriesTableCompanion.insert(
            id: id,
            name: name,
            colorCode: colorCode,
            iconName: iconName,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$InventoryCategoriesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({inventoryItemsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (inventoryItemsTableRefs) db.inventoryItemsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (inventoryItemsTableRefs)
                    await $_getPrefetchedData<
                            InventoryCategoryDbModel,
                            $InventoryCategoriesTableTable,
                            InventoryItemDbModel>(
                        currentTable: table,
                        referencedTable:
                            $$InventoryCategoriesTableTableReferences
                                ._inventoryItemsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$InventoryCategoriesTableTableReferences(
                                    db, table, p0)
                                .inventoryItemsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$InventoryCategoriesTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $InventoryCategoriesTableTable,
        InventoryCategoryDbModel,
        $$InventoryCategoriesTableTableFilterComposer,
        $$InventoryCategoriesTableTableOrderingComposer,
        $$InventoryCategoriesTableTableAnnotationComposer,
        $$InventoryCategoriesTableTableCreateCompanionBuilder,
        $$InventoryCategoriesTableTableUpdateCompanionBuilder,
        (InventoryCategoryDbModel, $$InventoryCategoriesTableTableReferences),
        InventoryCategoryDbModel,
        PrefetchHooks Function({bool inventoryItemsTableRefs})>;
typedef $$InventoryItemsTableTableCreateCompanionBuilder
    = InventoryItemsTableCompanion Function({
  required String id,
  required String name,
  required String categoryId,
  required String unit,
  required double currentQuantity,
  required double minimumQuantity,
  Value<double?> maximumQuantity,
  required double purchasePrice,
  Value<String?> supplier,
  required DateTime purchaseDate,
  Value<DateTime?> expiryDate,
  Value<String?> storageLocation,
  required String status,
  Value<String?> notes,
  Value<int> rowid,
});
typedef $$InventoryItemsTableTableUpdateCompanionBuilder
    = InventoryItemsTableCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> categoryId,
  Value<String> unit,
  Value<double> currentQuantity,
  Value<double> minimumQuantity,
  Value<double?> maximumQuantity,
  Value<double> purchasePrice,
  Value<String?> supplier,
  Value<DateTime> purchaseDate,
  Value<DateTime?> expiryDate,
  Value<String?> storageLocation,
  Value<String> status,
  Value<String?> notes,
  Value<int> rowid,
});

final class $$InventoryItemsTableTableReferences extends BaseReferences<
    _$AppDatabase, $InventoryItemsTableTable, InventoryItemDbModel> {
  $$InventoryItemsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $InventoryCategoriesTableTable _categoryIdTable(_$AppDatabase db) =>
      db.inventoryCategoriesTable.createAlias(
          'inventory_items_table__category_id__inventory_categories_table__id');

  $$InventoryCategoriesTableTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<String>('category_id')!;

    final manager = $$InventoryCategoriesTableTableTableManager(
            $_db, $_db.inventoryCategoriesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$InventoryTransactionsTableTable,
      List<InventoryTransactionDbModel>> _inventoryTransactionsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.inventoryTransactionsTable,
          aliasName:
              'inventory_items_table__id__inventory_transactions_table__item_id');

  $$InventoryTransactionsTableTableProcessedTableManager
      get inventoryTransactionsTableRefs {
    final manager = $$InventoryTransactionsTableTableTableManager(
            $_db, $_db.inventoryTransactionsTable)
        .filter((f) => f.itemId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult
        .readTableOrNull(_inventoryTransactionsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$InventoryItemsTableTableFilterComposer
    extends Composer<_$AppDatabase, $InventoryItemsTableTable> {
  $$InventoryItemsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get currentQuantity => $composableBuilder(
      column: $table.currentQuantity,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get minimumQuantity => $composableBuilder(
      column: $table.minimumQuantity,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get maximumQuantity => $composableBuilder(
      column: $table.maximumQuantity,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get purchasePrice => $composableBuilder(
      column: $table.purchasePrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get supplier => $composableBuilder(
      column: $table.supplier, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get expiryDate => $composableBuilder(
      column: $table.expiryDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get storageLocation => $composableBuilder(
      column: $table.storageLocation,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  $$InventoryCategoriesTableTableFilterComposer get categoryId {
    final $$InventoryCategoriesTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $db.inventoryCategoriesTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$InventoryCategoriesTableTableFilterComposer(
                  $db: $db,
                  $table: $db.inventoryCategoriesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  Expression<bool> inventoryTransactionsTableRefs(
      Expression<bool> Function(
              $$InventoryTransactionsTableTableFilterComposer f)
          f) {
    final $$InventoryTransactionsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.inventoryTransactionsTable,
            getReferencedColumn: (t) => t.itemId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$InventoryTransactionsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.inventoryTransactionsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$InventoryItemsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $InventoryItemsTableTable> {
  $$InventoryItemsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get currentQuantity => $composableBuilder(
      column: $table.currentQuantity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get minimumQuantity => $composableBuilder(
      column: $table.minimumQuantity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get maximumQuantity => $composableBuilder(
      column: $table.maximumQuantity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get purchasePrice => $composableBuilder(
      column: $table.purchasePrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get supplier => $composableBuilder(
      column: $table.supplier, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get expiryDate => $composableBuilder(
      column: $table.expiryDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get storageLocation => $composableBuilder(
      column: $table.storageLocation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  $$InventoryCategoriesTableTableOrderingComposer get categoryId {
    final $$InventoryCategoriesTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $db.inventoryCategoriesTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$InventoryCategoriesTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.inventoryCategoriesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$InventoryItemsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $InventoryItemsTableTable> {
  $$InventoryItemsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<double> get currentQuantity => $composableBuilder(
      column: $table.currentQuantity, builder: (column) => column);

  GeneratedColumn<double> get minimumQuantity => $composableBuilder(
      column: $table.minimumQuantity, builder: (column) => column);

  GeneratedColumn<double> get maximumQuantity => $composableBuilder(
      column: $table.maximumQuantity, builder: (column) => column);

  GeneratedColumn<double> get purchasePrice => $composableBuilder(
      column: $table.purchasePrice, builder: (column) => column);

  GeneratedColumn<String> get supplier =>
      $composableBuilder(column: $table.supplier, builder: (column) => column);

  GeneratedColumn<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate, builder: (column) => column);

  GeneratedColumn<DateTime> get expiryDate => $composableBuilder(
      column: $table.expiryDate, builder: (column) => column);

  GeneratedColumn<String> get storageLocation => $composableBuilder(
      column: $table.storageLocation, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$InventoryCategoriesTableTableAnnotationComposer get categoryId {
    final $$InventoryCategoriesTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $db.inventoryCategoriesTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$InventoryCategoriesTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.inventoryCategoriesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  Expression<T> inventoryTransactionsTableRefs<T extends Object>(
      Expression<T> Function(
              $$InventoryTransactionsTableTableAnnotationComposer a)
          f) {
    final $$InventoryTransactionsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.inventoryTransactionsTable,
            getReferencedColumn: (t) => t.itemId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$InventoryTransactionsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.inventoryTransactionsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$InventoryItemsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $InventoryItemsTableTable,
    InventoryItemDbModel,
    $$InventoryItemsTableTableFilterComposer,
    $$InventoryItemsTableTableOrderingComposer,
    $$InventoryItemsTableTableAnnotationComposer,
    $$InventoryItemsTableTableCreateCompanionBuilder,
    $$InventoryItemsTableTableUpdateCompanionBuilder,
    (InventoryItemDbModel, $$InventoryItemsTableTableReferences),
    InventoryItemDbModel,
    PrefetchHooks Function(
        {bool categoryId, bool inventoryTransactionsTableRefs})> {
  $$InventoryItemsTableTableTableManager(
      _$AppDatabase db, $InventoryItemsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventoryItemsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InventoryItemsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InventoryItemsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> categoryId = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<double> currentQuantity = const Value.absent(),
            Value<double> minimumQuantity = const Value.absent(),
            Value<double?> maximumQuantity = const Value.absent(),
            Value<double> purchasePrice = const Value.absent(),
            Value<String?> supplier = const Value.absent(),
            Value<DateTime> purchaseDate = const Value.absent(),
            Value<DateTime?> expiryDate = const Value.absent(),
            Value<String?> storageLocation = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InventoryItemsTableCompanion(
            id: id,
            name: name,
            categoryId: categoryId,
            unit: unit,
            currentQuantity: currentQuantity,
            minimumQuantity: minimumQuantity,
            maximumQuantity: maximumQuantity,
            purchasePrice: purchasePrice,
            supplier: supplier,
            purchaseDate: purchaseDate,
            expiryDate: expiryDate,
            storageLocation: storageLocation,
            status: status,
            notes: notes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String categoryId,
            required String unit,
            required double currentQuantity,
            required double minimumQuantity,
            Value<double?> maximumQuantity = const Value.absent(),
            required double purchasePrice,
            Value<String?> supplier = const Value.absent(),
            required DateTime purchaseDate,
            Value<DateTime?> expiryDate = const Value.absent(),
            Value<String?> storageLocation = const Value.absent(),
            required String status,
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InventoryItemsTableCompanion.insert(
            id: id,
            name: name,
            categoryId: categoryId,
            unit: unit,
            currentQuantity: currentQuantity,
            minimumQuantity: minimumQuantity,
            maximumQuantity: maximumQuantity,
            purchasePrice: purchasePrice,
            supplier: supplier,
            purchaseDate: purchaseDate,
            expiryDate: expiryDate,
            storageLocation: storageLocation,
            status: status,
            notes: notes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$InventoryItemsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {categoryId = false, inventoryTransactionsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (inventoryTransactionsTableRefs)
                  db.inventoryTransactionsTable
              ],
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
                      dynamic>>(state) {
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable: $$InventoryItemsTableTableReferences
                        ._categoryIdTable(db),
                    referencedColumn: $$InventoryItemsTableTableReferences
                        ._categoryIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (inventoryTransactionsTableRefs)
                    await $_getPrefetchedData<
                            InventoryItemDbModel,
                            $InventoryItemsTableTable,
                            InventoryTransactionDbModel>(
                        currentTable: table,
                        referencedTable: $$InventoryItemsTableTableReferences
                            ._inventoryTransactionsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$InventoryItemsTableTableReferences(db, table, p0)
                                .inventoryTransactionsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.itemId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$InventoryItemsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $InventoryItemsTableTable,
    InventoryItemDbModel,
    $$InventoryItemsTableTableFilterComposer,
    $$InventoryItemsTableTableOrderingComposer,
    $$InventoryItemsTableTableAnnotationComposer,
    $$InventoryItemsTableTableCreateCompanionBuilder,
    $$InventoryItemsTableTableUpdateCompanionBuilder,
    (InventoryItemDbModel, $$InventoryItemsTableTableReferences),
    InventoryItemDbModel,
    PrefetchHooks Function(
        {bool categoryId, bool inventoryTransactionsTableRefs})>;
typedef $$InventoryTransactionsTableTableCreateCompanionBuilder
    = InventoryTransactionsTableCompanion Function({
  required String id,
  required String itemId,
  required double quantity,
  required String type,
  Value<String?> batchId,
  required DateTime date,
  Value<String?> reason,
  Value<int> rowid,
});
typedef $$InventoryTransactionsTableTableUpdateCompanionBuilder
    = InventoryTransactionsTableCompanion Function({
  Value<String> id,
  Value<String> itemId,
  Value<double> quantity,
  Value<String> type,
  Value<String?> batchId,
  Value<DateTime> date,
  Value<String?> reason,
  Value<int> rowid,
});

final class $$InventoryTransactionsTableTableReferences extends BaseReferences<
    _$AppDatabase,
    $InventoryTransactionsTableTable,
    InventoryTransactionDbModel> {
  $$InventoryTransactionsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $InventoryItemsTableTable _itemIdTable(_$AppDatabase db) =>
      db.inventoryItemsTable.createAlias(
          'inventory_transactions_table__item_id__inventory_items_table__id');

  $$InventoryItemsTableTableProcessedTableManager get itemId {
    final $_column = $_itemColumn<String>('item_id')!;

    final manager =
        $$InventoryItemsTableTableTableManager($_db, $_db.inventoryItemsTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_itemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $BatchesTableTable _batchIdTable(_$AppDatabase db) => db.batchesTable
      .createAlias('inventory_transactions_table__batch_id__batches_table__id');

  $$BatchesTableTableProcessedTableManager? get batchId {
    final $_column = $_itemColumn<String>('batch_id');
    if ($_column == null) return null;
    final manager = $$BatchesTableTableTableManager($_db, $_db.batchesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_batchIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$InventoryTransactionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $InventoryTransactionsTableTable> {
  $$InventoryTransactionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnFilters(column));

  $$InventoryItemsTableTableFilterComposer get itemId {
    final $$InventoryItemsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.itemId,
        referencedTable: $db.inventoryItemsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$InventoryItemsTableTableFilterComposer(
              $db: $db,
              $table: $db.inventoryItemsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$BatchesTableTableFilterComposer get batchId {
    final $$BatchesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableFilterComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$InventoryTransactionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $InventoryTransactionsTableTable> {
  $$InventoryTransactionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnOrderings(column));

  $$InventoryItemsTableTableOrderingComposer get itemId {
    final $$InventoryItemsTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.itemId,
            referencedTable: $db.inventoryItemsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$InventoryItemsTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.inventoryItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$BatchesTableTableOrderingComposer get batchId {
    final $$BatchesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableOrderingComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$InventoryTransactionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $InventoryTransactionsTableTable> {
  $$InventoryTransactionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  $$InventoryItemsTableTableAnnotationComposer get itemId {
    final $$InventoryItemsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.itemId,
            referencedTable: $db.inventoryItemsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$InventoryItemsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.inventoryItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$BatchesTableTableAnnotationComposer get batchId {
    final $$BatchesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$InventoryTransactionsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $InventoryTransactionsTableTable,
    InventoryTransactionDbModel,
    $$InventoryTransactionsTableTableFilterComposer,
    $$InventoryTransactionsTableTableOrderingComposer,
    $$InventoryTransactionsTableTableAnnotationComposer,
    $$InventoryTransactionsTableTableCreateCompanionBuilder,
    $$InventoryTransactionsTableTableUpdateCompanionBuilder,
    (InventoryTransactionDbModel, $$InventoryTransactionsTableTableReferences),
    InventoryTransactionDbModel,
    PrefetchHooks Function({bool itemId, bool batchId})> {
  $$InventoryTransactionsTableTableTableManager(
      _$AppDatabase db, $InventoryTransactionsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventoryTransactionsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$InventoryTransactionsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InventoryTransactionsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> itemId = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String?> batchId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String?> reason = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InventoryTransactionsTableCompanion(
            id: id,
            itemId: itemId,
            quantity: quantity,
            type: type,
            batchId: batchId,
            date: date,
            reason: reason,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String itemId,
            required double quantity,
            required String type,
            Value<String?> batchId = const Value.absent(),
            required DateTime date,
            Value<String?> reason = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InventoryTransactionsTableCompanion.insert(
            id: id,
            itemId: itemId,
            quantity: quantity,
            type: type,
            batchId: batchId,
            date: date,
            reason: reason,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$InventoryTransactionsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({itemId = false, batchId = false}) {
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
                      dynamic>>(state) {
                if (itemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.itemId,
                    referencedTable: $$InventoryTransactionsTableTableReferences
                        ._itemIdTable(db),
                    referencedColumn:
                        $$InventoryTransactionsTableTableReferences
                            ._itemIdTable(db)
                            .id,
                  ) as T;
                }
                if (batchId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.batchId,
                    referencedTable: $$InventoryTransactionsTableTableReferences
                        ._batchIdTable(db),
                    referencedColumn:
                        $$InventoryTransactionsTableTableReferences
                            ._batchIdTable(db)
                            .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$InventoryTransactionsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $InventoryTransactionsTableTable,
        InventoryTransactionDbModel,
        $$InventoryTransactionsTableTableFilterComposer,
        $$InventoryTransactionsTableTableOrderingComposer,
        $$InventoryTransactionsTableTableAnnotationComposer,
        $$InventoryTransactionsTableTableCreateCompanionBuilder,
        $$InventoryTransactionsTableTableUpdateCompanionBuilder,
        (
          InventoryTransactionDbModel,
          $$InventoryTransactionsTableTableReferences
        ),
        InventoryTransactionDbModel,
        PrefetchHooks Function({bool itemId, bool batchId})>;
typedef $$WorkersTableTableCreateCompanionBuilder = WorkersTableCompanion
    Function({
  required String id,
  required String fullName,
  required String phoneNumber,
  Value<String?> address,
  required String role,
  required double dailyWage,
  required DateTime joiningDate,
  required String status,
  Value<String?> emergencyContact,
  Value<String?> notes,
  Value<int> rowid,
});
typedef $$WorkersTableTableUpdateCompanionBuilder = WorkersTableCompanion
    Function({
  Value<String> id,
  Value<String> fullName,
  Value<String> phoneNumber,
  Value<String?> address,
  Value<String> role,
  Value<double> dailyWage,
  Value<DateTime> joiningDate,
  Value<String> status,
  Value<String?> emergencyContact,
  Value<String?> notes,
  Value<int> rowid,
});

final class $$WorkersTableTableReferences
    extends BaseReferences<_$AppDatabase, $WorkersTableTable, WorkerDbModel> {
  $$WorkersTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AttendanceTableTable, List<AttendanceDbModel>>
      _attendanceTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.attendanceTable,
              aliasName: 'workers_table__id__attendance_table__worker_id');

  $$AttendanceTableTableProcessedTableManager get attendanceTableRefs {
    final manager = $$AttendanceTableTableTableManager(
            $_db, $_db.attendanceTable)
        .filter((f) => f.workerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_attendanceTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$AssignmentsTableTable, List<AssignmentDbModel>>
      _assignmentsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.assignmentsTable,
              aliasName: 'workers_table__id__assignments_table__worker_id');

  $$AssignmentsTableTableProcessedTableManager get assignmentsTableRefs {
    final manager = $$AssignmentsTableTableTableManager(
            $_db, $_db.assignmentsTable)
        .filter((f) => f.workerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_assignmentsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$WagesTableTable, List<WageDbModel>>
      _wagesTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.wagesTable,
              aliasName: 'workers_table__id__wages_table__worker_id');

  $$WagesTableTableProcessedTableManager get wagesTableRefs {
    final manager = $$WagesTableTableTableManager($_db, $_db.wagesTable)
        .filter((f) => f.workerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_wagesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$WorkersTableTableFilterComposer
    extends Composer<_$AppDatabase, $WorkersTableTable> {
  $$WorkersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get dailyWage => $composableBuilder(
      column: $table.dailyWage, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get joiningDate => $composableBuilder(
      column: $table.joiningDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get emergencyContact => $composableBuilder(
      column: $table.emergencyContact,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  Expression<bool> attendanceTableRefs(
      Expression<bool> Function($$AttendanceTableTableFilterComposer f) f) {
    final $$AttendanceTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.attendanceTable,
        getReferencedColumn: (t) => t.workerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AttendanceTableTableFilterComposer(
              $db: $db,
              $table: $db.attendanceTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> assignmentsTableRefs(
      Expression<bool> Function($$AssignmentsTableTableFilterComposer f) f) {
    final $$AssignmentsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.assignmentsTable,
        getReferencedColumn: (t) => t.workerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AssignmentsTableTableFilterComposer(
              $db: $db,
              $table: $db.assignmentsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> wagesTableRefs(
      Expression<bool> Function($$WagesTableTableFilterComposer f) f) {
    final $$WagesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.wagesTable,
        getReferencedColumn: (t) => t.workerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WagesTableTableFilterComposer(
              $db: $db,
              $table: $db.wagesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$WorkersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkersTableTable> {
  $$WorkersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get dailyWage => $composableBuilder(
      column: $table.dailyWage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get joiningDate => $composableBuilder(
      column: $table.joiningDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get emergencyContact => $composableBuilder(
      column: $table.emergencyContact,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));
}

class $$WorkersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkersTableTable> {
  $$WorkersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<double> get dailyWage =>
      $composableBuilder(column: $table.dailyWage, builder: (column) => column);

  GeneratedColumn<DateTime> get joiningDate => $composableBuilder(
      column: $table.joiningDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get emergencyContact => $composableBuilder(
      column: $table.emergencyContact, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  Expression<T> attendanceTableRefs<T extends Object>(
      Expression<T> Function($$AttendanceTableTableAnnotationComposer a) f) {
    final $$AttendanceTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.attendanceTable,
        getReferencedColumn: (t) => t.workerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AttendanceTableTableAnnotationComposer(
              $db: $db,
              $table: $db.attendanceTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> assignmentsTableRefs<T extends Object>(
      Expression<T> Function($$AssignmentsTableTableAnnotationComposer a) f) {
    final $$AssignmentsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.assignmentsTable,
        getReferencedColumn: (t) => t.workerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AssignmentsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.assignmentsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> wagesTableRefs<T extends Object>(
      Expression<T> Function($$WagesTableTableAnnotationComposer a) f) {
    final $$WagesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.wagesTable,
        getReferencedColumn: (t) => t.workerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WagesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.wagesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$WorkersTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkersTableTable,
    WorkerDbModel,
    $$WorkersTableTableFilterComposer,
    $$WorkersTableTableOrderingComposer,
    $$WorkersTableTableAnnotationComposer,
    $$WorkersTableTableCreateCompanionBuilder,
    $$WorkersTableTableUpdateCompanionBuilder,
    (WorkerDbModel, $$WorkersTableTableReferences),
    WorkerDbModel,
    PrefetchHooks Function(
        {bool attendanceTableRefs,
        bool assignmentsTableRefs,
        bool wagesTableRefs})> {
  $$WorkersTableTableTableManager(_$AppDatabase db, $WorkersTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> fullName = const Value.absent(),
            Value<String> phoneNumber = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String> role = const Value.absent(),
            Value<double> dailyWage = const Value.absent(),
            Value<DateTime> joiningDate = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> emergencyContact = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkersTableCompanion(
            id: id,
            fullName: fullName,
            phoneNumber: phoneNumber,
            address: address,
            role: role,
            dailyWage: dailyWage,
            joiningDate: joiningDate,
            status: status,
            emergencyContact: emergencyContact,
            notes: notes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String fullName,
            required String phoneNumber,
            Value<String?> address = const Value.absent(),
            required String role,
            required double dailyWage,
            required DateTime joiningDate,
            required String status,
            Value<String?> emergencyContact = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkersTableCompanion.insert(
            id: id,
            fullName: fullName,
            phoneNumber: phoneNumber,
            address: address,
            role: role,
            dailyWage: dailyWage,
            joiningDate: joiningDate,
            status: status,
            emergencyContact: emergencyContact,
            notes: notes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WorkersTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {attendanceTableRefs = false,
              assignmentsTableRefs = false,
              wagesTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (attendanceTableRefs) db.attendanceTable,
                if (assignmentsTableRefs) db.assignmentsTable,
                if (wagesTableRefs) db.wagesTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (attendanceTableRefs)
                    await $_getPrefetchedData<WorkerDbModel, $WorkersTableTable,
                            AttendanceDbModel>(
                        currentTable: table,
                        referencedTable: $$WorkersTableTableReferences
                            ._attendanceTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorkersTableTableReferences(db, table, p0)
                                .attendanceTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.workerId == item.id),
                        typedResults: items),
                  if (assignmentsTableRefs)
                    await $_getPrefetchedData<WorkerDbModel, $WorkersTableTable,
                            AssignmentDbModel>(
                        currentTable: table,
                        referencedTable: $$WorkersTableTableReferences
                            ._assignmentsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorkersTableTableReferences(db, table, p0)
                                .assignmentsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.workerId == item.id),
                        typedResults: items),
                  if (wagesTableRefs)
                    await $_getPrefetchedData<WorkerDbModel, $WorkersTableTable,
                            WageDbModel>(
                        currentTable: table,
                        referencedTable: $$WorkersTableTableReferences
                            ._wagesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorkersTableTableReferences(db, table, p0)
                                .wagesTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.workerId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$WorkersTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorkersTableTable,
    WorkerDbModel,
    $$WorkersTableTableFilterComposer,
    $$WorkersTableTableOrderingComposer,
    $$WorkersTableTableAnnotationComposer,
    $$WorkersTableTableCreateCompanionBuilder,
    $$WorkersTableTableUpdateCompanionBuilder,
    (WorkerDbModel, $$WorkersTableTableReferences),
    WorkerDbModel,
    PrefetchHooks Function(
        {bool attendanceTableRefs,
        bool assignmentsTableRefs,
        bool wagesTableRefs})>;
typedef $$AttendanceTableTableCreateCompanionBuilder = AttendanceTableCompanion
    Function({
  required String id,
  required String workerId,
  required DateTime date,
  Value<DateTime?> checkIn,
  Value<DateTime?> checkOut,
  Value<double> hoursWorked,
  Value<double> overtimeHours,
  required String leaveStatus,
  Value<String?> remarks,
  Value<int> rowid,
});
typedef $$AttendanceTableTableUpdateCompanionBuilder = AttendanceTableCompanion
    Function({
  Value<String> id,
  Value<String> workerId,
  Value<DateTime> date,
  Value<DateTime?> checkIn,
  Value<DateTime?> checkOut,
  Value<double> hoursWorked,
  Value<double> overtimeHours,
  Value<String> leaveStatus,
  Value<String?> remarks,
  Value<int> rowid,
});

final class $$AttendanceTableTableReferences extends BaseReferences<
    _$AppDatabase, $AttendanceTableTable, AttendanceDbModel> {
  $$AttendanceTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $WorkersTableTable _workerIdTable(_$AppDatabase db) => db.workersTable
      .createAlias('attendance_table__worker_id__workers_table__id');

  $$WorkersTableTableProcessedTableManager get workerId {
    final $_column = $_itemColumn<String>('worker_id')!;

    final manager = $$WorkersTableTableTableManager($_db, $_db.workersTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
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
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get checkIn => $composableBuilder(
      column: $table.checkIn, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get checkOut => $composableBuilder(
      column: $table.checkOut, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get hoursWorked => $composableBuilder(
      column: $table.hoursWorked, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get overtimeHours => $composableBuilder(
      column: $table.overtimeHours, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get leaveStatus => $composableBuilder(
      column: $table.leaveStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remarks => $composableBuilder(
      column: $table.remarks, builder: (column) => ColumnFilters(column));

  $$WorkersTableTableFilterComposer get workerId {
    final $$WorkersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workerId,
        referencedTable: $db.workersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkersTableTableFilterComposer(
              $db: $db,
              $table: $db.workersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
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
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get checkIn => $composableBuilder(
      column: $table.checkIn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get checkOut => $composableBuilder(
      column: $table.checkOut, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get hoursWorked => $composableBuilder(
      column: $table.hoursWorked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get overtimeHours => $composableBuilder(
      column: $table.overtimeHours,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get leaveStatus => $composableBuilder(
      column: $table.leaveStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remarks => $composableBuilder(
      column: $table.remarks, builder: (column) => ColumnOrderings(column));

  $$WorkersTableTableOrderingComposer get workerId {
    final $$WorkersTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workerId,
        referencedTable: $db.workersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkersTableTableOrderingComposer(
              $db: $db,
              $table: $db.workersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
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
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get checkIn =>
      $composableBuilder(column: $table.checkIn, builder: (column) => column);

  GeneratedColumn<DateTime> get checkOut =>
      $composableBuilder(column: $table.checkOut, builder: (column) => column);

  GeneratedColumn<double> get hoursWorked => $composableBuilder(
      column: $table.hoursWorked, builder: (column) => column);

  GeneratedColumn<double> get overtimeHours => $composableBuilder(
      column: $table.overtimeHours, builder: (column) => column);

  GeneratedColumn<String> get leaveStatus => $composableBuilder(
      column: $table.leaveStatus, builder: (column) => column);

  GeneratedColumn<String> get remarks =>
      $composableBuilder(column: $table.remarks, builder: (column) => column);

  $$WorkersTableTableAnnotationComposer get workerId {
    final $$WorkersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workerId,
        referencedTable: $db.workersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.workersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AttendanceTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AttendanceTableTable,
    AttendanceDbModel,
    $$AttendanceTableTableFilterComposer,
    $$AttendanceTableTableOrderingComposer,
    $$AttendanceTableTableAnnotationComposer,
    $$AttendanceTableTableCreateCompanionBuilder,
    $$AttendanceTableTableUpdateCompanionBuilder,
    (AttendanceDbModel, $$AttendanceTableTableReferences),
    AttendanceDbModel,
    PrefetchHooks Function({bool workerId})> {
  $$AttendanceTableTableTableManager(
      _$AppDatabase db, $AttendanceTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttendanceTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttendanceTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttendanceTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> workerId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime?> checkIn = const Value.absent(),
            Value<DateTime?> checkOut = const Value.absent(),
            Value<double> hoursWorked = const Value.absent(),
            Value<double> overtimeHours = const Value.absent(),
            Value<String> leaveStatus = const Value.absent(),
            Value<String?> remarks = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AttendanceTableCompanion(
            id: id,
            workerId: workerId,
            date: date,
            checkIn: checkIn,
            checkOut: checkOut,
            hoursWorked: hoursWorked,
            overtimeHours: overtimeHours,
            leaveStatus: leaveStatus,
            remarks: remarks,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String workerId,
            required DateTime date,
            Value<DateTime?> checkIn = const Value.absent(),
            Value<DateTime?> checkOut = const Value.absent(),
            Value<double> hoursWorked = const Value.absent(),
            Value<double> overtimeHours = const Value.absent(),
            required String leaveStatus,
            Value<String?> remarks = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AttendanceTableCompanion.insert(
            id: id,
            workerId: workerId,
            date: date,
            checkIn: checkIn,
            checkOut: checkOut,
            hoursWorked: hoursWorked,
            overtimeHours: overtimeHours,
            leaveStatus: leaveStatus,
            remarks: remarks,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AttendanceTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({workerId = false}) {
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
                      dynamic>>(state) {
                if (workerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workerId,
                    referencedTable:
                        $$AttendanceTableTableReferences._workerIdTable(db),
                    referencedColumn:
                        $$AttendanceTableTableReferences._workerIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$AttendanceTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AttendanceTableTable,
    AttendanceDbModel,
    $$AttendanceTableTableFilterComposer,
    $$AttendanceTableTableOrderingComposer,
    $$AttendanceTableTableAnnotationComposer,
    $$AttendanceTableTableCreateCompanionBuilder,
    $$AttendanceTableTableUpdateCompanionBuilder,
    (AttendanceDbModel, $$AttendanceTableTableReferences),
    AttendanceDbModel,
    PrefetchHooks Function({bool workerId})>;
typedef $$AssignmentsTableTableCreateCompanionBuilder
    = AssignmentsTableCompanion Function({
  required String id,
  required String workerId,
  Value<String?> batchId,
  required String task,
  required DateTime startTime,
  Value<DateTime?> endTime,
  Value<double?> durationHours,
  required String status,
  Value<int> rowid,
});
typedef $$AssignmentsTableTableUpdateCompanionBuilder
    = AssignmentsTableCompanion Function({
  Value<String> id,
  Value<String> workerId,
  Value<String?> batchId,
  Value<String> task,
  Value<DateTime> startTime,
  Value<DateTime?> endTime,
  Value<double?> durationHours,
  Value<String> status,
  Value<int> rowid,
});

final class $$AssignmentsTableTableReferences extends BaseReferences<
    _$AppDatabase, $AssignmentsTableTable, AssignmentDbModel> {
  $$AssignmentsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $WorkersTableTable _workerIdTable(_$AppDatabase db) => db.workersTable
      .createAlias('assignments_table__worker_id__workers_table__id');

  $$WorkersTableTableProcessedTableManager get workerId {
    final $_column = $_itemColumn<String>('worker_id')!;

    final manager = $$WorkersTableTableTableManager($_db, $_db.workersTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$AssignmentsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AssignmentsTableTable> {
  $$AssignmentsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get batchId => $composableBuilder(
      column: $table.batchId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get task => $composableBuilder(
      column: $table.task, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get durationHours => $composableBuilder(
      column: $table.durationHours, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  $$WorkersTableTableFilterComposer get workerId {
    final $$WorkersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workerId,
        referencedTable: $db.workersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkersTableTableFilterComposer(
              $db: $db,
              $table: $db.workersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AssignmentsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AssignmentsTableTable> {
  $$AssignmentsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get batchId => $composableBuilder(
      column: $table.batchId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get task => $composableBuilder(
      column: $table.task, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get durationHours => $composableBuilder(
      column: $table.durationHours,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  $$WorkersTableTableOrderingComposer get workerId {
    final $$WorkersTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workerId,
        referencedTable: $db.workersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkersTableTableOrderingComposer(
              $db: $db,
              $table: $db.workersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AssignmentsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssignmentsTableTable> {
  $$AssignmentsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get batchId =>
      $composableBuilder(column: $table.batchId, builder: (column) => column);

  GeneratedColumn<String> get task =>
      $composableBuilder(column: $table.task, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<double> get durationHours => $composableBuilder(
      column: $table.durationHours, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$WorkersTableTableAnnotationComposer get workerId {
    final $$WorkersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workerId,
        referencedTable: $db.workersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.workersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AssignmentsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AssignmentsTableTable,
    AssignmentDbModel,
    $$AssignmentsTableTableFilterComposer,
    $$AssignmentsTableTableOrderingComposer,
    $$AssignmentsTableTableAnnotationComposer,
    $$AssignmentsTableTableCreateCompanionBuilder,
    $$AssignmentsTableTableUpdateCompanionBuilder,
    (AssignmentDbModel, $$AssignmentsTableTableReferences),
    AssignmentDbModel,
    PrefetchHooks Function({bool workerId})> {
  $$AssignmentsTableTableTableManager(
      _$AppDatabase db, $AssignmentsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssignmentsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssignmentsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssignmentsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> workerId = const Value.absent(),
            Value<String?> batchId = const Value.absent(),
            Value<String> task = const Value.absent(),
            Value<DateTime> startTime = const Value.absent(),
            Value<DateTime?> endTime = const Value.absent(),
            Value<double?> durationHours = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AssignmentsTableCompanion(
            id: id,
            workerId: workerId,
            batchId: batchId,
            task: task,
            startTime: startTime,
            endTime: endTime,
            durationHours: durationHours,
            status: status,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String workerId,
            Value<String?> batchId = const Value.absent(),
            required String task,
            required DateTime startTime,
            Value<DateTime?> endTime = const Value.absent(),
            Value<double?> durationHours = const Value.absent(),
            required String status,
            Value<int> rowid = const Value.absent(),
          }) =>
              AssignmentsTableCompanion.insert(
            id: id,
            workerId: workerId,
            batchId: batchId,
            task: task,
            startTime: startTime,
            endTime: endTime,
            durationHours: durationHours,
            status: status,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AssignmentsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({workerId = false}) {
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
                      dynamic>>(state) {
                if (workerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workerId,
                    referencedTable:
                        $$AssignmentsTableTableReferences._workerIdTable(db),
                    referencedColumn:
                        $$AssignmentsTableTableReferences._workerIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$AssignmentsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AssignmentsTableTable,
    AssignmentDbModel,
    $$AssignmentsTableTableFilterComposer,
    $$AssignmentsTableTableOrderingComposer,
    $$AssignmentsTableTableAnnotationComposer,
    $$AssignmentsTableTableCreateCompanionBuilder,
    $$AssignmentsTableTableUpdateCompanionBuilder,
    (AssignmentDbModel, $$AssignmentsTableTableReferences),
    AssignmentDbModel,
    PrefetchHooks Function({bool workerId})>;
typedef $$WagesTableTableCreateCompanionBuilder = WagesTableCompanion Function({
  required String id,
  required String workerId,
  required double baseWage,
  required double overtimePay,
  required double bonuses,
  required double deductions,
  required double netPay,
  required DateTime paymentDate,
  required String paymentMethod,
  Value<String?> referenceNotes,
  Value<int> rowid,
});
typedef $$WagesTableTableUpdateCompanionBuilder = WagesTableCompanion Function({
  Value<String> id,
  Value<String> workerId,
  Value<double> baseWage,
  Value<double> overtimePay,
  Value<double> bonuses,
  Value<double> deductions,
  Value<double> netPay,
  Value<DateTime> paymentDate,
  Value<String> paymentMethod,
  Value<String?> referenceNotes,
  Value<int> rowid,
});

final class $$WagesTableTableReferences
    extends BaseReferences<_$AppDatabase, $WagesTableTable, WageDbModel> {
  $$WagesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $WorkersTableTable _workerIdTable(_$AppDatabase db) =>
      db.workersTable.createAlias('wages_table__worker_id__workers_table__id');

  $$WorkersTableTableProcessedTableManager get workerId {
    final $_column = $_itemColumn<String>('worker_id')!;

    final manager = $$WorkersTableTableTableManager($_db, $_db.workersTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$WagesTableTableFilterComposer
    extends Composer<_$AppDatabase, $WagesTableTable> {
  $$WagesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get baseWage => $composableBuilder(
      column: $table.baseWage, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get overtimePay => $composableBuilder(
      column: $table.overtimePay, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get bonuses => $composableBuilder(
      column: $table.bonuses, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get deductions => $composableBuilder(
      column: $table.deductions, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get netPay => $composableBuilder(
      column: $table.netPay, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get referenceNotes => $composableBuilder(
      column: $table.referenceNotes,
      builder: (column) => ColumnFilters(column));

  $$WorkersTableTableFilterComposer get workerId {
    final $$WorkersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workerId,
        referencedTable: $db.workersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkersTableTableFilterComposer(
              $db: $db,
              $table: $db.workersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WagesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $WagesTableTable> {
  $$WagesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get baseWage => $composableBuilder(
      column: $table.baseWage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get overtimePay => $composableBuilder(
      column: $table.overtimePay, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get bonuses => $composableBuilder(
      column: $table.bonuses, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get deductions => $composableBuilder(
      column: $table.deductions, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get netPay => $composableBuilder(
      column: $table.netPay, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get referenceNotes => $composableBuilder(
      column: $table.referenceNotes,
      builder: (column) => ColumnOrderings(column));

  $$WorkersTableTableOrderingComposer get workerId {
    final $$WorkersTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workerId,
        referencedTable: $db.workersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkersTableTableOrderingComposer(
              $db: $db,
              $table: $db.workersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WagesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $WagesTableTable> {
  $$WagesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get baseWage =>
      $composableBuilder(column: $table.baseWage, builder: (column) => column);

  GeneratedColumn<double> get overtimePay => $composableBuilder(
      column: $table.overtimePay, builder: (column) => column);

  GeneratedColumn<double> get bonuses =>
      $composableBuilder(column: $table.bonuses, builder: (column) => column);

  GeneratedColumn<double> get deductions => $composableBuilder(
      column: $table.deductions, builder: (column) => column);

  GeneratedColumn<double> get netPay =>
      $composableBuilder(column: $table.netPay, builder: (column) => column);

  GeneratedColumn<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<String> get referenceNotes => $composableBuilder(
      column: $table.referenceNotes, builder: (column) => column);

  $$WorkersTableTableAnnotationComposer get workerId {
    final $$WorkersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workerId,
        referencedTable: $db.workersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.workersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WagesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WagesTableTable,
    WageDbModel,
    $$WagesTableTableFilterComposer,
    $$WagesTableTableOrderingComposer,
    $$WagesTableTableAnnotationComposer,
    $$WagesTableTableCreateCompanionBuilder,
    $$WagesTableTableUpdateCompanionBuilder,
    (WageDbModel, $$WagesTableTableReferences),
    WageDbModel,
    PrefetchHooks Function({bool workerId})> {
  $$WagesTableTableTableManager(_$AppDatabase db, $WagesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WagesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WagesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WagesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> workerId = const Value.absent(),
            Value<double> baseWage = const Value.absent(),
            Value<double> overtimePay = const Value.absent(),
            Value<double> bonuses = const Value.absent(),
            Value<double> deductions = const Value.absent(),
            Value<double> netPay = const Value.absent(),
            Value<DateTime> paymentDate = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
            Value<String?> referenceNotes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WagesTableCompanion(
            id: id,
            workerId: workerId,
            baseWage: baseWage,
            overtimePay: overtimePay,
            bonuses: bonuses,
            deductions: deductions,
            netPay: netPay,
            paymentDate: paymentDate,
            paymentMethod: paymentMethod,
            referenceNotes: referenceNotes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String workerId,
            required double baseWage,
            required double overtimePay,
            required double bonuses,
            required double deductions,
            required double netPay,
            required DateTime paymentDate,
            required String paymentMethod,
            Value<String?> referenceNotes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WagesTableCompanion.insert(
            id: id,
            workerId: workerId,
            baseWage: baseWage,
            overtimePay: overtimePay,
            bonuses: bonuses,
            deductions: deductions,
            netPay: netPay,
            paymentDate: paymentDate,
            paymentMethod: paymentMethod,
            referenceNotes: referenceNotes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WagesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({workerId = false}) {
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
                      dynamic>>(state) {
                if (workerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workerId,
                    referencedTable:
                        $$WagesTableTableReferences._workerIdTable(db),
                    referencedColumn:
                        $$WagesTableTableReferences._workerIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$WagesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WagesTableTable,
    WageDbModel,
    $$WagesTableTableFilterComposer,
    $$WagesTableTableOrderingComposer,
    $$WagesTableTableAnnotationComposer,
    $$WagesTableTableCreateCompanionBuilder,
    $$WagesTableTableUpdateCompanionBuilder,
    (WageDbModel, $$WagesTableTableReferences),
    WageDbModel,
    PrefetchHooks Function({bool workerId})>;
typedef $$FeedingLogsTableTableCreateCompanionBuilder
    = FeedingLogsTableCompanion Function({
  required String id,
  required String batchId,
  required DateTime date,
  required String time,
  required String leafType,
  required String leafAge,
  required double leafQuantity,
  required int feedingRound,
  Value<String?> workerId,
  Value<String?> remarks,
  Value<int> rowid,
});
typedef $$FeedingLogsTableTableUpdateCompanionBuilder
    = FeedingLogsTableCompanion Function({
  Value<String> id,
  Value<String> batchId,
  Value<DateTime> date,
  Value<String> time,
  Value<String> leafType,
  Value<String> leafAge,
  Value<double> leafQuantity,
  Value<int> feedingRound,
  Value<String?> workerId,
  Value<String?> remarks,
  Value<int> rowid,
});

final class $$FeedingLogsTableTableReferences extends BaseReferences<
    _$AppDatabase, $FeedingLogsTableTable, FeedingLogDbModel> {
  $$FeedingLogsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BatchesTableTable _batchIdTable(_$AppDatabase db) => db.batchesTable
      .createAlias('feeding_logs_table__batch_id__batches_table__id');

  $$BatchesTableTableProcessedTableManager get batchId {
    final $_column = $_itemColumn<String>('batch_id')!;

    final manager = $$BatchesTableTableTableManager($_db, $_db.batchesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_batchIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$FeedingLogsTableTableFilterComposer
    extends Composer<_$AppDatabase, $FeedingLogsTableTable> {
  $$FeedingLogsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get time => $composableBuilder(
      column: $table.time, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get leafType => $composableBuilder(
      column: $table.leafType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get leafAge => $composableBuilder(
      column: $table.leafAge, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get leafQuantity => $composableBuilder(
      column: $table.leafQuantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get feedingRound => $composableBuilder(
      column: $table.feedingRound, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get workerId => $composableBuilder(
      column: $table.workerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remarks => $composableBuilder(
      column: $table.remarks, builder: (column) => ColumnFilters(column));

  $$BatchesTableTableFilterComposer get batchId {
    final $$BatchesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableFilterComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FeedingLogsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FeedingLogsTableTable> {
  $$FeedingLogsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get time => $composableBuilder(
      column: $table.time, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get leafType => $composableBuilder(
      column: $table.leafType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get leafAge => $composableBuilder(
      column: $table.leafAge, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get leafQuantity => $composableBuilder(
      column: $table.leafQuantity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get feedingRound => $composableBuilder(
      column: $table.feedingRound,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get workerId => $composableBuilder(
      column: $table.workerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remarks => $composableBuilder(
      column: $table.remarks, builder: (column) => ColumnOrderings(column));

  $$BatchesTableTableOrderingComposer get batchId {
    final $$BatchesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableOrderingComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FeedingLogsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FeedingLogsTableTable> {
  $$FeedingLogsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  GeneratedColumn<String> get leafType =>
      $composableBuilder(column: $table.leafType, builder: (column) => column);

  GeneratedColumn<String> get leafAge =>
      $composableBuilder(column: $table.leafAge, builder: (column) => column);

  GeneratedColumn<double> get leafQuantity => $composableBuilder(
      column: $table.leafQuantity, builder: (column) => column);

  GeneratedColumn<int> get feedingRound => $composableBuilder(
      column: $table.feedingRound, builder: (column) => column);

  GeneratedColumn<String> get workerId =>
      $composableBuilder(column: $table.workerId, builder: (column) => column);

  GeneratedColumn<String> get remarks =>
      $composableBuilder(column: $table.remarks, builder: (column) => column);

  $$BatchesTableTableAnnotationComposer get batchId {
    final $$BatchesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FeedingLogsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FeedingLogsTableTable,
    FeedingLogDbModel,
    $$FeedingLogsTableTableFilterComposer,
    $$FeedingLogsTableTableOrderingComposer,
    $$FeedingLogsTableTableAnnotationComposer,
    $$FeedingLogsTableTableCreateCompanionBuilder,
    $$FeedingLogsTableTableUpdateCompanionBuilder,
    (FeedingLogDbModel, $$FeedingLogsTableTableReferences),
    FeedingLogDbModel,
    PrefetchHooks Function({bool batchId})> {
  $$FeedingLogsTableTableTableManager(
      _$AppDatabase db, $FeedingLogsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FeedingLogsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FeedingLogsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FeedingLogsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> batchId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> time = const Value.absent(),
            Value<String> leafType = const Value.absent(),
            Value<String> leafAge = const Value.absent(),
            Value<double> leafQuantity = const Value.absent(),
            Value<int> feedingRound = const Value.absent(),
            Value<String?> workerId = const Value.absent(),
            Value<String?> remarks = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FeedingLogsTableCompanion(
            id: id,
            batchId: batchId,
            date: date,
            time: time,
            leafType: leafType,
            leafAge: leafAge,
            leafQuantity: leafQuantity,
            feedingRound: feedingRound,
            workerId: workerId,
            remarks: remarks,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String batchId,
            required DateTime date,
            required String time,
            required String leafType,
            required String leafAge,
            required double leafQuantity,
            required int feedingRound,
            Value<String?> workerId = const Value.absent(),
            Value<String?> remarks = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FeedingLogsTableCompanion.insert(
            id: id,
            batchId: batchId,
            date: date,
            time: time,
            leafType: leafType,
            leafAge: leafAge,
            leafQuantity: leafQuantity,
            feedingRound: feedingRound,
            workerId: workerId,
            remarks: remarks,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$FeedingLogsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({batchId = false}) {
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
                      dynamic>>(state) {
                if (batchId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.batchId,
                    referencedTable:
                        $$FeedingLogsTableTableReferences._batchIdTable(db),
                    referencedColumn:
                        $$FeedingLogsTableTableReferences._batchIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$FeedingLogsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FeedingLogsTableTable,
    FeedingLogDbModel,
    $$FeedingLogsTableTableFilterComposer,
    $$FeedingLogsTableTableOrderingComposer,
    $$FeedingLogsTableTableAnnotationComposer,
    $$FeedingLogsTableTableCreateCompanionBuilder,
    $$FeedingLogsTableTableUpdateCompanionBuilder,
    (FeedingLogDbModel, $$FeedingLogsTableTableReferences),
    FeedingLogDbModel,
    PrefetchHooks Function({bool batchId})>;
typedef $$EnvironmentalLogsTableTableCreateCompanionBuilder
    = EnvironmentalLogsTableCompanion Function({
  required String id,
  required String batchId,
  required DateTime timestamp,
  required double temperature,
  required double humidity,
  required bool ventilationStatus,
  Value<String?> weatherNotes,
  Value<int> rowid,
});
typedef $$EnvironmentalLogsTableTableUpdateCompanionBuilder
    = EnvironmentalLogsTableCompanion Function({
  Value<String> id,
  Value<String> batchId,
  Value<DateTime> timestamp,
  Value<double> temperature,
  Value<double> humidity,
  Value<bool> ventilationStatus,
  Value<String?> weatherNotes,
  Value<int> rowid,
});

final class $$EnvironmentalLogsTableTableReferences extends BaseReferences<
    _$AppDatabase, $EnvironmentalLogsTableTable, EnvironmentalReadingDbModel> {
  $$EnvironmentalLogsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BatchesTableTable _batchIdTable(_$AppDatabase db) => db.batchesTable
      .createAlias('environmental_logs_table__batch_id__batches_table__id');

  $$BatchesTableTableProcessedTableManager get batchId {
    final $_column = $_itemColumn<String>('batch_id')!;

    final manager = $$BatchesTableTableTableManager($_db, $_db.batchesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_batchIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$EnvironmentalLogsTableTableFilterComposer
    extends Composer<_$AppDatabase, $EnvironmentalLogsTableTable> {
  $$EnvironmentalLogsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get temperature => $composableBuilder(
      column: $table.temperature, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get humidity => $composableBuilder(
      column: $table.humidity, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get ventilationStatus => $composableBuilder(
      column: $table.ventilationStatus,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get weatherNotes => $composableBuilder(
      column: $table.weatherNotes, builder: (column) => ColumnFilters(column));

  $$BatchesTableTableFilterComposer get batchId {
    final $$BatchesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableFilterComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EnvironmentalLogsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $EnvironmentalLogsTableTable> {
  $$EnvironmentalLogsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get temperature => $composableBuilder(
      column: $table.temperature, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get humidity => $composableBuilder(
      column: $table.humidity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get ventilationStatus => $composableBuilder(
      column: $table.ventilationStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get weatherNotes => $composableBuilder(
      column: $table.weatherNotes,
      builder: (column) => ColumnOrderings(column));

  $$BatchesTableTableOrderingComposer get batchId {
    final $$BatchesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableOrderingComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EnvironmentalLogsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $EnvironmentalLogsTableTable> {
  $$EnvironmentalLogsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<double> get temperature => $composableBuilder(
      column: $table.temperature, builder: (column) => column);

  GeneratedColumn<double> get humidity =>
      $composableBuilder(column: $table.humidity, builder: (column) => column);

  GeneratedColumn<bool> get ventilationStatus => $composableBuilder(
      column: $table.ventilationStatus, builder: (column) => column);

  GeneratedColumn<String> get weatherNotes => $composableBuilder(
      column: $table.weatherNotes, builder: (column) => column);

  $$BatchesTableTableAnnotationComposer get batchId {
    final $$BatchesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EnvironmentalLogsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EnvironmentalLogsTableTable,
    EnvironmentalReadingDbModel,
    $$EnvironmentalLogsTableTableFilterComposer,
    $$EnvironmentalLogsTableTableOrderingComposer,
    $$EnvironmentalLogsTableTableAnnotationComposer,
    $$EnvironmentalLogsTableTableCreateCompanionBuilder,
    $$EnvironmentalLogsTableTableUpdateCompanionBuilder,
    (EnvironmentalReadingDbModel, $$EnvironmentalLogsTableTableReferences),
    EnvironmentalReadingDbModel,
    PrefetchHooks Function({bool batchId})> {
  $$EnvironmentalLogsTableTableTableManager(
      _$AppDatabase db, $EnvironmentalLogsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EnvironmentalLogsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$EnvironmentalLogsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EnvironmentalLogsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> batchId = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<double> temperature = const Value.absent(),
            Value<double> humidity = const Value.absent(),
            Value<bool> ventilationStatus = const Value.absent(),
            Value<String?> weatherNotes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EnvironmentalLogsTableCompanion(
            id: id,
            batchId: batchId,
            timestamp: timestamp,
            temperature: temperature,
            humidity: humidity,
            ventilationStatus: ventilationStatus,
            weatherNotes: weatherNotes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String batchId,
            required DateTime timestamp,
            required double temperature,
            required double humidity,
            required bool ventilationStatus,
            Value<String?> weatherNotes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EnvironmentalLogsTableCompanion.insert(
            id: id,
            batchId: batchId,
            timestamp: timestamp,
            temperature: temperature,
            humidity: humidity,
            ventilationStatus: ventilationStatus,
            weatherNotes: weatherNotes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$EnvironmentalLogsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({batchId = false}) {
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
                      dynamic>>(state) {
                if (batchId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.batchId,
                    referencedTable: $$EnvironmentalLogsTableTableReferences
                        ._batchIdTable(db),
                    referencedColumn: $$EnvironmentalLogsTableTableReferences
                        ._batchIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$EnvironmentalLogsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $EnvironmentalLogsTableTable,
        EnvironmentalReadingDbModel,
        $$EnvironmentalLogsTableTableFilterComposer,
        $$EnvironmentalLogsTableTableOrderingComposer,
        $$EnvironmentalLogsTableTableAnnotationComposer,
        $$EnvironmentalLogsTableTableCreateCompanionBuilder,
        $$EnvironmentalLogsTableTableUpdateCompanionBuilder,
        (EnvironmentalReadingDbModel, $$EnvironmentalLogsTableTableReferences),
        EnvironmentalReadingDbModel,
        PrefetchHooks Function({bool batchId})>;
typedef $$MortalityLogsTableTableCreateCompanionBuilder
    = MortalityLogsTableCompanion Function({
  required String id,
  required String batchId,
  required DateTime date,
  required int deadCount,
  required String reason,
  Value<String?> workerId,
  Value<String?> remarks,
  Value<int> rowid,
});
typedef $$MortalityLogsTableTableUpdateCompanionBuilder
    = MortalityLogsTableCompanion Function({
  Value<String> id,
  Value<String> batchId,
  Value<DateTime> date,
  Value<int> deadCount,
  Value<String> reason,
  Value<String?> workerId,
  Value<String?> remarks,
  Value<int> rowid,
});

final class $$MortalityLogsTableTableReferences extends BaseReferences<
    _$AppDatabase, $MortalityLogsTableTable, MortalityLogDbModel> {
  $$MortalityLogsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BatchesTableTable _batchIdTable(_$AppDatabase db) => db.batchesTable
      .createAlias('mortality_logs_table__batch_id__batches_table__id');

  $$BatchesTableTableProcessedTableManager get batchId {
    final $_column = $_itemColumn<String>('batch_id')!;

    final manager = $$BatchesTableTableTableManager($_db, $_db.batchesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_batchIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MortalityLogsTableTableFilterComposer
    extends Composer<_$AppDatabase, $MortalityLogsTableTable> {
  $$MortalityLogsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get deadCount => $composableBuilder(
      column: $table.deadCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get workerId => $composableBuilder(
      column: $table.workerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remarks => $composableBuilder(
      column: $table.remarks, builder: (column) => ColumnFilters(column));

  $$BatchesTableTableFilterComposer get batchId {
    final $$BatchesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableFilterComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MortalityLogsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MortalityLogsTableTable> {
  $$MortalityLogsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get deadCount => $composableBuilder(
      column: $table.deadCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get workerId => $composableBuilder(
      column: $table.workerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remarks => $composableBuilder(
      column: $table.remarks, builder: (column) => ColumnOrderings(column));

  $$BatchesTableTableOrderingComposer get batchId {
    final $$BatchesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableOrderingComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MortalityLogsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MortalityLogsTableTable> {
  $$MortalityLogsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get deadCount =>
      $composableBuilder(column: $table.deadCount, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<String> get workerId =>
      $composableBuilder(column: $table.workerId, builder: (column) => column);

  GeneratedColumn<String> get remarks =>
      $composableBuilder(column: $table.remarks, builder: (column) => column);

  $$BatchesTableTableAnnotationComposer get batchId {
    final $$BatchesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MortalityLogsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MortalityLogsTableTable,
    MortalityLogDbModel,
    $$MortalityLogsTableTableFilterComposer,
    $$MortalityLogsTableTableOrderingComposer,
    $$MortalityLogsTableTableAnnotationComposer,
    $$MortalityLogsTableTableCreateCompanionBuilder,
    $$MortalityLogsTableTableUpdateCompanionBuilder,
    (MortalityLogDbModel, $$MortalityLogsTableTableReferences),
    MortalityLogDbModel,
    PrefetchHooks Function({bool batchId})> {
  $$MortalityLogsTableTableTableManager(
      _$AppDatabase db, $MortalityLogsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MortalityLogsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MortalityLogsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MortalityLogsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> batchId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> deadCount = const Value.absent(),
            Value<String> reason = const Value.absent(),
            Value<String?> workerId = const Value.absent(),
            Value<String?> remarks = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MortalityLogsTableCompanion(
            id: id,
            batchId: batchId,
            date: date,
            deadCount: deadCount,
            reason: reason,
            workerId: workerId,
            remarks: remarks,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String batchId,
            required DateTime date,
            required int deadCount,
            required String reason,
            Value<String?> workerId = const Value.absent(),
            Value<String?> remarks = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MortalityLogsTableCompanion.insert(
            id: id,
            batchId: batchId,
            date: date,
            deadCount: deadCount,
            reason: reason,
            workerId: workerId,
            remarks: remarks,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MortalityLogsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({batchId = false}) {
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
                      dynamic>>(state) {
                if (batchId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.batchId,
                    referencedTable:
                        $$MortalityLogsTableTableReferences._batchIdTable(db),
                    referencedColumn: $$MortalityLogsTableTableReferences
                        ._batchIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MortalityLogsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MortalityLogsTableTable,
    MortalityLogDbModel,
    $$MortalityLogsTableTableFilterComposer,
    $$MortalityLogsTableTableOrderingComposer,
    $$MortalityLogsTableTableAnnotationComposer,
    $$MortalityLogsTableTableCreateCompanionBuilder,
    $$MortalityLogsTableTableUpdateCompanionBuilder,
    (MortalityLogDbModel, $$MortalityLogsTableTableReferences),
    MortalityLogDbModel,
    PrefetchHooks Function({bool batchId})>;
typedef $$HarvestsTableTableCreateCompanionBuilder = HarvestsTableCompanion
    Function({
  required String id,
  required String batchId,
  required DateTime harvestDate,
  required double actualHarvestDuration,
  required double grossWeight,
  required double netSaleableWeight,
  required double rejectedWeight,
  required double moisturePercentage,
  required double wastePercentage,
  required double averageCocoonSize,
  required double gradeAWeight,
  required double gradeBWeight,
  required double gradeCWeight,
  required double yieldPercentage,
  required double survivalRate,
  required double feedConversionRatio,
  required double mortalityPercentage,
  required double harvestEfficiency,
  Value<String?> harvestedBy,
  Value<String?> remarks,
  Value<int> rowid,
});
typedef $$HarvestsTableTableUpdateCompanionBuilder = HarvestsTableCompanion
    Function({
  Value<String> id,
  Value<String> batchId,
  Value<DateTime> harvestDate,
  Value<double> actualHarvestDuration,
  Value<double> grossWeight,
  Value<double> netSaleableWeight,
  Value<double> rejectedWeight,
  Value<double> moisturePercentage,
  Value<double> wastePercentage,
  Value<double> averageCocoonSize,
  Value<double> gradeAWeight,
  Value<double> gradeBWeight,
  Value<double> gradeCWeight,
  Value<double> yieldPercentage,
  Value<double> survivalRate,
  Value<double> feedConversionRatio,
  Value<double> mortalityPercentage,
  Value<double> harvestEfficiency,
  Value<String?> harvestedBy,
  Value<String?> remarks,
  Value<int> rowid,
});

final class $$HarvestsTableTableReferences extends BaseReferences<_$AppDatabase,
    $HarvestsTableTable, HarvestRecordDbModel> {
  $$HarvestsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BatchesTableTable _batchIdTable(_$AppDatabase db) => db.batchesTable
      .createAlias('harvests_table__batch_id__batches_table__id');

  $$BatchesTableTableProcessedTableManager get batchId {
    final $_column = $_itemColumn<String>('batch_id')!;

    final manager = $$BatchesTableTableTableManager($_db, $_db.batchesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_batchIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$HarvestsTableTableFilterComposer
    extends Composer<_$AppDatabase, $HarvestsTableTable> {
  $$HarvestsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get harvestDate => $composableBuilder(
      column: $table.harvestDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get actualHarvestDuration => $composableBuilder(
      column: $table.actualHarvestDuration,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get grossWeight => $composableBuilder(
      column: $table.grossWeight, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get netSaleableWeight => $composableBuilder(
      column: $table.netSaleableWeight,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rejectedWeight => $composableBuilder(
      column: $table.rejectedWeight,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get moisturePercentage => $composableBuilder(
      column: $table.moisturePercentage,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get wastePercentage => $composableBuilder(
      column: $table.wastePercentage,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get averageCocoonSize => $composableBuilder(
      column: $table.averageCocoonSize,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get gradeAWeight => $composableBuilder(
      column: $table.gradeAWeight, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get gradeBWeight => $composableBuilder(
      column: $table.gradeBWeight, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get gradeCWeight => $composableBuilder(
      column: $table.gradeCWeight, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get yieldPercentage => $composableBuilder(
      column: $table.yieldPercentage,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get survivalRate => $composableBuilder(
      column: $table.survivalRate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get feedConversionRatio => $composableBuilder(
      column: $table.feedConversionRatio,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get mortalityPercentage => $composableBuilder(
      column: $table.mortalityPercentage,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get harvestEfficiency => $composableBuilder(
      column: $table.harvestEfficiency,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get harvestedBy => $composableBuilder(
      column: $table.harvestedBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remarks => $composableBuilder(
      column: $table.remarks, builder: (column) => ColumnFilters(column));

  $$BatchesTableTableFilterComposer get batchId {
    final $$BatchesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableFilterComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HarvestsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $HarvestsTableTable> {
  $$HarvestsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get harvestDate => $composableBuilder(
      column: $table.harvestDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get actualHarvestDuration => $composableBuilder(
      column: $table.actualHarvestDuration,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get grossWeight => $composableBuilder(
      column: $table.grossWeight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get netSaleableWeight => $composableBuilder(
      column: $table.netSaleableWeight,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rejectedWeight => $composableBuilder(
      column: $table.rejectedWeight,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get moisturePercentage => $composableBuilder(
      column: $table.moisturePercentage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get wastePercentage => $composableBuilder(
      column: $table.wastePercentage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get averageCocoonSize => $composableBuilder(
      column: $table.averageCocoonSize,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get gradeAWeight => $composableBuilder(
      column: $table.gradeAWeight,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get gradeBWeight => $composableBuilder(
      column: $table.gradeBWeight,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get gradeCWeight => $composableBuilder(
      column: $table.gradeCWeight,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get yieldPercentage => $composableBuilder(
      column: $table.yieldPercentage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get survivalRate => $composableBuilder(
      column: $table.survivalRate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get feedConversionRatio => $composableBuilder(
      column: $table.feedConversionRatio,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get mortalityPercentage => $composableBuilder(
      column: $table.mortalityPercentage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get harvestEfficiency => $composableBuilder(
      column: $table.harvestEfficiency,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get harvestedBy => $composableBuilder(
      column: $table.harvestedBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remarks => $composableBuilder(
      column: $table.remarks, builder: (column) => ColumnOrderings(column));

  $$BatchesTableTableOrderingComposer get batchId {
    final $$BatchesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableOrderingComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HarvestsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $HarvestsTableTable> {
  $$HarvestsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get harvestDate => $composableBuilder(
      column: $table.harvestDate, builder: (column) => column);

  GeneratedColumn<double> get actualHarvestDuration => $composableBuilder(
      column: $table.actualHarvestDuration, builder: (column) => column);

  GeneratedColumn<double> get grossWeight => $composableBuilder(
      column: $table.grossWeight, builder: (column) => column);

  GeneratedColumn<double> get netSaleableWeight => $composableBuilder(
      column: $table.netSaleableWeight, builder: (column) => column);

  GeneratedColumn<double> get rejectedWeight => $composableBuilder(
      column: $table.rejectedWeight, builder: (column) => column);

  GeneratedColumn<double> get moisturePercentage => $composableBuilder(
      column: $table.moisturePercentage, builder: (column) => column);

  GeneratedColumn<double> get wastePercentage => $composableBuilder(
      column: $table.wastePercentage, builder: (column) => column);

  GeneratedColumn<double> get averageCocoonSize => $composableBuilder(
      column: $table.averageCocoonSize, builder: (column) => column);

  GeneratedColumn<double> get gradeAWeight => $composableBuilder(
      column: $table.gradeAWeight, builder: (column) => column);

  GeneratedColumn<double> get gradeBWeight => $composableBuilder(
      column: $table.gradeBWeight, builder: (column) => column);

  GeneratedColumn<double> get gradeCWeight => $composableBuilder(
      column: $table.gradeCWeight, builder: (column) => column);

  GeneratedColumn<double> get yieldPercentage => $composableBuilder(
      column: $table.yieldPercentage, builder: (column) => column);

  GeneratedColumn<double> get survivalRate => $composableBuilder(
      column: $table.survivalRate, builder: (column) => column);

  GeneratedColumn<double> get feedConversionRatio => $composableBuilder(
      column: $table.feedConversionRatio, builder: (column) => column);

  GeneratedColumn<double> get mortalityPercentage => $composableBuilder(
      column: $table.mortalityPercentage, builder: (column) => column);

  GeneratedColumn<double> get harvestEfficiency => $composableBuilder(
      column: $table.harvestEfficiency, builder: (column) => column);

  GeneratedColumn<String> get harvestedBy => $composableBuilder(
      column: $table.harvestedBy, builder: (column) => column);

  GeneratedColumn<String> get remarks =>
      $composableBuilder(column: $table.remarks, builder: (column) => column);

  $$BatchesTableTableAnnotationComposer get batchId {
    final $$BatchesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.batchId,
        referencedTable: $db.batchesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BatchesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.batchesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HarvestsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HarvestsTableTable,
    HarvestRecordDbModel,
    $$HarvestsTableTableFilterComposer,
    $$HarvestsTableTableOrderingComposer,
    $$HarvestsTableTableAnnotationComposer,
    $$HarvestsTableTableCreateCompanionBuilder,
    $$HarvestsTableTableUpdateCompanionBuilder,
    (HarvestRecordDbModel, $$HarvestsTableTableReferences),
    HarvestRecordDbModel,
    PrefetchHooks Function({bool batchId})> {
  $$HarvestsTableTableTableManager(_$AppDatabase db, $HarvestsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HarvestsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HarvestsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HarvestsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> batchId = const Value.absent(),
            Value<DateTime> harvestDate = const Value.absent(),
            Value<double> actualHarvestDuration = const Value.absent(),
            Value<double> grossWeight = const Value.absent(),
            Value<double> netSaleableWeight = const Value.absent(),
            Value<double> rejectedWeight = const Value.absent(),
            Value<double> moisturePercentage = const Value.absent(),
            Value<double> wastePercentage = const Value.absent(),
            Value<double> averageCocoonSize = const Value.absent(),
            Value<double> gradeAWeight = const Value.absent(),
            Value<double> gradeBWeight = const Value.absent(),
            Value<double> gradeCWeight = const Value.absent(),
            Value<double> yieldPercentage = const Value.absent(),
            Value<double> survivalRate = const Value.absent(),
            Value<double> feedConversionRatio = const Value.absent(),
            Value<double> mortalityPercentage = const Value.absent(),
            Value<double> harvestEfficiency = const Value.absent(),
            Value<String?> harvestedBy = const Value.absent(),
            Value<String?> remarks = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HarvestsTableCompanion(
            id: id,
            batchId: batchId,
            harvestDate: harvestDate,
            actualHarvestDuration: actualHarvestDuration,
            grossWeight: grossWeight,
            netSaleableWeight: netSaleableWeight,
            rejectedWeight: rejectedWeight,
            moisturePercentage: moisturePercentage,
            wastePercentage: wastePercentage,
            averageCocoonSize: averageCocoonSize,
            gradeAWeight: gradeAWeight,
            gradeBWeight: gradeBWeight,
            gradeCWeight: gradeCWeight,
            yieldPercentage: yieldPercentage,
            survivalRate: survivalRate,
            feedConversionRatio: feedConversionRatio,
            mortalityPercentage: mortalityPercentage,
            harvestEfficiency: harvestEfficiency,
            harvestedBy: harvestedBy,
            remarks: remarks,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String batchId,
            required DateTime harvestDate,
            required double actualHarvestDuration,
            required double grossWeight,
            required double netSaleableWeight,
            required double rejectedWeight,
            required double moisturePercentage,
            required double wastePercentage,
            required double averageCocoonSize,
            required double gradeAWeight,
            required double gradeBWeight,
            required double gradeCWeight,
            required double yieldPercentage,
            required double survivalRate,
            required double feedConversionRatio,
            required double mortalityPercentage,
            required double harvestEfficiency,
            Value<String?> harvestedBy = const Value.absent(),
            Value<String?> remarks = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HarvestsTableCompanion.insert(
            id: id,
            batchId: batchId,
            harvestDate: harvestDate,
            actualHarvestDuration: actualHarvestDuration,
            grossWeight: grossWeight,
            netSaleableWeight: netSaleableWeight,
            rejectedWeight: rejectedWeight,
            moisturePercentage: moisturePercentage,
            wastePercentage: wastePercentage,
            averageCocoonSize: averageCocoonSize,
            gradeAWeight: gradeAWeight,
            gradeBWeight: gradeBWeight,
            gradeCWeight: gradeCWeight,
            yieldPercentage: yieldPercentage,
            survivalRate: survivalRate,
            feedConversionRatio: feedConversionRatio,
            mortalityPercentage: mortalityPercentage,
            harvestEfficiency: harvestEfficiency,
            harvestedBy: harvestedBy,
            remarks: remarks,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$HarvestsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({batchId = false}) {
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
                      dynamic>>(state) {
                if (batchId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.batchId,
                    referencedTable:
                        $$HarvestsTableTableReferences._batchIdTable(db),
                    referencedColumn:
                        $$HarvestsTableTableReferences._batchIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$HarvestsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HarvestsTableTable,
    HarvestRecordDbModel,
    $$HarvestsTableTableFilterComposer,
    $$HarvestsTableTableOrderingComposer,
    $$HarvestsTableTableAnnotationComposer,
    $$HarvestsTableTableCreateCompanionBuilder,
    $$HarvestsTableTableUpdateCompanionBuilder,
    (HarvestRecordDbModel, $$HarvestsTableTableReferences),
    HarvestRecordDbModel,
    PrefetchHooks Function({bool batchId})>;
typedef $$NotificationsTableTableCreateCompanionBuilder
    = NotificationsTableCompanion Function({
  required String id,
  required String title,
  required String message,
  required String category,
  required String priority,
  required DateTime timestamp,
  Value<bool> isRead,
  Value<String?> referenceId,
  Value<int> rowid,
});
typedef $$NotificationsTableTableUpdateCompanionBuilder
    = NotificationsTableCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String> message,
  Value<String> category,
  Value<String> priority,
  Value<DateTime> timestamp,
  Value<bool> isRead,
  Value<String?> referenceId,
  Value<int> rowid,
});

class $$NotificationsTableTableFilterComposer
    extends Composer<_$AppDatabase, $NotificationsTableTable> {
  $$NotificationsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRead => $composableBuilder(
      column: $table.isRead, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get referenceId => $composableBuilder(
      column: $table.referenceId, builder: (column) => ColumnFilters(column));
}

class $$NotificationsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificationsTableTable> {
  $$NotificationsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRead => $composableBuilder(
      column: $table.isRead, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get referenceId => $composableBuilder(
      column: $table.referenceId, builder: (column) => ColumnOrderings(column));
}

class $$NotificationsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificationsTableTable> {
  $$NotificationsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<bool> get isRead =>
      $composableBuilder(column: $table.isRead, builder: (column) => column);

  GeneratedColumn<String> get referenceId => $composableBuilder(
      column: $table.referenceId, builder: (column) => column);
}

class $$NotificationsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NotificationsTableTable,
    NotificationDbModel,
    $$NotificationsTableTableFilterComposer,
    $$NotificationsTableTableOrderingComposer,
    $$NotificationsTableTableAnnotationComposer,
    $$NotificationsTableTableCreateCompanionBuilder,
    $$NotificationsTableTableUpdateCompanionBuilder,
    (
      NotificationDbModel,
      BaseReferences<_$AppDatabase, $NotificationsTableTable,
          NotificationDbModel>
    ),
    NotificationDbModel,
    PrefetchHooks Function()> {
  $$NotificationsTableTableTableManager(
      _$AppDatabase db, $NotificationsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotificationsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotificationsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> message = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> priority = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<bool> isRead = const Value.absent(),
            Value<String?> referenceId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NotificationsTableCompanion(
            id: id,
            title: title,
            message: message,
            category: category,
            priority: priority,
            timestamp: timestamp,
            isRead: isRead,
            referenceId: referenceId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required String message,
            required String category,
            required String priority,
            required DateTime timestamp,
            Value<bool> isRead = const Value.absent(),
            Value<String?> referenceId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NotificationsTableCompanion.insert(
            id: id,
            title: title,
            message: message,
            category: category,
            priority: priority,
            timestamp: timestamp,
            isRead: isRead,
            referenceId: referenceId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NotificationsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NotificationsTableTable,
    NotificationDbModel,
    $$NotificationsTableTableFilterComposer,
    $$NotificationsTableTableOrderingComposer,
    $$NotificationsTableTableAnnotationComposer,
    $$NotificationsTableTableCreateCompanionBuilder,
    $$NotificationsTableTableUpdateCompanionBuilder,
    (
      NotificationDbModel,
      BaseReferences<_$AppDatabase, $NotificationsTableTable,
          NotificationDbModel>
    ),
    NotificationDbModel,
    PrefetchHooks Function()>;
typedef $$BackupsTableTableCreateCompanionBuilder = BackupsTableCompanion
    Function({
  required String id,
  required String fileName,
  required String filePath,
  required DateTime timestamp,
  required int fileSizeBytes,
  required String databaseVersion,
  required String checksum,
  required bool isAutoBackup,
  Value<int> rowid,
});
typedef $$BackupsTableTableUpdateCompanionBuilder = BackupsTableCompanion
    Function({
  Value<String> id,
  Value<String> fileName,
  Value<String> filePath,
  Value<DateTime> timestamp,
  Value<int> fileSizeBytes,
  Value<String> databaseVersion,
  Value<String> checksum,
  Value<bool> isAutoBackup,
  Value<int> rowid,
});

class $$BackupsTableTableFilterComposer
    extends Composer<_$AppDatabase, $BackupsTableTable> {
  $$BackupsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fileName => $composableBuilder(
      column: $table.fileName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get fileSizeBytes => $composableBuilder(
      column: $table.fileSizeBytes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get databaseVersion => $composableBuilder(
      column: $table.databaseVersion,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get checksum => $composableBuilder(
      column: $table.checksum, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isAutoBackup => $composableBuilder(
      column: $table.isAutoBackup, builder: (column) => ColumnFilters(column));
}

class $$BackupsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BackupsTableTable> {
  $$BackupsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fileName => $composableBuilder(
      column: $table.fileName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get fileSizeBytes => $composableBuilder(
      column: $table.fileSizeBytes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get databaseVersion => $composableBuilder(
      column: $table.databaseVersion,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get checksum => $composableBuilder(
      column: $table.checksum, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isAutoBackup => $composableBuilder(
      column: $table.isAutoBackup,
      builder: (column) => ColumnOrderings(column));
}

class $$BackupsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BackupsTableTable> {
  $$BackupsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<int> get fileSizeBytes => $composableBuilder(
      column: $table.fileSizeBytes, builder: (column) => column);

  GeneratedColumn<String> get databaseVersion => $composableBuilder(
      column: $table.databaseVersion, builder: (column) => column);

  GeneratedColumn<String> get checksum =>
      $composableBuilder(column: $table.checksum, builder: (column) => column);

  GeneratedColumn<bool> get isAutoBackup => $composableBuilder(
      column: $table.isAutoBackup, builder: (column) => column);
}

class $$BackupsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BackupsTableTable,
    BackupDbModel,
    $$BackupsTableTableFilterComposer,
    $$BackupsTableTableOrderingComposer,
    $$BackupsTableTableAnnotationComposer,
    $$BackupsTableTableCreateCompanionBuilder,
    $$BackupsTableTableUpdateCompanionBuilder,
    (
      BackupDbModel,
      BaseReferences<_$AppDatabase, $BackupsTableTable, BackupDbModel>
    ),
    BackupDbModel,
    PrefetchHooks Function()> {
  $$BackupsTableTableTableManager(_$AppDatabase db, $BackupsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BackupsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BackupsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BackupsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> fileName = const Value.absent(),
            Value<String> filePath = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<int> fileSizeBytes = const Value.absent(),
            Value<String> databaseVersion = const Value.absent(),
            Value<String> checksum = const Value.absent(),
            Value<bool> isAutoBackup = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BackupsTableCompanion(
            id: id,
            fileName: fileName,
            filePath: filePath,
            timestamp: timestamp,
            fileSizeBytes: fileSizeBytes,
            databaseVersion: databaseVersion,
            checksum: checksum,
            isAutoBackup: isAutoBackup,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String fileName,
            required String filePath,
            required DateTime timestamp,
            required int fileSizeBytes,
            required String databaseVersion,
            required String checksum,
            required bool isAutoBackup,
            Value<int> rowid = const Value.absent(),
          }) =>
              BackupsTableCompanion.insert(
            id: id,
            fileName: fileName,
            filePath: filePath,
            timestamp: timestamp,
            fileSizeBytes: fileSizeBytes,
            databaseVersion: databaseVersion,
            checksum: checksum,
            isAutoBackup: isAutoBackup,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BackupsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BackupsTableTable,
    BackupDbModel,
    $$BackupsTableTableFilterComposer,
    $$BackupsTableTableOrderingComposer,
    $$BackupsTableTableAnnotationComposer,
    $$BackupsTableTableCreateCompanionBuilder,
    $$BackupsTableTableUpdateCompanionBuilder,
    (
      BackupDbModel,
      BaseReferences<_$AppDatabase, $BackupsTableTable, BackupDbModel>
    ),
    BackupDbModel,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ExpenseCategoriesTableTableTableManager get expenseCategoriesTable =>
      $$ExpenseCategoriesTableTableTableManager(
          _db, _db.expenseCategoriesTable);
  $$BatchesTableTableTableManager get batchesTable =>
      $$BatchesTableTableTableManager(_db, _db.batchesTable);
  $$ExpensesTableTableTableManager get expensesTable =>
      $$ExpensesTableTableTableManager(_db, _db.expensesTable);
  $$BuyersTableTableTableManager get buyersTable =>
      $$BuyersTableTableTableManager(_db, _db.buyersTable);
  $$IncomeCategoriesTableTableTableManager get incomeCategoriesTable =>
      $$IncomeCategoriesTableTableTableManager(_db, _db.incomeCategoriesTable);
  $$IncomesTableTableTableManager get incomesTable =>
      $$IncomesTableTableTableManager(_db, _db.incomesTable);
  $$BatchTimelinesTableTableTableManager get batchTimelinesTable =>
      $$BatchTimelinesTableTableTableManager(_db, _db.batchTimelinesTable);
  $$InventoryCategoriesTableTableTableManager get inventoryCategoriesTable =>
      $$InventoryCategoriesTableTableTableManager(
          _db, _db.inventoryCategoriesTable);
  $$InventoryItemsTableTableTableManager get inventoryItemsTable =>
      $$InventoryItemsTableTableTableManager(_db, _db.inventoryItemsTable);
  $$InventoryTransactionsTableTableTableManager
      get inventoryTransactionsTable =>
          $$InventoryTransactionsTableTableTableManager(
              _db, _db.inventoryTransactionsTable);
  $$WorkersTableTableTableManager get workersTable =>
      $$WorkersTableTableTableManager(_db, _db.workersTable);
  $$AttendanceTableTableTableManager get attendanceTable =>
      $$AttendanceTableTableTableManager(_db, _db.attendanceTable);
  $$AssignmentsTableTableTableManager get assignmentsTable =>
      $$AssignmentsTableTableTableManager(_db, _db.assignmentsTable);
  $$WagesTableTableTableManager get wagesTable =>
      $$WagesTableTableTableManager(_db, _db.wagesTable);
  $$FeedingLogsTableTableTableManager get feedingLogsTable =>
      $$FeedingLogsTableTableTableManager(_db, _db.feedingLogsTable);
  $$EnvironmentalLogsTableTableTableManager get environmentalLogsTable =>
      $$EnvironmentalLogsTableTableTableManager(
          _db, _db.environmentalLogsTable);
  $$MortalityLogsTableTableTableManager get mortalityLogsTable =>
      $$MortalityLogsTableTableTableManager(_db, _db.mortalityLogsTable);
  $$HarvestsTableTableTableManager get harvestsTable =>
      $$HarvestsTableTableTableManager(_db, _db.harvestsTable);
  $$NotificationsTableTableTableManager get notificationsTable =>
      $$NotificationsTableTableTableManager(_db, _db.notificationsTable);
  $$BackupsTableTableTableManager get backupsTable =>
      $$BackupsTableTableTableManager(_db, _db.backupsTable);
}
