// dart format width=80
// ignore_for_file: type=lint
part of 'database.dart';

class $SavingsEntriesTable extends SavingsEntries
    with TableInfo<$SavingsEntriesTable, SavingsEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavingsEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startAmountMeta = const VerificationMeta(
    'startAmount',
  );
  @override
  late final GeneratedColumn<double> startAmount = GeneratedColumn<double>(
    'start_amount',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, type, startAmount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'savings_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<SavingsEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('start_amount')) {
      context.handle(
        _startAmountMeta,
        startAmount.isAcceptableOrUnknown(
          data['start_amount']!,
          _startAmountMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SavingsEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavingsEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      startAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}start_amount'],
      ),
    );
  }

  @override
  $SavingsEntriesTable createAlias(String alias) {
    return $SavingsEntriesTable(attachedDatabase, alias);
  }
}

class SavingsEntry extends DataClass implements Insertable<SavingsEntry> {
  final int id;
  final String type;
  final double? startAmount;
  const SavingsEntry({required this.id, required this.type, this.startAmount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || startAmount != null) {
      map['start_amount'] = Variable<double>(startAmount);
    }
    return map;
  }

  SavingsEntriesCompanion toCompanion(bool nullToAbsent) {
    return SavingsEntriesCompanion(
      id: Value(id),
      type: Value(type),
      startAmount: startAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(startAmount),
    );
  }

  factory SavingsEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavingsEntry(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      startAmount: serializer.fromJson<double?>(json['startAmount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
      'startAmount': serializer.toJson<double?>(startAmount),
    };
  }

  SavingsEntry copyWith({
    int? id,
    String? type,
    Value<double?> startAmount = const Value.absent(),
  }) => SavingsEntry(
    id: id ?? this.id,
    type: type ?? this.type,
    startAmount: startAmount.present ? startAmount.value : this.startAmount,
  );
  SavingsEntry copyWithCompanion(SavingsEntriesCompanion data) {
    return SavingsEntry(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      startAmount: data.startAmount.present
          ? data.startAmount.value
          : this.startAmount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavingsEntry(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('startAmount: $startAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, startAmount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavingsEntry &&
          other.id == this.id &&
          other.type == this.type &&
          other.startAmount == this.startAmount);
}

class SavingsEntriesCompanion extends UpdateCompanion<SavingsEntry> {
  final Value<int> id;
  final Value<String> type;
  final Value<double?> startAmount;
  const SavingsEntriesCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.startAmount = const Value.absent(),
  });
  SavingsEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String type,
    this.startAmount = const Value.absent(),
  }) : type = Value(type);
  static Insertable<SavingsEntry> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<double>? startAmount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (startAmount != null) 'start_amount': startAmount,
    });
  }

  SavingsEntriesCompanion copyWith({
    Value<int>? id,
    Value<String>? type,
    Value<double?>? startAmount,
  }) {
    return SavingsEntriesCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      startAmount: startAmount ?? this.startAmount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (startAmount.present) {
      map['start_amount'] = Variable<double>(startAmount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavingsEntriesCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('startAmount: $startAmount')
          ..write(')'))
        .toString();
  }
}

class $CashEntriesTable extends CashEntries
    with TableInfo<$CashEntriesTable, CashEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CashEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, label, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cash_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<CashEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CashEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CashEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $CashEntriesTable createAlias(String alias) {
    return $CashEntriesTable(attachedDatabase, alias);
  }
}

class CashEntry extends DataClass implements Insertable<CashEntry> {
  final int id;
  final String label;
  final double value;
  const CashEntry({required this.id, required this.label, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['label'] = Variable<String>(label);
    map['value'] = Variable<double>(value);
    return map;
  }

  CashEntriesCompanion toCompanion(bool nullToAbsent) {
    return CashEntriesCompanion(
      id: Value(id),
      label: Value(label),
      value: Value(value),
    );
  }

  factory CashEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CashEntry(
      id: serializer.fromJson<int>(json['id']),
      label: serializer.fromJson<String>(json['label']),
      value: serializer.fromJson<double>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'label': serializer.toJson<String>(label),
      'value': serializer.toJson<double>(value),
    };
  }

  CashEntry copyWith({int? id, String? label, double? value}) => CashEntry(
    id: id ?? this.id,
    label: label ?? this.label,
    value: value ?? this.value,
  );
  CashEntry copyWithCompanion(CashEntriesCompanion data) {
    return CashEntry(
      id: data.id.present ? data.id.value : this.id,
      label: data.label.present ? data.label.value : this.label,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CashEntry(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, label, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CashEntry &&
          other.id == this.id &&
          other.label == this.label &&
          other.value == this.value);
}

class CashEntriesCompanion extends UpdateCompanion<CashEntry> {
  final Value<int> id;
  final Value<String> label;
  final Value<double> value;
  const CashEntriesCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
    this.value = const Value.absent(),
  });
  CashEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String label,
    required double value,
  }) : label = Value(label),
       value = Value(value);
  static Insertable<CashEntry> custom({
    Expression<int>? id,
    Expression<String>? label,
    Expression<double>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
      if (value != null) 'value': value,
    });
  }

  CashEntriesCompanion copyWith({
    Value<int>? id,
    Value<String>? label,
    Value<double>? value,
  }) {
    return CashEntriesCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashEntriesCompanion(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $CrowdfundingEntriesTable extends CrowdfundingEntries
    with TableInfo<$CrowdfundingEntriesTable, CrowdfundingEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CrowdfundingEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _brutProfitMeta = const VerificationMeta(
    'brutProfit',
  );
  @override
  late final GeneratedColumn<double> brutProfit = GeneratedColumn<double>(
    'brut_profit',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _platformNameMeta = const VerificationMeta(
    'platformName',
  );
  @override
  late final GeneratedColumn<String> platformName = GeneratedColumn<String>(
    'platform_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _netProfitMeta = const VerificationMeta(
    'netProfit',
  );
  @override
  late final GeneratedColumn<double> netProfit = GeneratedColumn<double>(
    'net_profit',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _taxProfitMeta = const VerificationMeta(
    'taxProfit',
  );
  @override
  late final GeneratedColumn<double> taxProfit = GeneratedColumn<double>(
    'tax_profit',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _taxPercentageMeta = const VerificationMeta(
    'taxPercentage',
  );
  @override
  late final GeneratedColumn<double> taxPercentage = GeneratedColumn<double>(
    'tax_percentage',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _receivedAtMeta = const VerificationMeta(
    'receivedAt',
  );
  @override
  late final GeneratedColumn<DateTime> receivedAt = GeneratedColumn<DateTime>(
    'received_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    brutProfit,
    platformName,
    netProfit,
    taxProfit,
    taxPercentage,
    receivedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'crowdfunding_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<CrowdfundingEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('brut_profit')) {
      context.handle(
        _brutProfitMeta,
        brutProfit.isAcceptableOrUnknown(data['brut_profit']!, _brutProfitMeta),
      );
    } else if (isInserting) {
      context.missing(_brutProfitMeta);
    }
    if (data.containsKey('platform_name')) {
      context.handle(
        _platformNameMeta,
        platformName.isAcceptableOrUnknown(
          data['platform_name']!,
          _platformNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_platformNameMeta);
    }
    if (data.containsKey('net_profit')) {
      context.handle(
        _netProfitMeta,
        netProfit.isAcceptableOrUnknown(data['net_profit']!, _netProfitMeta),
      );
    }
    if (data.containsKey('tax_profit')) {
      context.handle(
        _taxProfitMeta,
        taxProfit.isAcceptableOrUnknown(data['tax_profit']!, _taxProfitMeta),
      );
    }
    if (data.containsKey('tax_percentage')) {
      context.handle(
        _taxPercentageMeta,
        taxPercentage.isAcceptableOrUnknown(
          data['tax_percentage']!,
          _taxPercentageMeta,
        ),
      );
    }
    if (data.containsKey('received_at')) {
      context.handle(
        _receivedAtMeta,
        receivedAt.isAcceptableOrUnknown(data['received_at']!, _receivedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_receivedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CrowdfundingEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CrowdfundingEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      brutProfit: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}brut_profit'],
      )!,
      platformName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}platform_name'],
      )!,
      netProfit: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}net_profit'],
      ),
      taxProfit: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tax_profit'],
      ),
      taxPercentage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tax_percentage'],
      ),
      receivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}received_at'],
      )!,
    );
  }

  @override
  $CrowdfundingEntriesTable createAlias(String alias) {
    return $CrowdfundingEntriesTable(attachedDatabase, alias);
  }
}

class CrowdfundingEntry extends DataClass
    implements Insertable<CrowdfundingEntry> {
  final int id;
  final double brutProfit;
  final String platformName;
  final double? netProfit;
  final double? taxProfit;
  final double? taxPercentage;
  final DateTime receivedAt;
  const CrowdfundingEntry({
    required this.id,
    required this.brutProfit,
    required this.platformName,
    this.netProfit,
    this.taxProfit,
    this.taxPercentage,
    required this.receivedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['brut_profit'] = Variable<double>(brutProfit);
    map['platform_name'] = Variable<String>(platformName);
    if (!nullToAbsent || netProfit != null) {
      map['net_profit'] = Variable<double>(netProfit);
    }
    if (!nullToAbsent || taxProfit != null) {
      map['tax_profit'] = Variable<double>(taxProfit);
    }
    if (!nullToAbsent || taxPercentage != null) {
      map['tax_percentage'] = Variable<double>(taxPercentage);
    }
    map['received_at'] = Variable<DateTime>(receivedAt);
    return map;
  }

  CrowdfundingEntriesCompanion toCompanion(bool nullToAbsent) {
    return CrowdfundingEntriesCompanion(
      id: Value(id),
      brutProfit: Value(brutProfit),
      platformName: Value(platformName),
      netProfit: netProfit == null && nullToAbsent
          ? const Value.absent()
          : Value(netProfit),
      taxProfit: taxProfit == null && nullToAbsent
          ? const Value.absent()
          : Value(taxProfit),
      taxPercentage: taxPercentage == null && nullToAbsent
          ? const Value.absent()
          : Value(taxPercentage),
      receivedAt: Value(receivedAt),
    );
  }

  factory CrowdfundingEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CrowdfundingEntry(
      id: serializer.fromJson<int>(json['id']),
      brutProfit: serializer.fromJson<double>(json['brutProfit']),
      platformName: serializer.fromJson<String>(json['platformName']),
      netProfit: serializer.fromJson<double?>(json['netProfit']),
      taxProfit: serializer.fromJson<double?>(json['taxProfit']),
      taxPercentage: serializer.fromJson<double?>(json['taxPercentage']),
      receivedAt: serializer.fromJson<DateTime>(json['receivedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'brutProfit': serializer.toJson<double>(brutProfit),
      'platformName': serializer.toJson<String>(platformName),
      'netProfit': serializer.toJson<double?>(netProfit),
      'taxProfit': serializer.toJson<double?>(taxProfit),
      'taxPercentage': serializer.toJson<double?>(taxPercentage),
      'receivedAt': serializer.toJson<DateTime>(receivedAt),
    };
  }

  CrowdfundingEntry copyWith({
    int? id,
    double? brutProfit,
    String? platformName,
    Value<double?> netProfit = const Value.absent(),
    Value<double?> taxProfit = const Value.absent(),
    Value<double?> taxPercentage = const Value.absent(),
    DateTime? receivedAt,
  }) => CrowdfundingEntry(
    id: id ?? this.id,
    brutProfit: brutProfit ?? this.brutProfit,
    platformName: platformName ?? this.platformName,
    netProfit: netProfit.present ? netProfit.value : this.netProfit,
    taxProfit: taxProfit.present ? taxProfit.value : this.taxProfit,
    taxPercentage: taxPercentage.present
        ? taxPercentage.value
        : this.taxPercentage,
    receivedAt: receivedAt ?? this.receivedAt,
  );
  CrowdfundingEntry copyWithCompanion(CrowdfundingEntriesCompanion data) {
    return CrowdfundingEntry(
      id: data.id.present ? data.id.value : this.id,
      brutProfit: data.brutProfit.present
          ? data.brutProfit.value
          : this.brutProfit,
      platformName: data.platformName.present
          ? data.platformName.value
          : this.platformName,
      netProfit: data.netProfit.present ? data.netProfit.value : this.netProfit,
      taxProfit: data.taxProfit.present ? data.taxProfit.value : this.taxProfit,
      taxPercentage: data.taxPercentage.present
          ? data.taxPercentage.value
          : this.taxPercentage,
      receivedAt: data.receivedAt.present
          ? data.receivedAt.value
          : this.receivedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CrowdfundingEntry(')
          ..write('id: $id, ')
          ..write('brutProfit: $brutProfit, ')
          ..write('platformName: $platformName, ')
          ..write('netProfit: $netProfit, ')
          ..write('taxProfit: $taxProfit, ')
          ..write('taxPercentage: $taxPercentage, ')
          ..write('receivedAt: $receivedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    brutProfit,
    platformName,
    netProfit,
    taxProfit,
    taxPercentage,
    receivedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CrowdfundingEntry &&
          other.id == this.id &&
          other.brutProfit == this.brutProfit &&
          other.platformName == this.platformName &&
          other.netProfit == this.netProfit &&
          other.taxProfit == this.taxProfit &&
          other.taxPercentage == this.taxPercentage &&
          other.receivedAt == this.receivedAt);
}

class CrowdfundingEntriesCompanion extends UpdateCompanion<CrowdfundingEntry> {
  final Value<int> id;
  final Value<double> brutProfit;
  final Value<String> platformName;
  final Value<double?> netProfit;
  final Value<double?> taxProfit;
  final Value<double?> taxPercentage;
  final Value<DateTime> receivedAt;
  const CrowdfundingEntriesCompanion({
    this.id = const Value.absent(),
    this.brutProfit = const Value.absent(),
    this.platformName = const Value.absent(),
    this.netProfit = const Value.absent(),
    this.taxProfit = const Value.absent(),
    this.taxPercentage = const Value.absent(),
    this.receivedAt = const Value.absent(),
  });
  CrowdfundingEntriesCompanion.insert({
    this.id = const Value.absent(),
    required double brutProfit,
    required String platformName,
    this.netProfit = const Value.absent(),
    this.taxProfit = const Value.absent(),
    this.taxPercentage = const Value.absent(),
    required DateTime receivedAt,
  }) : brutProfit = Value(brutProfit),
       platformName = Value(platformName),
       receivedAt = Value(receivedAt);
  static Insertable<CrowdfundingEntry> custom({
    Expression<int>? id,
    Expression<double>? brutProfit,
    Expression<String>? platformName,
    Expression<double>? netProfit,
    Expression<double>? taxProfit,
    Expression<double>? taxPercentage,
    Expression<DateTime>? receivedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (brutProfit != null) 'brut_profit': brutProfit,
      if (platformName != null) 'platform_name': platformName,
      if (netProfit != null) 'net_profit': netProfit,
      if (taxProfit != null) 'tax_profit': taxProfit,
      if (taxPercentage != null) 'tax_percentage': taxPercentage,
      if (receivedAt != null) 'received_at': receivedAt,
    });
  }

  CrowdfundingEntriesCompanion copyWith({
    Value<int>? id,
    Value<double>? brutProfit,
    Value<String>? platformName,
    Value<double?>? netProfit,
    Value<double?>? taxProfit,
    Value<double?>? taxPercentage,
    Value<DateTime>? receivedAt,
  }) {
    return CrowdfundingEntriesCompanion(
      id: id ?? this.id,
      brutProfit: brutProfit ?? this.brutProfit,
      platformName: platformName ?? this.platformName,
      netProfit: netProfit ?? this.netProfit,
      taxProfit: taxProfit ?? this.taxProfit,
      taxPercentage: taxPercentage ?? this.taxPercentage,
      receivedAt: receivedAt ?? this.receivedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (brutProfit.present) {
      map['brut_profit'] = Variable<double>(brutProfit.value);
    }
    if (platformName.present) {
      map['platform_name'] = Variable<String>(platformName.value);
    }
    if (netProfit.present) {
      map['net_profit'] = Variable<double>(netProfit.value);
    }
    if (taxProfit.present) {
      map['tax_profit'] = Variable<double>(taxProfit.value);
    }
    if (taxPercentage.present) {
      map['tax_percentage'] = Variable<double>(taxPercentage.value);
    }
    if (receivedAt.present) {
      map['received_at'] = Variable<DateTime>(receivedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CrowdfundingEntriesCompanion(')
          ..write('id: $id, ')
          ..write('brutProfit: $brutProfit, ')
          ..write('platformName: $platformName, ')
          ..write('netProfit: $netProfit, ')
          ..write('taxProfit: $taxProfit, ')
          ..write('taxPercentage: $taxPercentage, ')
          ..write('receivedAt: $receivedAt')
          ..write(')'))
        .toString();
  }
}

class $SavingsBookEntriesTable extends SavingsBookEntries
    with TableInfo<$SavingsBookEntriesTable, SavingsBookEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavingsBookEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startAmountMeta = const VerificationMeta(
    'startAmount',
  );
  @override
  late final GeneratedColumn<double> startAmount = GeneratedColumn<double>(
    'start_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _withdrawalMeta = const VerificationMeta(
    'withdrawal',
  );
  @override
  late final GeneratedColumn<double> withdrawal = GeneratedColumn<double>(
    'withdrawal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _interestsMeta = const VerificationMeta(
    'interests',
  );
  @override
  late final GeneratedColumn<double> interests = GeneratedColumn<double>(
    'interests',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    startAmount,
    withdrawal,
    interests,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'savings_book_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<SavingsBookEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('start_amount')) {
      context.handle(
        _startAmountMeta,
        startAmount.isAcceptableOrUnknown(
          data['start_amount']!,
          _startAmountMeta,
        ),
      );
    }
    if (data.containsKey('withdrawal')) {
      context.handle(
        _withdrawalMeta,
        withdrawal.isAcceptableOrUnknown(data['withdrawal']!, _withdrawalMeta),
      );
    }
    if (data.containsKey('interests')) {
      context.handle(
        _interestsMeta,
        interests.isAcceptableOrUnknown(data['interests']!, _interestsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SavingsBookEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavingsBookEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      startAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}start_amount'],
      )!,
      withdrawal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}withdrawal'],
      )!,
      interests: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}interests'],
      )!,
    );
  }

  @override
  $SavingsBookEntriesTable createAlias(String alias) {
    return $SavingsBookEntriesTable(attachedDatabase, alias);
  }
}

class SavingsBookEntry extends DataClass
    implements Insertable<SavingsBookEntry> {
  final int id;
  final String name;
  final double startAmount;
  final double withdrawal;
  final double interests;
  const SavingsBookEntry({
    required this.id,
    required this.name,
    required this.startAmount,
    required this.withdrawal,
    required this.interests,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['start_amount'] = Variable<double>(startAmount);
    map['withdrawal'] = Variable<double>(withdrawal);
    map['interests'] = Variable<double>(interests);
    return map;
  }

  SavingsBookEntriesCompanion toCompanion(bool nullToAbsent) {
    return SavingsBookEntriesCompanion(
      id: Value(id),
      name: Value(name),
      startAmount: Value(startAmount),
      withdrawal: Value(withdrawal),
      interests: Value(interests),
    );
  }

  factory SavingsBookEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavingsBookEntry(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      startAmount: serializer.fromJson<double>(json['startAmount']),
      withdrawal: serializer.fromJson<double>(json['withdrawal']),
      interests: serializer.fromJson<double>(json['interests']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'startAmount': serializer.toJson<double>(startAmount),
      'withdrawal': serializer.toJson<double>(withdrawal),
      'interests': serializer.toJson<double>(interests),
    };
  }

  SavingsBookEntry copyWith({
    int? id,
    String? name,
    double? startAmount,
    double? withdrawal,
    double? interests,
  }) => SavingsBookEntry(
    id: id ?? this.id,
    name: name ?? this.name,
    startAmount: startAmount ?? this.startAmount,
    withdrawal: withdrawal ?? this.withdrawal,
    interests: interests ?? this.interests,
  );
  SavingsBookEntry copyWithCompanion(SavingsBookEntriesCompanion data) {
    return SavingsBookEntry(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      startAmount: data.startAmount.present
          ? data.startAmount.value
          : this.startAmount,
      withdrawal: data.withdrawal.present
          ? data.withdrawal.value
          : this.withdrawal,
      interests: data.interests.present ? data.interests.value : this.interests,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavingsBookEntry(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('startAmount: $startAmount, ')
          ..write('withdrawal: $withdrawal, ')
          ..write('interests: $interests')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, startAmount, withdrawal, interests);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavingsBookEntry &&
          other.id == this.id &&
          other.name == this.name &&
          other.startAmount == this.startAmount &&
          other.withdrawal == this.withdrawal &&
          other.interests == this.interests);
}

class SavingsBookEntriesCompanion extends UpdateCompanion<SavingsBookEntry> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> startAmount;
  final Value<double> withdrawal;
  final Value<double> interests;
  const SavingsBookEntriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.startAmount = const Value.absent(),
    this.withdrawal = const Value.absent(),
    this.interests = const Value.absent(),
  });
  SavingsBookEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.startAmount = const Value.absent(),
    this.withdrawal = const Value.absent(),
    this.interests = const Value.absent(),
  }) : name = Value(name);
  static Insertable<SavingsBookEntry> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? startAmount,
    Expression<double>? withdrawal,
    Expression<double>? interests,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (startAmount != null) 'start_amount': startAmount,
      if (withdrawal != null) 'withdrawal': withdrawal,
      if (interests != null) 'interests': interests,
    });
  }

  SavingsBookEntriesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<double>? startAmount,
    Value<double>? withdrawal,
    Value<double>? interests,
  }) {
    return SavingsBookEntriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      startAmount: startAmount ?? this.startAmount,
      withdrawal: withdrawal ?? this.withdrawal,
      interests: interests ?? this.interests,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (startAmount.present) {
      map['start_amount'] = Variable<double>(startAmount.value);
    }
    if (withdrawal.present) {
      map['withdrawal'] = Variable<double>(withdrawal.value);
    }
    if (interests.present) {
      map['interests'] = Variable<double>(interests.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavingsBookEntriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('startAmount: $startAmount, ')
          ..write('withdrawal: $withdrawal, ')
          ..write('interests: $interests')
          ..write(')'))
        .toString();
  }
}

class $CounterStrikeEntriesTable extends CounterStrikeEntries
    with TableInfo<$CounterStrikeEntriesTable, CounterStrikeEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CounterStrikeEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _boughtAtMeta = const VerificationMeta(
    'boughtAt',
  );
  @override
  late final GeneratedColumn<DateTime> boughtAt = GeneratedColumn<DateTime>(
    'bought_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastUpdateMeta = const VerificationMeta(
    'lastUpdate',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdate = GeneratedColumn<DateTime>(
    'last_update',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageIdMeta = const VerificationMeta(
    'imageId',
  );
  @override
  late final GeneratedColumn<String> imageId = GeneratedColumn<String>(
    'image_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _purchaseValueMeta = const VerificationMeta(
    'purchaseValue',
  );
  @override
  late final GeneratedColumn<double> purchaseValue = GeneratedColumn<double>(
    'purchase_value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentValueMeta = const VerificationMeta(
    'currentValue',
  );
  @override
  late final GeneratedColumn<double> currentValue = GeneratedColumn<double>(
    'current_value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wearMeta = const VerificationMeta('wear');
  @override
  late final GeneratedColumn<double> wear = GeneratedColumn<double>(
    'wear',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    boughtAt,
    lastUpdate,
    imageId,
    purchaseValue,
    currentValue,
    quantity,
    wear,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'counter_strike_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<CounterStrikeEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bought_at')) {
      context.handle(
        _boughtAtMeta,
        boughtAt.isAcceptableOrUnknown(data['bought_at']!, _boughtAtMeta),
      );
    } else if (isInserting) {
      context.missing(_boughtAtMeta);
    }
    if (data.containsKey('last_update')) {
      context.handle(
        _lastUpdateMeta,
        lastUpdate.isAcceptableOrUnknown(data['last_update']!, _lastUpdateMeta),
      );
    } else if (isInserting) {
      context.missing(_lastUpdateMeta);
    }
    if (data.containsKey('image_id')) {
      context.handle(
        _imageIdMeta,
        imageId.isAcceptableOrUnknown(data['image_id']!, _imageIdMeta),
      );
    } else if (isInserting) {
      context.missing(_imageIdMeta);
    }
    if (data.containsKey('purchase_value')) {
      context.handle(
        _purchaseValueMeta,
        purchaseValue.isAcceptableOrUnknown(
          data['purchase_value']!,
          _purchaseValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_purchaseValueMeta);
    }
    if (data.containsKey('current_value')) {
      context.handle(
        _currentValueMeta,
        currentValue.isAcceptableOrUnknown(
          data['current_value']!,
          _currentValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentValueMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('wear')) {
      context.handle(
        _wearMeta,
        wear.isAcceptableOrUnknown(data['wear']!, _wearMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CounterStrikeEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CounterStrikeEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      boughtAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}bought_at'],
      )!,
      lastUpdate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_update'],
      )!,
      imageId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_id'],
      )!,
      purchaseValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}purchase_value'],
      )!,
      currentValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}current_value'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      wear: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}wear'],
      ),
    );
  }

  @override
  $CounterStrikeEntriesTable createAlias(String alias) {
    return $CounterStrikeEntriesTable(attachedDatabase, alias);
  }
}

class CounterStrikeEntry extends DataClass
    implements Insertable<CounterStrikeEntry> {
  final int id;
  final DateTime boughtAt;
  final DateTime lastUpdate;
  final String imageId;
  final double purchaseValue;
  final double currentValue;
  final int quantity;
  final double? wear;
  const CounterStrikeEntry({
    required this.id,
    required this.boughtAt,
    required this.lastUpdate,
    required this.imageId,
    required this.purchaseValue,
    required this.currentValue,
    required this.quantity,
    this.wear,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bought_at'] = Variable<DateTime>(boughtAt);
    map['last_update'] = Variable<DateTime>(lastUpdate);
    map['image_id'] = Variable<String>(imageId);
    map['purchase_value'] = Variable<double>(purchaseValue);
    map['current_value'] = Variable<double>(currentValue);
    map['quantity'] = Variable<int>(quantity);
    if (!nullToAbsent || wear != null) {
      map['wear'] = Variable<double>(wear);
    }
    return map;
  }

  CounterStrikeEntriesCompanion toCompanion(bool nullToAbsent) {
    return CounterStrikeEntriesCompanion(
      id: Value(id),
      boughtAt: Value(boughtAt),
      lastUpdate: Value(lastUpdate),
      imageId: Value(imageId),
      purchaseValue: Value(purchaseValue),
      currentValue: Value(currentValue),
      quantity: Value(quantity),
      wear: wear == null && nullToAbsent ? const Value.absent() : Value(wear),
    );
  }

  factory CounterStrikeEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CounterStrikeEntry(
      id: serializer.fromJson<int>(json['id']),
      boughtAt: serializer.fromJson<DateTime>(json['boughtAt']),
      lastUpdate: serializer.fromJson<DateTime>(json['lastUpdate']),
      imageId: serializer.fromJson<String>(json['imageId']),
      purchaseValue: serializer.fromJson<double>(json['purchaseValue']),
      currentValue: serializer.fromJson<double>(json['currentValue']),
      quantity: serializer.fromJson<int>(json['quantity']),
      wear: serializer.fromJson<double?>(json['wear']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'boughtAt': serializer.toJson<DateTime>(boughtAt),
      'lastUpdate': serializer.toJson<DateTime>(lastUpdate),
      'imageId': serializer.toJson<String>(imageId),
      'purchaseValue': serializer.toJson<double>(purchaseValue),
      'currentValue': serializer.toJson<double>(currentValue),
      'quantity': serializer.toJson<int>(quantity),
      'wear': serializer.toJson<double?>(wear),
    };
  }

  CounterStrikeEntry copyWith({
    int? id,
    DateTime? boughtAt,
    DateTime? lastUpdate,
    String? imageId,
    double? purchaseValue,
    double? currentValue,
    int? quantity,
    Value<double?> wear = const Value.absent(),
  }) => CounterStrikeEntry(
    id: id ?? this.id,
    boughtAt: boughtAt ?? this.boughtAt,
    lastUpdate: lastUpdate ?? this.lastUpdate,
    imageId: imageId ?? this.imageId,
    purchaseValue: purchaseValue ?? this.purchaseValue,
    currentValue: currentValue ?? this.currentValue,
    quantity: quantity ?? this.quantity,
    wear: wear.present ? wear.value : this.wear,
  );
  CounterStrikeEntry copyWithCompanion(CounterStrikeEntriesCompanion data) {
    return CounterStrikeEntry(
      id: data.id.present ? data.id.value : this.id,
      boughtAt: data.boughtAt.present ? data.boughtAt.value : this.boughtAt,
      lastUpdate: data.lastUpdate.present
          ? data.lastUpdate.value
          : this.lastUpdate,
      imageId: data.imageId.present ? data.imageId.value : this.imageId,
      purchaseValue: data.purchaseValue.present
          ? data.purchaseValue.value
          : this.purchaseValue,
      currentValue: data.currentValue.present
          ? data.currentValue.value
          : this.currentValue,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      wear: data.wear.present ? data.wear.value : this.wear,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CounterStrikeEntry(')
          ..write('id: $id, ')
          ..write('boughtAt: $boughtAt, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('imageId: $imageId, ')
          ..write('purchaseValue: $purchaseValue, ')
          ..write('currentValue: $currentValue, ')
          ..write('quantity: $quantity, ')
          ..write('wear: $wear')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    boughtAt,
    lastUpdate,
    imageId,
    purchaseValue,
    currentValue,
    quantity,
    wear,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CounterStrikeEntry &&
          other.id == this.id &&
          other.boughtAt == this.boughtAt &&
          other.lastUpdate == this.lastUpdate &&
          other.imageId == this.imageId &&
          other.purchaseValue == this.purchaseValue &&
          other.currentValue == this.currentValue &&
          other.quantity == this.quantity &&
          other.wear == this.wear);
}

class CounterStrikeEntriesCompanion
    extends UpdateCompanion<CounterStrikeEntry> {
  final Value<int> id;
  final Value<DateTime> boughtAt;
  final Value<DateTime> lastUpdate;
  final Value<String> imageId;
  final Value<double> purchaseValue;
  final Value<double> currentValue;
  final Value<int> quantity;
  final Value<double?> wear;
  const CounterStrikeEntriesCompanion({
    this.id = const Value.absent(),
    this.boughtAt = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.imageId = const Value.absent(),
    this.purchaseValue = const Value.absent(),
    this.currentValue = const Value.absent(),
    this.quantity = const Value.absent(),
    this.wear = const Value.absent(),
  });
  CounterStrikeEntriesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime boughtAt,
    required DateTime lastUpdate,
    required String imageId,
    required double purchaseValue,
    required double currentValue,
    required int quantity,
    this.wear = const Value.absent(),
  }) : boughtAt = Value(boughtAt),
       lastUpdate = Value(lastUpdate),
       imageId = Value(imageId),
       purchaseValue = Value(purchaseValue),
       currentValue = Value(currentValue),
       quantity = Value(quantity);
  static Insertable<CounterStrikeEntry> custom({
    Expression<int>? id,
    Expression<DateTime>? boughtAt,
    Expression<DateTime>? lastUpdate,
    Expression<String>? imageId,
    Expression<double>? purchaseValue,
    Expression<double>? currentValue,
    Expression<int>? quantity,
    Expression<double>? wear,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (boughtAt != null) 'bought_at': boughtAt,
      if (lastUpdate != null) 'last_update': lastUpdate,
      if (imageId != null) 'image_id': imageId,
      if (purchaseValue != null) 'purchase_value': purchaseValue,
      if (currentValue != null) 'current_value': currentValue,
      if (quantity != null) 'quantity': quantity,
      if (wear != null) 'wear': wear,
    });
  }

  CounterStrikeEntriesCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? boughtAt,
    Value<DateTime>? lastUpdate,
    Value<String>? imageId,
    Value<double>? purchaseValue,
    Value<double>? currentValue,
    Value<int>? quantity,
    Value<double?>? wear,
  }) {
    return CounterStrikeEntriesCompanion(
      id: id ?? this.id,
      boughtAt: boughtAt ?? this.boughtAt,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      imageId: imageId ?? this.imageId,
      purchaseValue: purchaseValue ?? this.purchaseValue,
      currentValue: currentValue ?? this.currentValue,
      quantity: quantity ?? this.quantity,
      wear: wear ?? this.wear,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (boughtAt.present) {
      map['bought_at'] = Variable<DateTime>(boughtAt.value);
    }
    if (lastUpdate.present) {
      map['last_update'] = Variable<DateTime>(lastUpdate.value);
    }
    if (imageId.present) {
      map['image_id'] = Variable<String>(imageId.value);
    }
    if (purchaseValue.present) {
      map['purchase_value'] = Variable<double>(purchaseValue.value);
    }
    if (currentValue.present) {
      map['current_value'] = Variable<double>(currentValue.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (wear.present) {
      map['wear'] = Variable<double>(wear.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CounterStrikeEntriesCompanion(')
          ..write('id: $id, ')
          ..write('boughtAt: $boughtAt, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('imageId: $imageId, ')
          ..write('purchaseValue: $purchaseValue, ')
          ..write('currentValue: $currentValue, ')
          ..write('quantity: $quantity, ')
          ..write('wear: $wear')
          ..write(')'))
        .toString();
  }
}

class $PeaEntriesTable extends PeaEntries
    with TableInfo<$PeaEntriesTable, PeaEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PeaEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _equityMeta = const VerificationMeta('equity');
  @override
  late final GeneratedColumn<int> equity = GeneratedColumn<int>(
    'equity',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _costAverageMeta = const VerificationMeta(
    'costAverage',
  );
  @override
  late final GeneratedColumn<double> costAverage = GeneratedColumn<double>(
    'cost_average',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastPriceMeta = const VerificationMeta(
    'lastPrice',
  );
  @override
  late final GeneratedColumn<double> lastPrice = GeneratedColumn<double>(
    'last_price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastUpdateMeta = const VerificationMeta(
    'lastUpdate',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdate = GeneratedColumn<DateTime>(
    'last_update',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    equity,
    costAverage,
    lastPrice,
    lastUpdate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pea_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<PeaEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('equity')) {
      context.handle(
        _equityMeta,
        equity.isAcceptableOrUnknown(data['equity']!, _equityMeta),
      );
    }
    if (data.containsKey('cost_average')) {
      context.handle(
        _costAverageMeta,
        costAverage.isAcceptableOrUnknown(
          data['cost_average']!,
          _costAverageMeta,
        ),
      );
    }
    if (data.containsKey('last_price')) {
      context.handle(
        _lastPriceMeta,
        lastPrice.isAcceptableOrUnknown(data['last_price']!, _lastPriceMeta),
      );
    }
    if (data.containsKey('last_update')) {
      context.handle(
        _lastUpdateMeta,
        lastUpdate.isAcceptableOrUnknown(data['last_update']!, _lastUpdateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PeaEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PeaEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      equity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}equity'],
      ),
      costAverage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost_average'],
      ),
      lastPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}last_price'],
      ),
      lastUpdate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_update'],
      ),
    );
  }

  @override
  $PeaEntriesTable createAlias(String alias) {
    return $PeaEntriesTable(attachedDatabase, alias);
  }
}

class PeaEntry extends DataClass implements Insertable<PeaEntry> {
  final int id;
  final int? equity;
  final double? costAverage;
  final double? lastPrice;
  final DateTime? lastUpdate;
  const PeaEntry({
    required this.id,
    this.equity,
    this.costAverage,
    this.lastPrice,
    this.lastUpdate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || equity != null) {
      map['equity'] = Variable<int>(equity);
    }
    if (!nullToAbsent || costAverage != null) {
      map['cost_average'] = Variable<double>(costAverage);
    }
    if (!nullToAbsent || lastPrice != null) {
      map['last_price'] = Variable<double>(lastPrice);
    }
    if (!nullToAbsent || lastUpdate != null) {
      map['last_update'] = Variable<DateTime>(lastUpdate);
    }
    return map;
  }

  PeaEntriesCompanion toCompanion(bool nullToAbsent) {
    return PeaEntriesCompanion(
      id: Value(id),
      equity: equity == null && nullToAbsent
          ? const Value.absent()
          : Value(equity),
      costAverage: costAverage == null && nullToAbsent
          ? const Value.absent()
          : Value(costAverage),
      lastPrice: lastPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPrice),
      lastUpdate: lastUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdate),
    );
  }

  factory PeaEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PeaEntry(
      id: serializer.fromJson<int>(json['id']),
      equity: serializer.fromJson<int?>(json['equity']),
      costAverage: serializer.fromJson<double?>(json['costAverage']),
      lastPrice: serializer.fromJson<double?>(json['lastPrice']),
      lastUpdate: serializer.fromJson<DateTime?>(json['lastUpdate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'equity': serializer.toJson<int?>(equity),
      'costAverage': serializer.toJson<double?>(costAverage),
      'lastPrice': serializer.toJson<double?>(lastPrice),
      'lastUpdate': serializer.toJson<DateTime?>(lastUpdate),
    };
  }

  PeaEntry copyWith({
    int? id,
    Value<int?> equity = const Value.absent(),
    Value<double?> costAverage = const Value.absent(),
    Value<double?> lastPrice = const Value.absent(),
    Value<DateTime?> lastUpdate = const Value.absent(),
  }) => PeaEntry(
    id: id ?? this.id,
    equity: equity.present ? equity.value : this.equity,
    costAverage: costAverage.present ? costAverage.value : this.costAverage,
    lastPrice: lastPrice.present ? lastPrice.value : this.lastPrice,
    lastUpdate: lastUpdate.present ? lastUpdate.value : this.lastUpdate,
  );
  PeaEntry copyWithCompanion(PeaEntriesCompanion data) {
    return PeaEntry(
      id: data.id.present ? data.id.value : this.id,
      equity: data.equity.present ? data.equity.value : this.equity,
      costAverage: data.costAverage.present
          ? data.costAverage.value
          : this.costAverage,
      lastPrice: data.lastPrice.present ? data.lastPrice.value : this.lastPrice,
      lastUpdate: data.lastUpdate.present
          ? data.lastUpdate.value
          : this.lastUpdate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PeaEntry(')
          ..write('id: $id, ')
          ..write('equity: $equity, ')
          ..write('costAverage: $costAverage, ')
          ..write('lastPrice: $lastPrice, ')
          ..write('lastUpdate: $lastUpdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, equity, costAverage, lastPrice, lastUpdate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PeaEntry &&
          other.id == this.id &&
          other.equity == this.equity &&
          other.costAverage == this.costAverage &&
          other.lastPrice == this.lastPrice &&
          other.lastUpdate == this.lastUpdate);
}

class PeaEntriesCompanion extends UpdateCompanion<PeaEntry> {
  final Value<int> id;
  final Value<int?> equity;
  final Value<double?> costAverage;
  final Value<double?> lastPrice;
  final Value<DateTime?> lastUpdate;
  const PeaEntriesCompanion({
    this.id = const Value.absent(),
    this.equity = const Value.absent(),
    this.costAverage = const Value.absent(),
    this.lastPrice = const Value.absent(),
    this.lastUpdate = const Value.absent(),
  });
  PeaEntriesCompanion.insert({
    this.id = const Value.absent(),
    this.equity = const Value.absent(),
    this.costAverage = const Value.absent(),
    this.lastPrice = const Value.absent(),
    this.lastUpdate = const Value.absent(),
  });
  static Insertable<PeaEntry> custom({
    Expression<int>? id,
    Expression<int>? equity,
    Expression<double>? costAverage,
    Expression<double>? lastPrice,
    Expression<DateTime>? lastUpdate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (equity != null) 'equity': equity,
      if (costAverage != null) 'cost_average': costAverage,
      if (lastPrice != null) 'last_price': lastPrice,
      if (lastUpdate != null) 'last_update': lastUpdate,
    });
  }

  PeaEntriesCompanion copyWith({
    Value<int>? id,
    Value<int?>? equity,
    Value<double?>? costAverage,
    Value<double?>? lastPrice,
    Value<DateTime?>? lastUpdate,
  }) {
    return PeaEntriesCompanion(
      id: id ?? this.id,
      equity: equity ?? this.equity,
      costAverage: costAverage ?? this.costAverage,
      lastPrice: lastPrice ?? this.lastPrice,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (equity.present) {
      map['equity'] = Variable<int>(equity.value);
    }
    if (costAverage.present) {
      map['cost_average'] = Variable<double>(costAverage.value);
    }
    if (lastPrice.present) {
      map['last_price'] = Variable<double>(lastPrice.value);
    }
    if (lastUpdate.present) {
      map['last_update'] = Variable<DateTime>(lastUpdate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PeaEntriesCompanion(')
          ..write('id: $id, ')
          ..write('equity: $equity, ')
          ..write('costAverage: $costAverage, ')
          ..write('lastPrice: $lastPrice, ')
          ..write('lastUpdate: $lastUpdate')
          ..write(')'))
        .toString();
  }
}

class $PerEntriesTable extends PerEntries
    with TableInfo<$PerEntriesTable, PerEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PerEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _investedMeta = const VerificationMeta(
    'invested',
  );
  @override
  late final GeneratedColumn<double> invested = GeneratedColumn<double>(
    'invested',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _interestsMeta = const VerificationMeta(
    'interests',
  );
  @override
  late final GeneratedColumn<double> interests = GeneratedColumn<double>(
    'interests',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, invested, interests];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'per_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<PerEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invested')) {
      context.handle(
        _investedMeta,
        invested.isAcceptableOrUnknown(data['invested']!, _investedMeta),
      );
    }
    if (data.containsKey('interests')) {
      context.handle(
        _interestsMeta,
        interests.isAcceptableOrUnknown(data['interests']!, _interestsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PerEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PerEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      invested: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}invested'],
      )!,
      interests: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}interests'],
      )!,
    );
  }

  @override
  $PerEntriesTable createAlias(String alias) {
    return $PerEntriesTable(attachedDatabase, alias);
  }
}

class PerEntry extends DataClass implements Insertable<PerEntry> {
  final int id;
  final double invested;
  final double interests;
  const PerEntry({
    required this.id,
    required this.invested,
    required this.interests,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['invested'] = Variable<double>(invested);
    map['interests'] = Variable<double>(interests);
    return map;
  }

  PerEntriesCompanion toCompanion(bool nullToAbsent) {
    return PerEntriesCompanion(
      id: Value(id),
      invested: Value(invested),
      interests: Value(interests),
    );
  }

  factory PerEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PerEntry(
      id: serializer.fromJson<int>(json['id']),
      invested: serializer.fromJson<double>(json['invested']),
      interests: serializer.fromJson<double>(json['interests']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invested': serializer.toJson<double>(invested),
      'interests': serializer.toJson<double>(interests),
    };
  }

  PerEntry copyWith({int? id, double? invested, double? interests}) => PerEntry(
    id: id ?? this.id,
    invested: invested ?? this.invested,
    interests: interests ?? this.interests,
  );
  PerEntry copyWithCompanion(PerEntriesCompanion data) {
    return PerEntry(
      id: data.id.present ? data.id.value : this.id,
      invested: data.invested.present ? data.invested.value : this.invested,
      interests: data.interests.present ? data.interests.value : this.interests,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PerEntry(')
          ..write('id: $id, ')
          ..write('invested: $invested, ')
          ..write('interests: $interests')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, invested, interests);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PerEntry &&
          other.id == this.id &&
          other.invested == this.invested &&
          other.interests == this.interests);
}

class PerEntriesCompanion extends UpdateCompanion<PerEntry> {
  final Value<int> id;
  final Value<double> invested;
  final Value<double> interests;
  const PerEntriesCompanion({
    this.id = const Value.absent(),
    this.invested = const Value.absent(),
    this.interests = const Value.absent(),
  });
  PerEntriesCompanion.insert({
    this.id = const Value.absent(),
    this.invested = const Value.absent(),
    this.interests = const Value.absent(),
  });
  static Insertable<PerEntry> custom({
    Expression<int>? id,
    Expression<double>? invested,
    Expression<double>? interests,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invested != null) 'invested': invested,
      if (interests != null) 'interests': interests,
    });
  }

  PerEntriesCompanion copyWith({
    Value<int>? id,
    Value<double>? invested,
    Value<double>? interests,
  }) {
    return PerEntriesCompanion(
      id: id ?? this.id,
      invested: invested ?? this.invested,
      interests: interests ?? this.interests,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invested.present) {
      map['invested'] = Variable<double>(invested.value);
    }
    if (interests.present) {
      map['interests'] = Variable<double>(interests.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PerEntriesCompanion(')
          ..write('id: $id, ')
          ..write('invested: $invested, ')
          ..write('interests: $interests')
          ..write(')'))
        .toString();
  }
}

class $LifeInsuranceEntriesTable extends LifeInsuranceEntries
    with TableInfo<$LifeInsuranceEntriesTable, LifeInsuranceEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LifeInsuranceEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _investedMeta = const VerificationMeta(
    'invested',
  );
  @override
  late final GeneratedColumn<double> invested = GeneratedColumn<double>(
    'invested',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _interestsMeta = const VerificationMeta(
    'interests',
  );
  @override
  late final GeneratedColumn<double> interests = GeneratedColumn<double>(
    'interests',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, invested, interests];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'life_insurance_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<LifeInsuranceEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invested')) {
      context.handle(
        _investedMeta,
        invested.isAcceptableOrUnknown(data['invested']!, _investedMeta),
      );
    }
    if (data.containsKey('interests')) {
      context.handle(
        _interestsMeta,
        interests.isAcceptableOrUnknown(data['interests']!, _interestsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LifeInsuranceEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LifeInsuranceEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      invested: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}invested'],
      )!,
      interests: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}interests'],
      )!,
    );
  }

  @override
  $LifeInsuranceEntriesTable createAlias(String alias) {
    return $LifeInsuranceEntriesTable(attachedDatabase, alias);
  }
}

class LifeInsuranceEntry extends DataClass
    implements Insertable<LifeInsuranceEntry> {
  final int id;
  final double invested;
  final double interests;
  const LifeInsuranceEntry({
    required this.id,
    required this.invested,
    required this.interests,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['invested'] = Variable<double>(invested);
    map['interests'] = Variable<double>(interests);
    return map;
  }

  LifeInsuranceEntriesCompanion toCompanion(bool nullToAbsent) {
    return LifeInsuranceEntriesCompanion(
      id: Value(id),
      invested: Value(invested),
      interests: Value(interests),
    );
  }

  factory LifeInsuranceEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LifeInsuranceEntry(
      id: serializer.fromJson<int>(json['id']),
      invested: serializer.fromJson<double>(json['invested']),
      interests: serializer.fromJson<double>(json['interests']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invested': serializer.toJson<double>(invested),
      'interests': serializer.toJson<double>(interests),
    };
  }

  LifeInsuranceEntry copyWith({int? id, double? invested, double? interests}) =>
      LifeInsuranceEntry(
        id: id ?? this.id,
        invested: invested ?? this.invested,
        interests: interests ?? this.interests,
      );
  LifeInsuranceEntry copyWithCompanion(LifeInsuranceEntriesCompanion data) {
    return LifeInsuranceEntry(
      id: data.id.present ? data.id.value : this.id,
      invested: data.invested.present ? data.invested.value : this.invested,
      interests: data.interests.present ? data.interests.value : this.interests,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LifeInsuranceEntry(')
          ..write('id: $id, ')
          ..write('invested: $invested, ')
          ..write('interests: $interests')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, invested, interests);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LifeInsuranceEntry &&
          other.id == this.id &&
          other.invested == this.invested &&
          other.interests == this.interests);
}

class LifeInsuranceEntriesCompanion
    extends UpdateCompanion<LifeInsuranceEntry> {
  final Value<int> id;
  final Value<double> invested;
  final Value<double> interests;
  const LifeInsuranceEntriesCompanion({
    this.id = const Value.absent(),
    this.invested = const Value.absent(),
    this.interests = const Value.absent(),
  });
  LifeInsuranceEntriesCompanion.insert({
    this.id = const Value.absent(),
    this.invested = const Value.absent(),
    this.interests = const Value.absent(),
  });
  static Insertable<LifeInsuranceEntry> custom({
    Expression<int>? id,
    Expression<double>? invested,
    Expression<double>? interests,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invested != null) 'invested': invested,
      if (interests != null) 'interests': interests,
    });
  }

  LifeInsuranceEntriesCompanion copyWith({
    Value<int>? id,
    Value<double>? invested,
    Value<double>? interests,
  }) {
    return LifeInsuranceEntriesCompanion(
      id: id ?? this.id,
      invested: invested ?? this.invested,
      interests: interests ?? this.interests,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invested.present) {
      map['invested'] = Variable<double>(invested.value);
    }
    if (interests.present) {
      map['interests'] = Variable<double>(interests.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LifeInsuranceEntriesCompanion(')
          ..write('id: $id, ')
          ..write('invested: $invested, ')
          ..write('interests: $interests')
          ..write(')'))
        .toString();
  }
}

class $FreelanceEntriesTable extends FreelanceEntries
    with TableInfo<$FreelanceEntriesTable, FreelanceEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FreelanceEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _annualRevenueMeta = const VerificationMeta(
    'annualRevenue',
  );
  @override
  late final GeneratedColumn<double> annualRevenue = GeneratedColumn<double>(
    'annual_revenue',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, annualRevenue];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'freelance_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<FreelanceEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('annual_revenue')) {
      context.handle(
        _annualRevenueMeta,
        annualRevenue.isAcceptableOrUnknown(
          data['annual_revenue']!,
          _annualRevenueMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FreelanceEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FreelanceEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      annualRevenue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}annual_revenue'],
      )!,
    );
  }

  @override
  $FreelanceEntriesTable createAlias(String alias) {
    return $FreelanceEntriesTable(attachedDatabase, alias);
  }
}

class FreelanceEntry extends DataClass implements Insertable<FreelanceEntry> {
  final int id;
  final double annualRevenue;
  const FreelanceEntry({required this.id, required this.annualRevenue});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['annual_revenue'] = Variable<double>(annualRevenue);
    return map;
  }

  FreelanceEntriesCompanion toCompanion(bool nullToAbsent) {
    return FreelanceEntriesCompanion(
      id: Value(id),
      annualRevenue: Value(annualRevenue),
    );
  }

  factory FreelanceEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FreelanceEntry(
      id: serializer.fromJson<int>(json['id']),
      annualRevenue: serializer.fromJson<double>(json['annualRevenue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'annualRevenue': serializer.toJson<double>(annualRevenue),
    };
  }

  FreelanceEntry copyWith({int? id, double? annualRevenue}) => FreelanceEntry(
    id: id ?? this.id,
    annualRevenue: annualRevenue ?? this.annualRevenue,
  );
  FreelanceEntry copyWithCompanion(FreelanceEntriesCompanion data) {
    return FreelanceEntry(
      id: data.id.present ? data.id.value : this.id,
      annualRevenue: data.annualRevenue.present
          ? data.annualRevenue.value
          : this.annualRevenue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FreelanceEntry(')
          ..write('id: $id, ')
          ..write('annualRevenue: $annualRevenue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, annualRevenue);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FreelanceEntry &&
          other.id == this.id &&
          other.annualRevenue == this.annualRevenue);
}

class FreelanceEntriesCompanion extends UpdateCompanion<FreelanceEntry> {
  final Value<int> id;
  final Value<double> annualRevenue;
  const FreelanceEntriesCompanion({
    this.id = const Value.absent(),
    this.annualRevenue = const Value.absent(),
  });
  FreelanceEntriesCompanion.insert({
    this.id = const Value.absent(),
    this.annualRevenue = const Value.absent(),
  });
  static Insertable<FreelanceEntry> custom({
    Expression<int>? id,
    Expression<double>? annualRevenue,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (annualRevenue != null) 'annual_revenue': annualRevenue,
    });
  }

  FreelanceEntriesCompanion copyWith({
    Value<int>? id,
    Value<double>? annualRevenue,
  }) {
    return FreelanceEntriesCompanion(
      id: id ?? this.id,
      annualRevenue: annualRevenue ?? this.annualRevenue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (annualRevenue.present) {
      map['annual_revenue'] = Variable<double>(annualRevenue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FreelanceEntriesCompanion(')
          ..write('id: $id, ')
          ..write('annualRevenue: $annualRevenue')
          ..write(')'))
        .toString();
  }
}

class $BudgetEntriesTable extends BudgetEntries
    with TableInfo<$BudgetEntriesTable, BudgetEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BudgetEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _freelanceIncomeMeta = const VerificationMeta(
    'freelanceIncome',
  );
  @override
  late final GeneratedColumn<double> freelanceIncome = GeneratedColumn<double>(
    'freelance_income',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _rentMeta = const VerificationMeta('rent');
  @override
  late final GeneratedColumn<double> rent = GeneratedColumn<double>(
    'rent',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _electricityMeta = const VerificationMeta(
    'electricity',
  );
  @override
  late final GeneratedColumn<double> electricity = GeneratedColumn<double>(
    'electricity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _gasMeta = const VerificationMeta('gas');
  @override
  late final GeneratedColumn<double> gas = GeneratedColumn<double>(
    'gas',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _waterMeta = const VerificationMeta('water');
  @override
  late final GeneratedColumn<double> water = GeneratedColumn<double>(
    'water',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _internetMeta = const VerificationMeta(
    'internet',
  );
  @override
  late final GeneratedColumn<double> internet = GeneratedColumn<double>(
    'internet',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _homeInsuranceMeta = const VerificationMeta(
    'homeInsurance',
  );
  @override
  late final GeneratedColumn<double> homeInsurance = GeneratedColumn<double>(
    'home_insurance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _publicTransportMeta = const VerificationMeta(
    'publicTransport',
  );
  @override
  late final GeneratedColumn<double> publicTransport = GeneratedColumn<double>(
    'public_transport',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _groceriesMeta = const VerificationMeta(
    'groceries',
  );
  @override
  late final GeneratedColumn<double> groceries = GeneratedColumn<double>(
    'groceries',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _restaurantsMeta = const VerificationMeta(
    'restaurants',
  );
  @override
  late final GeneratedColumn<double> restaurants = GeneratedColumn<double>(
    'restaurants',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _healthInsuranceMeta = const VerificationMeta(
    'healthInsurance',
  );
  @override
  late final GeneratedColumn<double> healthInsurance = GeneratedColumn<double>(
    'health_insurance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<double> phone = GeneratedColumn<double>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _aiMeta = const VerificationMeta('ai');
  @override
  late final GeneratedColumn<double> ai = GeneratedColumn<double>(
    'ai',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    freelanceIncome,
    rent,
    electricity,
    gas,
    water,
    internet,
    homeInsurance,
    publicTransport,
    groceries,
    restaurants,
    healthInsurance,
    phone,
    ai,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'budget_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<BudgetEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('freelance_income')) {
      context.handle(
        _freelanceIncomeMeta,
        freelanceIncome.isAcceptableOrUnknown(
          data['freelance_income']!,
          _freelanceIncomeMeta,
        ),
      );
    }
    if (data.containsKey('rent')) {
      context.handle(
        _rentMeta,
        rent.isAcceptableOrUnknown(data['rent']!, _rentMeta),
      );
    }
    if (data.containsKey('electricity')) {
      context.handle(
        _electricityMeta,
        electricity.isAcceptableOrUnknown(
          data['electricity']!,
          _electricityMeta,
        ),
      );
    }
    if (data.containsKey('gas')) {
      context.handle(
        _gasMeta,
        gas.isAcceptableOrUnknown(data['gas']!, _gasMeta),
      );
    }
    if (data.containsKey('water')) {
      context.handle(
        _waterMeta,
        water.isAcceptableOrUnknown(data['water']!, _waterMeta),
      );
    }
    if (data.containsKey('internet')) {
      context.handle(
        _internetMeta,
        internet.isAcceptableOrUnknown(data['internet']!, _internetMeta),
      );
    }
    if (data.containsKey('home_insurance')) {
      context.handle(
        _homeInsuranceMeta,
        homeInsurance.isAcceptableOrUnknown(
          data['home_insurance']!,
          _homeInsuranceMeta,
        ),
      );
    }
    if (data.containsKey('public_transport')) {
      context.handle(
        _publicTransportMeta,
        publicTransport.isAcceptableOrUnknown(
          data['public_transport']!,
          _publicTransportMeta,
        ),
      );
    }
    if (data.containsKey('groceries')) {
      context.handle(
        _groceriesMeta,
        groceries.isAcceptableOrUnknown(data['groceries']!, _groceriesMeta),
      );
    }
    if (data.containsKey('restaurants')) {
      context.handle(
        _restaurantsMeta,
        restaurants.isAcceptableOrUnknown(
          data['restaurants']!,
          _restaurantsMeta,
        ),
      );
    }
    if (data.containsKey('health_insurance')) {
      context.handle(
        _healthInsuranceMeta,
        healthInsurance.isAcceptableOrUnknown(
          data['health_insurance']!,
          _healthInsuranceMeta,
        ),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('ai')) {
      context.handle(_aiMeta, ai.isAcceptableOrUnknown(data['ai']!, _aiMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BudgetEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BudgetEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      freelanceIncome: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}freelance_income'],
      )!,
      rent: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rent'],
      )!,
      electricity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}electricity'],
      )!,
      gas: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}gas'],
      )!,
      water: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}water'],
      )!,
      internet: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}internet'],
      )!,
      homeInsurance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}home_insurance'],
      )!,
      publicTransport: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}public_transport'],
      )!,
      groceries: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}groceries'],
      )!,
      restaurants: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}restaurants'],
      )!,
      healthInsurance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}health_insurance'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}phone'],
      )!,
      ai: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ai'],
      )!,
    );
  }

  @override
  $BudgetEntriesTable createAlias(String alias) {
    return $BudgetEntriesTable(attachedDatabase, alias);
  }
}

class BudgetEntry extends DataClass implements Insertable<BudgetEntry> {
  final int id;
  final double freelanceIncome;
  final double rent;
  final double electricity;
  final double gas;
  final double water;
  final double internet;
  final double homeInsurance;
  final double publicTransport;
  final double groceries;
  final double restaurants;
  final double healthInsurance;
  final double phone;
  final double ai;
  const BudgetEntry({
    required this.id,
    required this.freelanceIncome,
    required this.rent,
    required this.electricity,
    required this.gas,
    required this.water,
    required this.internet,
    required this.homeInsurance,
    required this.publicTransport,
    required this.groceries,
    required this.restaurants,
    required this.healthInsurance,
    required this.phone,
    required this.ai,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['freelance_income'] = Variable<double>(freelanceIncome);
    map['rent'] = Variable<double>(rent);
    map['electricity'] = Variable<double>(electricity);
    map['gas'] = Variable<double>(gas);
    map['water'] = Variable<double>(water);
    map['internet'] = Variable<double>(internet);
    map['home_insurance'] = Variable<double>(homeInsurance);
    map['public_transport'] = Variable<double>(publicTransport);
    map['groceries'] = Variable<double>(groceries);
    map['restaurants'] = Variable<double>(restaurants);
    map['health_insurance'] = Variable<double>(healthInsurance);
    map['phone'] = Variable<double>(phone);
    map['ai'] = Variable<double>(ai);
    return map;
  }

  BudgetEntriesCompanion toCompanion(bool nullToAbsent) {
    return BudgetEntriesCompanion(
      id: Value(id),
      freelanceIncome: Value(freelanceIncome),
      rent: Value(rent),
      electricity: Value(electricity),
      gas: Value(gas),
      water: Value(water),
      internet: Value(internet),
      homeInsurance: Value(homeInsurance),
      publicTransport: Value(publicTransport),
      groceries: Value(groceries),
      restaurants: Value(restaurants),
      healthInsurance: Value(healthInsurance),
      phone: Value(phone),
      ai: Value(ai),
    );
  }

  factory BudgetEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BudgetEntry(
      id: serializer.fromJson<int>(json['id']),
      freelanceIncome: serializer.fromJson<double>(json['freelanceIncome']),
      rent: serializer.fromJson<double>(json['rent']),
      electricity: serializer.fromJson<double>(json['electricity']),
      gas: serializer.fromJson<double>(json['gas']),
      water: serializer.fromJson<double>(json['water']),
      internet: serializer.fromJson<double>(json['internet']),
      homeInsurance: serializer.fromJson<double>(json['homeInsurance']),
      publicTransport: serializer.fromJson<double>(json['publicTransport']),
      groceries: serializer.fromJson<double>(json['groceries']),
      restaurants: serializer.fromJson<double>(json['restaurants']),
      healthInsurance: serializer.fromJson<double>(json['healthInsurance']),
      phone: serializer.fromJson<double>(json['phone']),
      ai: serializer.fromJson<double>(json['ai']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'freelanceIncome': serializer.toJson<double>(freelanceIncome),
      'rent': serializer.toJson<double>(rent),
      'electricity': serializer.toJson<double>(electricity),
      'gas': serializer.toJson<double>(gas),
      'water': serializer.toJson<double>(water),
      'internet': serializer.toJson<double>(internet),
      'homeInsurance': serializer.toJson<double>(homeInsurance),
      'publicTransport': serializer.toJson<double>(publicTransport),
      'groceries': serializer.toJson<double>(groceries),
      'restaurants': serializer.toJson<double>(restaurants),
      'healthInsurance': serializer.toJson<double>(healthInsurance),
      'phone': serializer.toJson<double>(phone),
      'ai': serializer.toJson<double>(ai),
    };
  }

  BudgetEntry copyWith({
    int? id,
    double? freelanceIncome,
    double? rent,
    double? electricity,
    double? gas,
    double? water,
    double? internet,
    double? homeInsurance,
    double? publicTransport,
    double? groceries,
    double? restaurants,
    double? healthInsurance,
    double? phone,
    double? ai,
  }) => BudgetEntry(
    id: id ?? this.id,
    freelanceIncome: freelanceIncome ?? this.freelanceIncome,
    rent: rent ?? this.rent,
    electricity: electricity ?? this.electricity,
    gas: gas ?? this.gas,
    water: water ?? this.water,
    internet: internet ?? this.internet,
    homeInsurance: homeInsurance ?? this.homeInsurance,
    publicTransport: publicTransport ?? this.publicTransport,
    groceries: groceries ?? this.groceries,
    restaurants: restaurants ?? this.restaurants,
    healthInsurance: healthInsurance ?? this.healthInsurance,
    phone: phone ?? this.phone,
    ai: ai ?? this.ai,
  );
  BudgetEntry copyWithCompanion(BudgetEntriesCompanion data) {
    return BudgetEntry(
      id: data.id.present ? data.id.value : this.id,
      freelanceIncome: data.freelanceIncome.present
          ? data.freelanceIncome.value
          : this.freelanceIncome,
      rent: data.rent.present ? data.rent.value : this.rent,
      electricity: data.electricity.present
          ? data.electricity.value
          : this.electricity,
      gas: data.gas.present ? data.gas.value : this.gas,
      water: data.water.present ? data.water.value : this.water,
      internet: data.internet.present ? data.internet.value : this.internet,
      homeInsurance: data.homeInsurance.present
          ? data.homeInsurance.value
          : this.homeInsurance,
      publicTransport: data.publicTransport.present
          ? data.publicTransport.value
          : this.publicTransport,
      groceries: data.groceries.present ? data.groceries.value : this.groceries,
      restaurants: data.restaurants.present
          ? data.restaurants.value
          : this.restaurants,
      healthInsurance: data.healthInsurance.present
          ? data.healthInsurance.value
          : this.healthInsurance,
      phone: data.phone.present ? data.phone.value : this.phone,
      ai: data.ai.present ? data.ai.value : this.ai,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BudgetEntry(')
          ..write('id: $id, ')
          ..write('freelanceIncome: $freelanceIncome, ')
          ..write('rent: $rent, ')
          ..write('electricity: $electricity, ')
          ..write('gas: $gas, ')
          ..write('water: $water, ')
          ..write('internet: $internet, ')
          ..write('homeInsurance: $homeInsurance, ')
          ..write('publicTransport: $publicTransport, ')
          ..write('groceries: $groceries, ')
          ..write('restaurants: $restaurants, ')
          ..write('healthInsurance: $healthInsurance, ')
          ..write('phone: $phone, ')
          ..write('ai: $ai')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    freelanceIncome,
    rent,
    electricity,
    gas,
    water,
    internet,
    homeInsurance,
    publicTransport,
    groceries,
    restaurants,
    healthInsurance,
    phone,
    ai,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BudgetEntry &&
          other.id == this.id &&
          other.freelanceIncome == this.freelanceIncome &&
          other.rent == this.rent &&
          other.electricity == this.electricity &&
          other.gas == this.gas &&
          other.water == this.water &&
          other.internet == this.internet &&
          other.homeInsurance == this.homeInsurance &&
          other.publicTransport == this.publicTransport &&
          other.groceries == this.groceries &&
          other.restaurants == this.restaurants &&
          other.healthInsurance == this.healthInsurance &&
          other.phone == this.phone &&
          other.ai == this.ai);
}

class BudgetEntriesCompanion extends UpdateCompanion<BudgetEntry> {
  final Value<int> id;
  final Value<double> freelanceIncome;
  final Value<double> rent;
  final Value<double> electricity;
  final Value<double> gas;
  final Value<double> water;
  final Value<double> internet;
  final Value<double> homeInsurance;
  final Value<double> publicTransport;
  final Value<double> groceries;
  final Value<double> restaurants;
  final Value<double> healthInsurance;
  final Value<double> phone;
  final Value<double> ai;
  const BudgetEntriesCompanion({
    this.id = const Value.absent(),
    this.freelanceIncome = const Value.absent(),
    this.rent = const Value.absent(),
    this.electricity = const Value.absent(),
    this.gas = const Value.absent(),
    this.water = const Value.absent(),
    this.internet = const Value.absent(),
    this.homeInsurance = const Value.absent(),
    this.publicTransport = const Value.absent(),
    this.groceries = const Value.absent(),
    this.restaurants = const Value.absent(),
    this.healthInsurance = const Value.absent(),
    this.phone = const Value.absent(),
    this.ai = const Value.absent(),
  });
  BudgetEntriesCompanion.insert({
    this.id = const Value.absent(),
    this.freelanceIncome = const Value.absent(),
    this.rent = const Value.absent(),
    this.electricity = const Value.absent(),
    this.gas = const Value.absent(),
    this.water = const Value.absent(),
    this.internet = const Value.absent(),
    this.homeInsurance = const Value.absent(),
    this.publicTransport = const Value.absent(),
    this.groceries = const Value.absent(),
    this.restaurants = const Value.absent(),
    this.healthInsurance = const Value.absent(),
    this.phone = const Value.absent(),
    this.ai = const Value.absent(),
  });
  static Insertable<BudgetEntry> custom({
    Expression<int>? id,
    Expression<double>? freelanceIncome,
    Expression<double>? rent,
    Expression<double>? electricity,
    Expression<double>? gas,
    Expression<double>? water,
    Expression<double>? internet,
    Expression<double>? homeInsurance,
    Expression<double>? publicTransport,
    Expression<double>? groceries,
    Expression<double>? restaurants,
    Expression<double>? healthInsurance,
    Expression<double>? phone,
    Expression<double>? ai,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (freelanceIncome != null) 'freelance_income': freelanceIncome,
      if (rent != null) 'rent': rent,
      if (electricity != null) 'electricity': electricity,
      if (gas != null) 'gas': gas,
      if (water != null) 'water': water,
      if (internet != null) 'internet': internet,
      if (homeInsurance != null) 'home_insurance': homeInsurance,
      if (publicTransport != null) 'public_transport': publicTransport,
      if (groceries != null) 'groceries': groceries,
      if (restaurants != null) 'restaurants': restaurants,
      if (healthInsurance != null) 'health_insurance': healthInsurance,
      if (phone != null) 'phone': phone,
      if (ai != null) 'ai': ai,
    });
  }

  BudgetEntriesCompanion copyWith({
    Value<int>? id,
    Value<double>? freelanceIncome,
    Value<double>? rent,
    Value<double>? electricity,
    Value<double>? gas,
    Value<double>? water,
    Value<double>? internet,
    Value<double>? homeInsurance,
    Value<double>? publicTransport,
    Value<double>? groceries,
    Value<double>? restaurants,
    Value<double>? healthInsurance,
    Value<double>? phone,
    Value<double>? ai,
  }) {
    return BudgetEntriesCompanion(
      id: id ?? this.id,
      freelanceIncome: freelanceIncome ?? this.freelanceIncome,
      rent: rent ?? this.rent,
      electricity: electricity ?? this.electricity,
      gas: gas ?? this.gas,
      water: water ?? this.water,
      internet: internet ?? this.internet,
      homeInsurance: homeInsurance ?? this.homeInsurance,
      publicTransport: publicTransport ?? this.publicTransport,
      groceries: groceries ?? this.groceries,
      restaurants: restaurants ?? this.restaurants,
      healthInsurance: healthInsurance ?? this.healthInsurance,
      phone: phone ?? this.phone,
      ai: ai ?? this.ai,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (freelanceIncome.present) {
      map['freelance_income'] = Variable<double>(freelanceIncome.value);
    }
    if (rent.present) {
      map['rent'] = Variable<double>(rent.value);
    }
    if (electricity.present) {
      map['electricity'] = Variable<double>(electricity.value);
    }
    if (gas.present) {
      map['gas'] = Variable<double>(gas.value);
    }
    if (water.present) {
      map['water'] = Variable<double>(water.value);
    }
    if (internet.present) {
      map['internet'] = Variable<double>(internet.value);
    }
    if (homeInsurance.present) {
      map['home_insurance'] = Variable<double>(homeInsurance.value);
    }
    if (publicTransport.present) {
      map['public_transport'] = Variable<double>(publicTransport.value);
    }
    if (groceries.present) {
      map['groceries'] = Variable<double>(groceries.value);
    }
    if (restaurants.present) {
      map['restaurants'] = Variable<double>(restaurants.value);
    }
    if (healthInsurance.present) {
      map['health_insurance'] = Variable<double>(healthInsurance.value);
    }
    if (phone.present) {
      map['phone'] = Variable<double>(phone.value);
    }
    if (ai.present) {
      map['ai'] = Variable<double>(ai.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BudgetEntriesCompanion(')
          ..write('id: $id, ')
          ..write('freelanceIncome: $freelanceIncome, ')
          ..write('rent: $rent, ')
          ..write('electricity: $electricity, ')
          ..write('gas: $gas, ')
          ..write('water: $water, ')
          ..write('internet: $internet, ')
          ..write('homeInsurance: $homeInsurance, ')
          ..write('publicTransport: $publicTransport, ')
          ..write('groceries: $groceries, ')
          ..write('restaurants: $restaurants, ')
          ..write('healthInsurance: $healthInsurance, ')
          ..write('phone: $phone, ')
          ..write('ai: $ai')
          ..write(')'))
        .toString();
  }
}

class $CryptocurrencyEntriesTable extends CryptocurrencyEntries
    with TableInfo<$CryptocurrencyEntriesTable, CryptocurrencyEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CryptocurrencyEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalCryptoMeta = const VerificationMeta(
    'totalCrypto',
  );
  @override
  late final GeneratedColumn<double> totalCrypto = GeneratedColumn<double>(
    'total_crypto',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _priceMarketMeta = const VerificationMeta(
    'priceMarket',
  );
  @override
  late final GeneratedColumn<double> priceMarket = GeneratedColumn<double>(
    'price_market',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastUpdateMeta = const VerificationMeta(
    'lastUpdate',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdate = GeneratedColumn<DateTime>(
    'last_update',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    type,
    totalCrypto,
    priceMarket,
    lastUpdate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cryptocurrency_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<CryptocurrencyEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('total_crypto')) {
      context.handle(
        _totalCryptoMeta,
        totalCrypto.isAcceptableOrUnknown(
          data['total_crypto']!,
          _totalCryptoMeta,
        ),
      );
    }
    if (data.containsKey('price_market')) {
      context.handle(
        _priceMarketMeta,
        priceMarket.isAcceptableOrUnknown(
          data['price_market']!,
          _priceMarketMeta,
        ),
      );
    }
    if (data.containsKey('last_update')) {
      context.handle(
        _lastUpdateMeta,
        lastUpdate.isAcceptableOrUnknown(data['last_update']!, _lastUpdateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CryptocurrencyEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CryptocurrencyEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      totalCrypto: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_crypto'],
      )!,
      priceMarket: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price_market'],
      )!,
      lastUpdate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_update'],
      ),
    );
  }

  @override
  $CryptocurrencyEntriesTable createAlias(String alias) {
    return $CryptocurrencyEntriesTable(attachedDatabase, alias);
  }
}

class CryptocurrencyEntry extends DataClass
    implements Insertable<CryptocurrencyEntry> {
  final int id;
  final String type;
  final double totalCrypto;
  final double priceMarket;
  final DateTime? lastUpdate;
  const CryptocurrencyEntry({
    required this.id,
    required this.type,
    required this.totalCrypto,
    required this.priceMarket,
    this.lastUpdate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type'] = Variable<String>(type);
    map['total_crypto'] = Variable<double>(totalCrypto);
    map['price_market'] = Variable<double>(priceMarket);
    if (!nullToAbsent || lastUpdate != null) {
      map['last_update'] = Variable<DateTime>(lastUpdate);
    }
    return map;
  }

  CryptocurrencyEntriesCompanion toCompanion(bool nullToAbsent) {
    return CryptocurrencyEntriesCompanion(
      id: Value(id),
      type: Value(type),
      totalCrypto: Value(totalCrypto),
      priceMarket: Value(priceMarket),
      lastUpdate: lastUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdate),
    );
  }

  factory CryptocurrencyEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CryptocurrencyEntry(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      totalCrypto: serializer.fromJson<double>(json['totalCrypto']),
      priceMarket: serializer.fromJson<double>(json['priceMarket']),
      lastUpdate: serializer.fromJson<DateTime?>(json['lastUpdate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
      'totalCrypto': serializer.toJson<double>(totalCrypto),
      'priceMarket': serializer.toJson<double>(priceMarket),
      'lastUpdate': serializer.toJson<DateTime?>(lastUpdate),
    };
  }

  CryptocurrencyEntry copyWith({
    int? id,
    String? type,
    double? totalCrypto,
    double? priceMarket,
    Value<DateTime?> lastUpdate = const Value.absent(),
  }) => CryptocurrencyEntry(
    id: id ?? this.id,
    type: type ?? this.type,
    totalCrypto: totalCrypto ?? this.totalCrypto,
    priceMarket: priceMarket ?? this.priceMarket,
    lastUpdate: lastUpdate.present ? lastUpdate.value : this.lastUpdate,
  );
  CryptocurrencyEntry copyWithCompanion(CryptocurrencyEntriesCompanion data) {
    return CryptocurrencyEntry(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      totalCrypto: data.totalCrypto.present
          ? data.totalCrypto.value
          : this.totalCrypto,
      priceMarket: data.priceMarket.present
          ? data.priceMarket.value
          : this.priceMarket,
      lastUpdate: data.lastUpdate.present
          ? data.lastUpdate.value
          : this.lastUpdate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CryptocurrencyEntry(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('totalCrypto: $totalCrypto, ')
          ..write('priceMarket: $priceMarket, ')
          ..write('lastUpdate: $lastUpdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, type, totalCrypto, priceMarket, lastUpdate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CryptocurrencyEntry &&
          other.id == this.id &&
          other.type == this.type &&
          other.totalCrypto == this.totalCrypto &&
          other.priceMarket == this.priceMarket &&
          other.lastUpdate == this.lastUpdate);
}

class CryptocurrencyEntriesCompanion
    extends UpdateCompanion<CryptocurrencyEntry> {
  final Value<int> id;
  final Value<String> type;
  final Value<double> totalCrypto;
  final Value<double> priceMarket;
  final Value<DateTime?> lastUpdate;
  const CryptocurrencyEntriesCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.totalCrypto = const Value.absent(),
    this.priceMarket = const Value.absent(),
    this.lastUpdate = const Value.absent(),
  });
  CryptocurrencyEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String type,
    this.totalCrypto = const Value.absent(),
    this.priceMarket = const Value.absent(),
    this.lastUpdate = const Value.absent(),
  }) : type = Value(type);
  static Insertable<CryptocurrencyEntry> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<double>? totalCrypto,
    Expression<double>? priceMarket,
    Expression<DateTime>? lastUpdate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (totalCrypto != null) 'total_crypto': totalCrypto,
      if (priceMarket != null) 'price_market': priceMarket,
      if (lastUpdate != null) 'last_update': lastUpdate,
    });
  }

  CryptocurrencyEntriesCompanion copyWith({
    Value<int>? id,
    Value<String>? type,
    Value<double>? totalCrypto,
    Value<double>? priceMarket,
    Value<DateTime?>? lastUpdate,
  }) {
    return CryptocurrencyEntriesCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      totalCrypto: totalCrypto ?? this.totalCrypto,
      priceMarket: priceMarket ?? this.priceMarket,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (totalCrypto.present) {
      map['total_crypto'] = Variable<double>(totalCrypto.value);
    }
    if (priceMarket.present) {
      map['price_market'] = Variable<double>(priceMarket.value);
    }
    if (lastUpdate.present) {
      map['last_update'] = Variable<DateTime>(lastUpdate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CryptocurrencyEntriesCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('totalCrypto: $totalCrypto, ')
          ..write('priceMarket: $priceMarket, ')
          ..write('lastUpdate: $lastUpdate')
          ..write(')'))
        .toString();
  }
}

class $CryptocurrencyTransactionEntriesTable
    extends CryptocurrencyTransactionEntries
    with
        TableInfo<
          $CryptocurrencyTransactionEntriesTable,
          CryptocurrencyTransactionEntry
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CryptocurrencyTransactionEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _cryptocurrencyIdMeta = const VerificationMeta(
    'cryptocurrencyId',
  );
  @override
  late final GeneratedColumn<int> cryptocurrencyId = GeneratedColumn<int>(
    'cryptocurrency_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cryptocurrency_entries (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, cryptocurrencyId, date, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cryptocurrency_transaction_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<CryptocurrencyTransactionEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cryptocurrency_id')) {
      context.handle(
        _cryptocurrencyIdMeta,
        cryptocurrencyId.isAcceptableOrUnknown(
          data['cryptocurrency_id']!,
          _cryptocurrencyIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cryptocurrencyIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CryptocurrencyTransactionEntry map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CryptocurrencyTransactionEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      cryptocurrencyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cryptocurrency_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
    );
  }

  @override
  $CryptocurrencyTransactionEntriesTable createAlias(String alias) {
    return $CryptocurrencyTransactionEntriesTable(attachedDatabase, alias);
  }
}

class CryptocurrencyTransactionEntry extends DataClass
    implements Insertable<CryptocurrencyTransactionEntry> {
  final int id;
  final int cryptocurrencyId;
  final DateTime date;
  final double amount;
  const CryptocurrencyTransactionEntry({
    required this.id,
    required this.cryptocurrencyId,
    required this.date,
    required this.amount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cryptocurrency_id'] = Variable<int>(cryptocurrencyId);
    map['date'] = Variable<DateTime>(date);
    map['amount'] = Variable<double>(amount);
    return map;
  }

  CryptocurrencyTransactionEntriesCompanion toCompanion(bool nullToAbsent) {
    return CryptocurrencyTransactionEntriesCompanion(
      id: Value(id),
      cryptocurrencyId: Value(cryptocurrencyId),
      date: Value(date),
      amount: Value(amount),
    );
  }

  factory CryptocurrencyTransactionEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CryptocurrencyTransactionEntry(
      id: serializer.fromJson<int>(json['id']),
      cryptocurrencyId: serializer.fromJson<int>(json['cryptocurrencyId']),
      date: serializer.fromJson<DateTime>(json['date']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cryptocurrencyId': serializer.toJson<int>(cryptocurrencyId),
      'date': serializer.toJson<DateTime>(date),
      'amount': serializer.toJson<double>(amount),
    };
  }

  CryptocurrencyTransactionEntry copyWith({
    int? id,
    int? cryptocurrencyId,
    DateTime? date,
    double? amount,
  }) => CryptocurrencyTransactionEntry(
    id: id ?? this.id,
    cryptocurrencyId: cryptocurrencyId ?? this.cryptocurrencyId,
    date: date ?? this.date,
    amount: amount ?? this.amount,
  );
  CryptocurrencyTransactionEntry copyWithCompanion(
    CryptocurrencyTransactionEntriesCompanion data,
  ) {
    return CryptocurrencyTransactionEntry(
      id: data.id.present ? data.id.value : this.id,
      cryptocurrencyId: data.cryptocurrencyId.present
          ? data.cryptocurrencyId.value
          : this.cryptocurrencyId,
      date: data.date.present ? data.date.value : this.date,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CryptocurrencyTransactionEntry(')
          ..write('id: $id, ')
          ..write('cryptocurrencyId: $cryptocurrencyId, ')
          ..write('date: $date, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, cryptocurrencyId, date, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CryptocurrencyTransactionEntry &&
          other.id == this.id &&
          other.cryptocurrencyId == this.cryptocurrencyId &&
          other.date == this.date &&
          other.amount == this.amount);
}

class CryptocurrencyTransactionEntriesCompanion
    extends UpdateCompanion<CryptocurrencyTransactionEntry> {
  final Value<int> id;
  final Value<int> cryptocurrencyId;
  final Value<DateTime> date;
  final Value<double> amount;
  const CryptocurrencyTransactionEntriesCompanion({
    this.id = const Value.absent(),
    this.cryptocurrencyId = const Value.absent(),
    this.date = const Value.absent(),
    this.amount = const Value.absent(),
  });
  CryptocurrencyTransactionEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int cryptocurrencyId,
    required DateTime date,
    required double amount,
  }) : cryptocurrencyId = Value(cryptocurrencyId),
       date = Value(date),
       amount = Value(amount);
  static Insertable<CryptocurrencyTransactionEntry> custom({
    Expression<int>? id,
    Expression<int>? cryptocurrencyId,
    Expression<DateTime>? date,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cryptocurrencyId != null) 'cryptocurrency_id': cryptocurrencyId,
      if (date != null) 'date': date,
      if (amount != null) 'amount': amount,
    });
  }

  CryptocurrencyTransactionEntriesCompanion copyWith({
    Value<int>? id,
    Value<int>? cryptocurrencyId,
    Value<DateTime>? date,
    Value<double>? amount,
  }) {
    return CryptocurrencyTransactionEntriesCompanion(
      id: id ?? this.id,
      cryptocurrencyId: cryptocurrencyId ?? this.cryptocurrencyId,
      date: date ?? this.date,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cryptocurrencyId.present) {
      map['cryptocurrency_id'] = Variable<int>(cryptocurrencyId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CryptocurrencyTransactionEntriesCompanion(')
          ..write('id: $id, ')
          ..write('cryptocurrencyId: $cryptocurrencyId, ')
          ..write('date: $date, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

class $ReitEntriesTable extends ReitEntries
    with TableInfo<$ReitEntriesTable, ReitEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReitEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _boughtOnMeta = const VerificationMeta(
    'boughtOn',
  );
  @override
  late final GeneratedColumn<DateTime> boughtOn = GeneratedColumn<DateTime>(
    'bought_on',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sharesMeta = const VerificationMeta('shares');
  @override
  late final GeneratedColumn<int> shares = GeneratedColumn<int>(
    'shares',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, boughtOn, shares, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reit_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReitEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('bought_on')) {
      context.handle(
        _boughtOnMeta,
        boughtOn.isAcceptableOrUnknown(data['bought_on']!, _boughtOnMeta),
      );
    } else if (isInserting) {
      context.missing(_boughtOnMeta);
    }
    if (data.containsKey('shares')) {
      context.handle(
        _sharesMeta,
        shares.isAcceptableOrUnknown(data['shares']!, _sharesMeta),
      );
    } else if (isInserting) {
      context.missing(_sharesMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReitEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReitEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      boughtOn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}bought_on'],
      )!,
      shares: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shares'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
    );
  }

  @override
  $ReitEntriesTable createAlias(String alias) {
    return $ReitEntriesTable(attachedDatabase, alias);
  }
}

class ReitEntry extends DataClass implements Insertable<ReitEntry> {
  final int id;
  final String name;
  final DateTime boughtOn;
  final int shares;
  final double price;
  const ReitEntry({
    required this.id,
    required this.name,
    required this.boughtOn,
    required this.shares,
    required this.price,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['bought_on'] = Variable<DateTime>(boughtOn);
    map['shares'] = Variable<int>(shares);
    map['price'] = Variable<double>(price);
    return map;
  }

  ReitEntriesCompanion toCompanion(bool nullToAbsent) {
    return ReitEntriesCompanion(
      id: Value(id),
      name: Value(name),
      boughtOn: Value(boughtOn),
      shares: Value(shares),
      price: Value(price),
    );
  }

  factory ReitEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReitEntry(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      boughtOn: serializer.fromJson<DateTime>(json['boughtOn']),
      shares: serializer.fromJson<int>(json['shares']),
      price: serializer.fromJson<double>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'boughtOn': serializer.toJson<DateTime>(boughtOn),
      'shares': serializer.toJson<int>(shares),
      'price': serializer.toJson<double>(price),
    };
  }

  ReitEntry copyWith({
    int? id,
    String? name,
    DateTime? boughtOn,
    int? shares,
    double? price,
  }) => ReitEntry(
    id: id ?? this.id,
    name: name ?? this.name,
    boughtOn: boughtOn ?? this.boughtOn,
    shares: shares ?? this.shares,
    price: price ?? this.price,
  );
  ReitEntry copyWithCompanion(ReitEntriesCompanion data) {
    return ReitEntry(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      boughtOn: data.boughtOn.present ? data.boughtOn.value : this.boughtOn,
      shares: data.shares.present ? data.shares.value : this.shares,
      price: data.price.present ? data.price.value : this.price,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReitEntry(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('boughtOn: $boughtOn, ')
          ..write('shares: $shares, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, boughtOn, shares, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReitEntry &&
          other.id == this.id &&
          other.name == this.name &&
          other.boughtOn == this.boughtOn &&
          other.shares == this.shares &&
          other.price == this.price);
}

class ReitEntriesCompanion extends UpdateCompanion<ReitEntry> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> boughtOn;
  final Value<int> shares;
  final Value<double> price;
  const ReitEntriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.boughtOn = const Value.absent(),
    this.shares = const Value.absent(),
    this.price = const Value.absent(),
  });
  ReitEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required DateTime boughtOn,
    required int shares,
    required double price,
  }) : name = Value(name),
       boughtOn = Value(boughtOn),
       shares = Value(shares),
       price = Value(price);
  static Insertable<ReitEntry> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? boughtOn,
    Expression<int>? shares,
    Expression<double>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (boughtOn != null) 'bought_on': boughtOn,
      if (shares != null) 'shares': shares,
      if (price != null) 'price': price,
    });
  }

  ReitEntriesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime>? boughtOn,
    Value<int>? shares,
    Value<double>? price,
  }) {
    return ReitEntriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      boughtOn: boughtOn ?? this.boughtOn,
      shares: shares ?? this.shares,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (boughtOn.present) {
      map['bought_on'] = Variable<DateTime>(boughtOn.value);
    }
    if (shares.present) {
      map['shares'] = Variable<int>(shares.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReitEntriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('boughtOn: $boughtOn, ')
          ..write('shares: $shares, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $ReitDividendEntriesTable extends ReitDividendEntries
    with TableInfo<$ReitDividendEntriesTable, ReitDividendEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReitDividendEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _reitIdMeta = const VerificationMeta('reitId');
  @override
  late final GeneratedColumn<int> reitId = GeneratedColumn<int>(
    'reit_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES reit_entries (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _receivedAtMeta = const VerificationMeta(
    'receivedAt',
  );
  @override
  late final GeneratedColumn<DateTime> receivedAt = GeneratedColumn<DateTime>(
    'received_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, reitId, receivedAt, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reit_dividend_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReitDividendEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('reit_id')) {
      context.handle(
        _reitIdMeta,
        reitId.isAcceptableOrUnknown(data['reit_id']!, _reitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_reitIdMeta);
    }
    if (data.containsKey('received_at')) {
      context.handle(
        _receivedAtMeta,
        receivedAt.isAcceptableOrUnknown(data['received_at']!, _receivedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_receivedAtMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReitDividendEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReitDividendEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      reitId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reit_id'],
      )!,
      receivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}received_at'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
    );
  }

  @override
  $ReitDividendEntriesTable createAlias(String alias) {
    return $ReitDividendEntriesTable(attachedDatabase, alias);
  }
}

class ReitDividendEntry extends DataClass
    implements Insertable<ReitDividendEntry> {
  final int id;
  final int reitId;
  final DateTime receivedAt;
  final double amount;
  const ReitDividendEntry({
    required this.id,
    required this.reitId,
    required this.receivedAt,
    required this.amount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['reit_id'] = Variable<int>(reitId);
    map['received_at'] = Variable<DateTime>(receivedAt);
    map['amount'] = Variable<double>(amount);
    return map;
  }

  ReitDividendEntriesCompanion toCompanion(bool nullToAbsent) {
    return ReitDividendEntriesCompanion(
      id: Value(id),
      reitId: Value(reitId),
      receivedAt: Value(receivedAt),
      amount: Value(amount),
    );
  }

  factory ReitDividendEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReitDividendEntry(
      id: serializer.fromJson<int>(json['id']),
      reitId: serializer.fromJson<int>(json['reitId']),
      receivedAt: serializer.fromJson<DateTime>(json['receivedAt']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'reitId': serializer.toJson<int>(reitId),
      'receivedAt': serializer.toJson<DateTime>(receivedAt),
      'amount': serializer.toJson<double>(amount),
    };
  }

  ReitDividendEntry copyWith({
    int? id,
    int? reitId,
    DateTime? receivedAt,
    double? amount,
  }) => ReitDividendEntry(
    id: id ?? this.id,
    reitId: reitId ?? this.reitId,
    receivedAt: receivedAt ?? this.receivedAt,
    amount: amount ?? this.amount,
  );
  ReitDividendEntry copyWithCompanion(ReitDividendEntriesCompanion data) {
    return ReitDividendEntry(
      id: data.id.present ? data.id.value : this.id,
      reitId: data.reitId.present ? data.reitId.value : this.reitId,
      receivedAt: data.receivedAt.present
          ? data.receivedAt.value
          : this.receivedAt,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReitDividendEntry(')
          ..write('id: $id, ')
          ..write('reitId: $reitId, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, reitId, receivedAt, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReitDividendEntry &&
          other.id == this.id &&
          other.reitId == this.reitId &&
          other.receivedAt == this.receivedAt &&
          other.amount == this.amount);
}

class ReitDividendEntriesCompanion extends UpdateCompanion<ReitDividendEntry> {
  final Value<int> id;
  final Value<int> reitId;
  final Value<DateTime> receivedAt;
  final Value<double> amount;
  const ReitDividendEntriesCompanion({
    this.id = const Value.absent(),
    this.reitId = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.amount = const Value.absent(),
  });
  ReitDividendEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int reitId,
    required DateTime receivedAt,
    required double amount,
  }) : reitId = Value(reitId),
       receivedAt = Value(receivedAt),
       amount = Value(amount);
  static Insertable<ReitDividendEntry> custom({
    Expression<int>? id,
    Expression<int>? reitId,
    Expression<DateTime>? receivedAt,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reitId != null) 'reit_id': reitId,
      if (receivedAt != null) 'received_at': receivedAt,
      if (amount != null) 'amount': amount,
    });
  }

  ReitDividendEntriesCompanion copyWith({
    Value<int>? id,
    Value<int>? reitId,
    Value<DateTime>? receivedAt,
    Value<double>? amount,
  }) {
    return ReitDividendEntriesCompanion(
      id: id ?? this.id,
      reitId: reitId ?? this.reitId,
      receivedAt: receivedAt ?? this.receivedAt,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (reitId.present) {
      map['reit_id'] = Variable<int>(reitId.value);
    }
    if (receivedAt.present) {
      map['received_at'] = Variable<DateTime>(receivedAt.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReitDividendEntriesCompanion(')
          ..write('id: $id, ')
          ..write('reitId: $reitId, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SavingsEntriesTable savingsEntries = $SavingsEntriesTable(this);
  late final $CashEntriesTable cashEntries = $CashEntriesTable(this);
  late final $CrowdfundingEntriesTable crowdfundingEntries =
      $CrowdfundingEntriesTable(this);
  late final $SavingsBookEntriesTable savingsBookEntries =
      $SavingsBookEntriesTable(this);
  late final $CounterStrikeEntriesTable counterStrikeEntries =
      $CounterStrikeEntriesTable(this);
  late final $PeaEntriesTable peaEntries = $PeaEntriesTable(this);
  late final $PerEntriesTable perEntries = $PerEntriesTable(this);
  late final $LifeInsuranceEntriesTable lifeInsuranceEntries =
      $LifeInsuranceEntriesTable(this);
  late final $FreelanceEntriesTable freelanceEntries = $FreelanceEntriesTable(
    this,
  );
  late final $BudgetEntriesTable budgetEntries = $BudgetEntriesTable(this);
  late final $CryptocurrencyEntriesTable cryptocurrencyEntries =
      $CryptocurrencyEntriesTable(this);
  late final $CryptocurrencyTransactionEntriesTable
  cryptocurrencyTransactionEntries = $CryptocurrencyTransactionEntriesTable(
    this,
  );
  late final $ReitEntriesTable reitEntries = $ReitEntriesTable(this);
  late final $ReitDividendEntriesTable reitDividendEntries =
      $ReitDividendEntriesTable(this);
  late final Index cryptocurrencyTransactionCryptoDate = Index(
    'cryptocurrency_transaction_crypto_date',
    'CREATE INDEX cryptocurrency_transaction_crypto_date ON cryptocurrency_transaction_entries (cryptocurrency_id, date)',
  );
  late final Index reitDividendReit = Index(
    'reit_dividend_reit',
    'CREATE INDEX reit_dividend_reit ON reit_dividend_entries (reit_id)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    savingsEntries,
    cashEntries,
    crowdfundingEntries,
    savingsBookEntries,
    counterStrikeEntries,
    peaEntries,
    perEntries,
    lifeInsuranceEntries,
    freelanceEntries,
    budgetEntries,
    cryptocurrencyEntries,
    cryptocurrencyTransactionEntries,
    reitEntries,
    reitDividendEntries,
    cryptocurrencyTransactionCryptoDate,
    reitDividendReit,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cryptocurrency_entries',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate(
          'cryptocurrency_transaction_entries',
          kind: UpdateKind.delete,
        ),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'reit_entries',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('reit_dividend_entries', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$SavingsEntriesTableCreateCompanionBuilder =
    SavingsEntriesCompanion Function({
      Value<int> id,
      required String type,
      Value<double?> startAmount,
    });
typedef $$SavingsEntriesTableUpdateCompanionBuilder =
    SavingsEntriesCompanion Function({
      Value<int> id,
      Value<String> type,
      Value<double?> startAmount,
    });

class $$SavingsEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $SavingsEntriesTable> {
  $$SavingsEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get startAmount => $composableBuilder(
    column: $table.startAmount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SavingsEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $SavingsEntriesTable> {
  $$SavingsEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get startAmount => $composableBuilder(
    column: $table.startAmount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SavingsEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SavingsEntriesTable> {
  $$SavingsEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get startAmount => $composableBuilder(
    column: $table.startAmount,
    builder: (column) => column,
  );
}

class $$SavingsEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SavingsEntriesTable,
          SavingsEntry,
          $$SavingsEntriesTableFilterComposer,
          $$SavingsEntriesTableOrderingComposer,
          $$SavingsEntriesTableAnnotationComposer,
          $$SavingsEntriesTableCreateCompanionBuilder,
          $$SavingsEntriesTableUpdateCompanionBuilder,
          (
            SavingsEntry,
            BaseReferences<_$AppDatabase, $SavingsEntriesTable, SavingsEntry>,
          ),
          SavingsEntry,
          PrefetchHooks Function()
        > {
  $$SavingsEntriesTableTableManager(
    _$AppDatabase db,
    $SavingsEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavingsEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SavingsEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SavingsEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<double?> startAmount = const Value.absent(),
              }) => SavingsEntriesCompanion(
                id: id,
                type: type,
                startAmount: startAmount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String type,
                Value<double?> startAmount = const Value.absent(),
              }) => SavingsEntriesCompanion.insert(
                id: id,
                type: type,
                startAmount: startAmount,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SavingsEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SavingsEntriesTable,
      SavingsEntry,
      $$SavingsEntriesTableFilterComposer,
      $$SavingsEntriesTableOrderingComposer,
      $$SavingsEntriesTableAnnotationComposer,
      $$SavingsEntriesTableCreateCompanionBuilder,
      $$SavingsEntriesTableUpdateCompanionBuilder,
      (
        SavingsEntry,
        BaseReferences<_$AppDatabase, $SavingsEntriesTable, SavingsEntry>,
      ),
      SavingsEntry,
      PrefetchHooks Function()
    >;
typedef $$CashEntriesTableCreateCompanionBuilder =
    CashEntriesCompanion Function({
      Value<int> id,
      required String label,
      required double value,
    });
typedef $$CashEntriesTableUpdateCompanionBuilder =
    CashEntriesCompanion Function({
      Value<int> id,
      Value<String> label,
      Value<double> value,
    });

class $$CashEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $CashEntriesTable> {
  $$CashEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CashEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CashEntriesTable> {
  $$CashEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CashEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CashEntriesTable> {
  $$CashEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$CashEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CashEntriesTable,
          CashEntry,
          $$CashEntriesTableFilterComposer,
          $$CashEntriesTableOrderingComposer,
          $$CashEntriesTableAnnotationComposer,
          $$CashEntriesTableCreateCompanionBuilder,
          $$CashEntriesTableUpdateCompanionBuilder,
          (
            CashEntry,
            BaseReferences<_$AppDatabase, $CashEntriesTable, CashEntry>,
          ),
          CashEntry,
          PrefetchHooks Function()
        > {
  $$CashEntriesTableTableManager(_$AppDatabase db, $CashEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CashEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CashEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CashEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<double> value = const Value.absent(),
              }) => CashEntriesCompanion(id: id, label: label, value: value),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String label,
                required double value,
              }) => CashEntriesCompanion.insert(
                id: id,
                label: label,
                value: value,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CashEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CashEntriesTable,
      CashEntry,
      $$CashEntriesTableFilterComposer,
      $$CashEntriesTableOrderingComposer,
      $$CashEntriesTableAnnotationComposer,
      $$CashEntriesTableCreateCompanionBuilder,
      $$CashEntriesTableUpdateCompanionBuilder,
      (CashEntry, BaseReferences<_$AppDatabase, $CashEntriesTable, CashEntry>),
      CashEntry,
      PrefetchHooks Function()
    >;
typedef $$CrowdfundingEntriesTableCreateCompanionBuilder =
    CrowdfundingEntriesCompanion Function({
      Value<int> id,
      required double brutProfit,
      required String platformName,
      Value<double?> netProfit,
      Value<double?> taxProfit,
      Value<double?> taxPercentage,
      required DateTime receivedAt,
    });
typedef $$CrowdfundingEntriesTableUpdateCompanionBuilder =
    CrowdfundingEntriesCompanion Function({
      Value<int> id,
      Value<double> brutProfit,
      Value<String> platformName,
      Value<double?> netProfit,
      Value<double?> taxProfit,
      Value<double?> taxPercentage,
      Value<DateTime> receivedAt,
    });

class $$CrowdfundingEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $CrowdfundingEntriesTable> {
  $$CrowdfundingEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get brutProfit => $composableBuilder(
    column: $table.brutProfit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get platformName => $composableBuilder(
    column: $table.platformName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get netProfit => $composableBuilder(
    column: $table.netProfit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get taxProfit => $composableBuilder(
    column: $table.taxProfit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get taxPercentage => $composableBuilder(
    column: $table.taxPercentage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CrowdfundingEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CrowdfundingEntriesTable> {
  $$CrowdfundingEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get brutProfit => $composableBuilder(
    column: $table.brutProfit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get platformName => $composableBuilder(
    column: $table.platformName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get netProfit => $composableBuilder(
    column: $table.netProfit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get taxProfit => $composableBuilder(
    column: $table.taxProfit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get taxPercentage => $composableBuilder(
    column: $table.taxPercentage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CrowdfundingEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CrowdfundingEntriesTable> {
  $$CrowdfundingEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get brutProfit => $composableBuilder(
    column: $table.brutProfit,
    builder: (column) => column,
  );

  GeneratedColumn<String> get platformName => $composableBuilder(
    column: $table.platformName,
    builder: (column) => column,
  );

  GeneratedColumn<double> get netProfit =>
      $composableBuilder(column: $table.netProfit, builder: (column) => column);

  GeneratedColumn<double> get taxProfit =>
      $composableBuilder(column: $table.taxProfit, builder: (column) => column);

  GeneratedColumn<double> get taxPercentage => $composableBuilder(
    column: $table.taxPercentage,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => column,
  );
}

class $$CrowdfundingEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CrowdfundingEntriesTable,
          CrowdfundingEntry,
          $$CrowdfundingEntriesTableFilterComposer,
          $$CrowdfundingEntriesTableOrderingComposer,
          $$CrowdfundingEntriesTableAnnotationComposer,
          $$CrowdfundingEntriesTableCreateCompanionBuilder,
          $$CrowdfundingEntriesTableUpdateCompanionBuilder,
          (
            CrowdfundingEntry,
            BaseReferences<
              _$AppDatabase,
              $CrowdfundingEntriesTable,
              CrowdfundingEntry
            >,
          ),
          CrowdfundingEntry,
          PrefetchHooks Function()
        > {
  $$CrowdfundingEntriesTableTableManager(
    _$AppDatabase db,
    $CrowdfundingEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CrowdfundingEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CrowdfundingEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CrowdfundingEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> brutProfit = const Value.absent(),
                Value<String> platformName = const Value.absent(),
                Value<double?> netProfit = const Value.absent(),
                Value<double?> taxProfit = const Value.absent(),
                Value<double?> taxPercentage = const Value.absent(),
                Value<DateTime> receivedAt = const Value.absent(),
              }) => CrowdfundingEntriesCompanion(
                id: id,
                brutProfit: brutProfit,
                platformName: platformName,
                netProfit: netProfit,
                taxProfit: taxProfit,
                taxPercentage: taxPercentage,
                receivedAt: receivedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double brutProfit,
                required String platformName,
                Value<double?> netProfit = const Value.absent(),
                Value<double?> taxProfit = const Value.absent(),
                Value<double?> taxPercentage = const Value.absent(),
                required DateTime receivedAt,
              }) => CrowdfundingEntriesCompanion.insert(
                id: id,
                brutProfit: brutProfit,
                platformName: platformName,
                netProfit: netProfit,
                taxProfit: taxProfit,
                taxPercentage: taxPercentage,
                receivedAt: receivedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CrowdfundingEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CrowdfundingEntriesTable,
      CrowdfundingEntry,
      $$CrowdfundingEntriesTableFilterComposer,
      $$CrowdfundingEntriesTableOrderingComposer,
      $$CrowdfundingEntriesTableAnnotationComposer,
      $$CrowdfundingEntriesTableCreateCompanionBuilder,
      $$CrowdfundingEntriesTableUpdateCompanionBuilder,
      (
        CrowdfundingEntry,
        BaseReferences<
          _$AppDatabase,
          $CrowdfundingEntriesTable,
          CrowdfundingEntry
        >,
      ),
      CrowdfundingEntry,
      PrefetchHooks Function()
    >;
typedef $$SavingsBookEntriesTableCreateCompanionBuilder =
    SavingsBookEntriesCompanion Function({
      Value<int> id,
      required String name,
      Value<double> startAmount,
      Value<double> withdrawal,
      Value<double> interests,
    });
typedef $$SavingsBookEntriesTableUpdateCompanionBuilder =
    SavingsBookEntriesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<double> startAmount,
      Value<double> withdrawal,
      Value<double> interests,
    });

class $$SavingsBookEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $SavingsBookEntriesTable> {
  $$SavingsBookEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get startAmount => $composableBuilder(
    column: $table.startAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get withdrawal => $composableBuilder(
    column: $table.withdrawal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get interests => $composableBuilder(
    column: $table.interests,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SavingsBookEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $SavingsBookEntriesTable> {
  $$SavingsBookEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get startAmount => $composableBuilder(
    column: $table.startAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get withdrawal => $composableBuilder(
    column: $table.withdrawal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get interests => $composableBuilder(
    column: $table.interests,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SavingsBookEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SavingsBookEntriesTable> {
  $$SavingsBookEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get startAmount => $composableBuilder(
    column: $table.startAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get withdrawal => $composableBuilder(
    column: $table.withdrawal,
    builder: (column) => column,
  );

  GeneratedColumn<double> get interests =>
      $composableBuilder(column: $table.interests, builder: (column) => column);
}

class $$SavingsBookEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SavingsBookEntriesTable,
          SavingsBookEntry,
          $$SavingsBookEntriesTableFilterComposer,
          $$SavingsBookEntriesTableOrderingComposer,
          $$SavingsBookEntriesTableAnnotationComposer,
          $$SavingsBookEntriesTableCreateCompanionBuilder,
          $$SavingsBookEntriesTableUpdateCompanionBuilder,
          (
            SavingsBookEntry,
            BaseReferences<
              _$AppDatabase,
              $SavingsBookEntriesTable,
              SavingsBookEntry
            >,
          ),
          SavingsBookEntry,
          PrefetchHooks Function()
        > {
  $$SavingsBookEntriesTableTableManager(
    _$AppDatabase db,
    $SavingsBookEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavingsBookEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SavingsBookEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SavingsBookEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> startAmount = const Value.absent(),
                Value<double> withdrawal = const Value.absent(),
                Value<double> interests = const Value.absent(),
              }) => SavingsBookEntriesCompanion(
                id: id,
                name: name,
                startAmount: startAmount,
                withdrawal: withdrawal,
                interests: interests,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<double> startAmount = const Value.absent(),
                Value<double> withdrawal = const Value.absent(),
                Value<double> interests = const Value.absent(),
              }) => SavingsBookEntriesCompanion.insert(
                id: id,
                name: name,
                startAmount: startAmount,
                withdrawal: withdrawal,
                interests: interests,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SavingsBookEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SavingsBookEntriesTable,
      SavingsBookEntry,
      $$SavingsBookEntriesTableFilterComposer,
      $$SavingsBookEntriesTableOrderingComposer,
      $$SavingsBookEntriesTableAnnotationComposer,
      $$SavingsBookEntriesTableCreateCompanionBuilder,
      $$SavingsBookEntriesTableUpdateCompanionBuilder,
      (
        SavingsBookEntry,
        BaseReferences<
          _$AppDatabase,
          $SavingsBookEntriesTable,
          SavingsBookEntry
        >,
      ),
      SavingsBookEntry,
      PrefetchHooks Function()
    >;
typedef $$CounterStrikeEntriesTableCreateCompanionBuilder =
    CounterStrikeEntriesCompanion Function({
      Value<int> id,
      required DateTime boughtAt,
      required DateTime lastUpdate,
      required String imageId,
      required double purchaseValue,
      required double currentValue,
      required int quantity,
      Value<double?> wear,
    });
typedef $$CounterStrikeEntriesTableUpdateCompanionBuilder =
    CounterStrikeEntriesCompanion Function({
      Value<int> id,
      Value<DateTime> boughtAt,
      Value<DateTime> lastUpdate,
      Value<String> imageId,
      Value<double> purchaseValue,
      Value<double> currentValue,
      Value<int> quantity,
      Value<double?> wear,
    });

class $$CounterStrikeEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $CounterStrikeEntriesTable> {
  $$CounterStrikeEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get boughtAt => $composableBuilder(
    column: $table.boughtAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdate => $composableBuilder(
    column: $table.lastUpdate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageId => $composableBuilder(
    column: $table.imageId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get purchaseValue => $composableBuilder(
    column: $table.purchaseValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get currentValue => $composableBuilder(
    column: $table.currentValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get wear => $composableBuilder(
    column: $table.wear,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CounterStrikeEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CounterStrikeEntriesTable> {
  $$CounterStrikeEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get boughtAt => $composableBuilder(
    column: $table.boughtAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdate => $composableBuilder(
    column: $table.lastUpdate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageId => $composableBuilder(
    column: $table.imageId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get purchaseValue => $composableBuilder(
    column: $table.purchaseValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get currentValue => $composableBuilder(
    column: $table.currentValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get wear => $composableBuilder(
    column: $table.wear,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CounterStrikeEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CounterStrikeEntriesTable> {
  $$CounterStrikeEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get boughtAt =>
      $composableBuilder(column: $table.boughtAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdate => $composableBuilder(
    column: $table.lastUpdate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageId =>
      $composableBuilder(column: $table.imageId, builder: (column) => column);

  GeneratedColumn<double> get purchaseValue => $composableBuilder(
    column: $table.purchaseValue,
    builder: (column) => column,
  );

  GeneratedColumn<double> get currentValue => $composableBuilder(
    column: $table.currentValue,
    builder: (column) => column,
  );

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get wear =>
      $composableBuilder(column: $table.wear, builder: (column) => column);
}

class $$CounterStrikeEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CounterStrikeEntriesTable,
          CounterStrikeEntry,
          $$CounterStrikeEntriesTableFilterComposer,
          $$CounterStrikeEntriesTableOrderingComposer,
          $$CounterStrikeEntriesTableAnnotationComposer,
          $$CounterStrikeEntriesTableCreateCompanionBuilder,
          $$CounterStrikeEntriesTableUpdateCompanionBuilder,
          (
            CounterStrikeEntry,
            BaseReferences<
              _$AppDatabase,
              $CounterStrikeEntriesTable,
              CounterStrikeEntry
            >,
          ),
          CounterStrikeEntry,
          PrefetchHooks Function()
        > {
  $$CounterStrikeEntriesTableTableManager(
    _$AppDatabase db,
    $CounterStrikeEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CounterStrikeEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CounterStrikeEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CounterStrikeEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> boughtAt = const Value.absent(),
                Value<DateTime> lastUpdate = const Value.absent(),
                Value<String> imageId = const Value.absent(),
                Value<double> purchaseValue = const Value.absent(),
                Value<double> currentValue = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<double?> wear = const Value.absent(),
              }) => CounterStrikeEntriesCompanion(
                id: id,
                boughtAt: boughtAt,
                lastUpdate: lastUpdate,
                imageId: imageId,
                purchaseValue: purchaseValue,
                currentValue: currentValue,
                quantity: quantity,
                wear: wear,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime boughtAt,
                required DateTime lastUpdate,
                required String imageId,
                required double purchaseValue,
                required double currentValue,
                required int quantity,
                Value<double?> wear = const Value.absent(),
              }) => CounterStrikeEntriesCompanion.insert(
                id: id,
                boughtAt: boughtAt,
                lastUpdate: lastUpdate,
                imageId: imageId,
                purchaseValue: purchaseValue,
                currentValue: currentValue,
                quantity: quantity,
                wear: wear,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CounterStrikeEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CounterStrikeEntriesTable,
      CounterStrikeEntry,
      $$CounterStrikeEntriesTableFilterComposer,
      $$CounterStrikeEntriesTableOrderingComposer,
      $$CounterStrikeEntriesTableAnnotationComposer,
      $$CounterStrikeEntriesTableCreateCompanionBuilder,
      $$CounterStrikeEntriesTableUpdateCompanionBuilder,
      (
        CounterStrikeEntry,
        BaseReferences<
          _$AppDatabase,
          $CounterStrikeEntriesTable,
          CounterStrikeEntry
        >,
      ),
      CounterStrikeEntry,
      PrefetchHooks Function()
    >;
typedef $$PeaEntriesTableCreateCompanionBuilder =
    PeaEntriesCompanion Function({
      Value<int> id,
      Value<int?> equity,
      Value<double?> costAverage,
      Value<double?> lastPrice,
      Value<DateTime?> lastUpdate,
    });
typedef $$PeaEntriesTableUpdateCompanionBuilder =
    PeaEntriesCompanion Function({
      Value<int> id,
      Value<int?> equity,
      Value<double?> costAverage,
      Value<double?> lastPrice,
      Value<DateTime?> lastUpdate,
    });

class $$PeaEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $PeaEntriesTable> {
  $$PeaEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get equity => $composableBuilder(
    column: $table.equity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get costAverage => $composableBuilder(
    column: $table.costAverage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lastPrice => $composableBuilder(
    column: $table.lastPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdate => $composableBuilder(
    column: $table.lastUpdate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PeaEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $PeaEntriesTable> {
  $$PeaEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get equity => $composableBuilder(
    column: $table.equity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get costAverage => $composableBuilder(
    column: $table.costAverage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lastPrice => $composableBuilder(
    column: $table.lastPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdate => $composableBuilder(
    column: $table.lastUpdate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PeaEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PeaEntriesTable> {
  $$PeaEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get equity =>
      $composableBuilder(column: $table.equity, builder: (column) => column);

  GeneratedColumn<double> get costAverage => $composableBuilder(
    column: $table.costAverage,
    builder: (column) => column,
  );

  GeneratedColumn<double> get lastPrice =>
      $composableBuilder(column: $table.lastPrice, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdate => $composableBuilder(
    column: $table.lastUpdate,
    builder: (column) => column,
  );
}

class $$PeaEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PeaEntriesTable,
          PeaEntry,
          $$PeaEntriesTableFilterComposer,
          $$PeaEntriesTableOrderingComposer,
          $$PeaEntriesTableAnnotationComposer,
          $$PeaEntriesTableCreateCompanionBuilder,
          $$PeaEntriesTableUpdateCompanionBuilder,
          (PeaEntry, BaseReferences<_$AppDatabase, $PeaEntriesTable, PeaEntry>),
          PeaEntry,
          PrefetchHooks Function()
        > {
  $$PeaEntriesTableTableManager(_$AppDatabase db, $PeaEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PeaEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PeaEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PeaEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> equity = const Value.absent(),
                Value<double?> costAverage = const Value.absent(),
                Value<double?> lastPrice = const Value.absent(),
                Value<DateTime?> lastUpdate = const Value.absent(),
              }) => PeaEntriesCompanion(
                id: id,
                equity: equity,
                costAverage: costAverage,
                lastPrice: lastPrice,
                lastUpdate: lastUpdate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> equity = const Value.absent(),
                Value<double?> costAverage = const Value.absent(),
                Value<double?> lastPrice = const Value.absent(),
                Value<DateTime?> lastUpdate = const Value.absent(),
              }) => PeaEntriesCompanion.insert(
                id: id,
                equity: equity,
                costAverage: costAverage,
                lastPrice: lastPrice,
                lastUpdate: lastUpdate,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PeaEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PeaEntriesTable,
      PeaEntry,
      $$PeaEntriesTableFilterComposer,
      $$PeaEntriesTableOrderingComposer,
      $$PeaEntriesTableAnnotationComposer,
      $$PeaEntriesTableCreateCompanionBuilder,
      $$PeaEntriesTableUpdateCompanionBuilder,
      (PeaEntry, BaseReferences<_$AppDatabase, $PeaEntriesTable, PeaEntry>),
      PeaEntry,
      PrefetchHooks Function()
    >;
typedef $$PerEntriesTableCreateCompanionBuilder =
    PerEntriesCompanion Function({
      Value<int> id,
      Value<double> invested,
      Value<double> interests,
    });
typedef $$PerEntriesTableUpdateCompanionBuilder =
    PerEntriesCompanion Function({
      Value<int> id,
      Value<double> invested,
      Value<double> interests,
    });

class $$PerEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $PerEntriesTable> {
  $$PerEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get invested => $composableBuilder(
    column: $table.invested,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get interests => $composableBuilder(
    column: $table.interests,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PerEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $PerEntriesTable> {
  $$PerEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get invested => $composableBuilder(
    column: $table.invested,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get interests => $composableBuilder(
    column: $table.interests,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PerEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PerEntriesTable> {
  $$PerEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get invested =>
      $composableBuilder(column: $table.invested, builder: (column) => column);

  GeneratedColumn<double> get interests =>
      $composableBuilder(column: $table.interests, builder: (column) => column);
}

class $$PerEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PerEntriesTable,
          PerEntry,
          $$PerEntriesTableFilterComposer,
          $$PerEntriesTableOrderingComposer,
          $$PerEntriesTableAnnotationComposer,
          $$PerEntriesTableCreateCompanionBuilder,
          $$PerEntriesTableUpdateCompanionBuilder,
          (PerEntry, BaseReferences<_$AppDatabase, $PerEntriesTable, PerEntry>),
          PerEntry,
          PrefetchHooks Function()
        > {
  $$PerEntriesTableTableManager(_$AppDatabase db, $PerEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PerEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PerEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PerEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> invested = const Value.absent(),
                Value<double> interests = const Value.absent(),
              }) => PerEntriesCompanion(
                id: id,
                invested: invested,
                interests: interests,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> invested = const Value.absent(),
                Value<double> interests = const Value.absent(),
              }) => PerEntriesCompanion.insert(
                id: id,
                invested: invested,
                interests: interests,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PerEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PerEntriesTable,
      PerEntry,
      $$PerEntriesTableFilterComposer,
      $$PerEntriesTableOrderingComposer,
      $$PerEntriesTableAnnotationComposer,
      $$PerEntriesTableCreateCompanionBuilder,
      $$PerEntriesTableUpdateCompanionBuilder,
      (PerEntry, BaseReferences<_$AppDatabase, $PerEntriesTable, PerEntry>),
      PerEntry,
      PrefetchHooks Function()
    >;
typedef $$LifeInsuranceEntriesTableCreateCompanionBuilder =
    LifeInsuranceEntriesCompanion Function({
      Value<int> id,
      Value<double> invested,
      Value<double> interests,
    });
typedef $$LifeInsuranceEntriesTableUpdateCompanionBuilder =
    LifeInsuranceEntriesCompanion Function({
      Value<int> id,
      Value<double> invested,
      Value<double> interests,
    });

class $$LifeInsuranceEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $LifeInsuranceEntriesTable> {
  $$LifeInsuranceEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get invested => $composableBuilder(
    column: $table.invested,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get interests => $composableBuilder(
    column: $table.interests,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LifeInsuranceEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $LifeInsuranceEntriesTable> {
  $$LifeInsuranceEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get invested => $composableBuilder(
    column: $table.invested,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get interests => $composableBuilder(
    column: $table.interests,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LifeInsuranceEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LifeInsuranceEntriesTable> {
  $$LifeInsuranceEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get invested =>
      $composableBuilder(column: $table.invested, builder: (column) => column);

  GeneratedColumn<double> get interests =>
      $composableBuilder(column: $table.interests, builder: (column) => column);
}

class $$LifeInsuranceEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LifeInsuranceEntriesTable,
          LifeInsuranceEntry,
          $$LifeInsuranceEntriesTableFilterComposer,
          $$LifeInsuranceEntriesTableOrderingComposer,
          $$LifeInsuranceEntriesTableAnnotationComposer,
          $$LifeInsuranceEntriesTableCreateCompanionBuilder,
          $$LifeInsuranceEntriesTableUpdateCompanionBuilder,
          (
            LifeInsuranceEntry,
            BaseReferences<
              _$AppDatabase,
              $LifeInsuranceEntriesTable,
              LifeInsuranceEntry
            >,
          ),
          LifeInsuranceEntry,
          PrefetchHooks Function()
        > {
  $$LifeInsuranceEntriesTableTableManager(
    _$AppDatabase db,
    $LifeInsuranceEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LifeInsuranceEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LifeInsuranceEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LifeInsuranceEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> invested = const Value.absent(),
                Value<double> interests = const Value.absent(),
              }) => LifeInsuranceEntriesCompanion(
                id: id,
                invested: invested,
                interests: interests,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> invested = const Value.absent(),
                Value<double> interests = const Value.absent(),
              }) => LifeInsuranceEntriesCompanion.insert(
                id: id,
                invested: invested,
                interests: interests,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LifeInsuranceEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LifeInsuranceEntriesTable,
      LifeInsuranceEntry,
      $$LifeInsuranceEntriesTableFilterComposer,
      $$LifeInsuranceEntriesTableOrderingComposer,
      $$LifeInsuranceEntriesTableAnnotationComposer,
      $$LifeInsuranceEntriesTableCreateCompanionBuilder,
      $$LifeInsuranceEntriesTableUpdateCompanionBuilder,
      (
        LifeInsuranceEntry,
        BaseReferences<
          _$AppDatabase,
          $LifeInsuranceEntriesTable,
          LifeInsuranceEntry
        >,
      ),
      LifeInsuranceEntry,
      PrefetchHooks Function()
    >;
typedef $$FreelanceEntriesTableCreateCompanionBuilder =
    FreelanceEntriesCompanion Function({
      Value<int> id,
      Value<double> annualRevenue,
    });
typedef $$FreelanceEntriesTableUpdateCompanionBuilder =
    FreelanceEntriesCompanion Function({
      Value<int> id,
      Value<double> annualRevenue,
    });

class $$FreelanceEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $FreelanceEntriesTable> {
  $$FreelanceEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get annualRevenue => $composableBuilder(
    column: $table.annualRevenue,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FreelanceEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $FreelanceEntriesTable> {
  $$FreelanceEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get annualRevenue => $composableBuilder(
    column: $table.annualRevenue,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FreelanceEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FreelanceEntriesTable> {
  $$FreelanceEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get annualRevenue => $composableBuilder(
    column: $table.annualRevenue,
    builder: (column) => column,
  );
}

class $$FreelanceEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FreelanceEntriesTable,
          FreelanceEntry,
          $$FreelanceEntriesTableFilterComposer,
          $$FreelanceEntriesTableOrderingComposer,
          $$FreelanceEntriesTableAnnotationComposer,
          $$FreelanceEntriesTableCreateCompanionBuilder,
          $$FreelanceEntriesTableUpdateCompanionBuilder,
          (
            FreelanceEntry,
            BaseReferences<
              _$AppDatabase,
              $FreelanceEntriesTable,
              FreelanceEntry
            >,
          ),
          FreelanceEntry,
          PrefetchHooks Function()
        > {
  $$FreelanceEntriesTableTableManager(
    _$AppDatabase db,
    $FreelanceEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FreelanceEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FreelanceEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FreelanceEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> annualRevenue = const Value.absent(),
              }) => FreelanceEntriesCompanion(
                id: id,
                annualRevenue: annualRevenue,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> annualRevenue = const Value.absent(),
              }) => FreelanceEntriesCompanion.insert(
                id: id,
                annualRevenue: annualRevenue,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FreelanceEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FreelanceEntriesTable,
      FreelanceEntry,
      $$FreelanceEntriesTableFilterComposer,
      $$FreelanceEntriesTableOrderingComposer,
      $$FreelanceEntriesTableAnnotationComposer,
      $$FreelanceEntriesTableCreateCompanionBuilder,
      $$FreelanceEntriesTableUpdateCompanionBuilder,
      (
        FreelanceEntry,
        BaseReferences<_$AppDatabase, $FreelanceEntriesTable, FreelanceEntry>,
      ),
      FreelanceEntry,
      PrefetchHooks Function()
    >;
typedef $$BudgetEntriesTableCreateCompanionBuilder =
    BudgetEntriesCompanion Function({
      Value<int> id,
      Value<double> freelanceIncome,
      Value<double> rent,
      Value<double> electricity,
      Value<double> gas,
      Value<double> water,
      Value<double> internet,
      Value<double> homeInsurance,
      Value<double> publicTransport,
      Value<double> groceries,
      Value<double> restaurants,
      Value<double> healthInsurance,
      Value<double> phone,
      Value<double> ai,
    });
typedef $$BudgetEntriesTableUpdateCompanionBuilder =
    BudgetEntriesCompanion Function({
      Value<int> id,
      Value<double> freelanceIncome,
      Value<double> rent,
      Value<double> electricity,
      Value<double> gas,
      Value<double> water,
      Value<double> internet,
      Value<double> homeInsurance,
      Value<double> publicTransport,
      Value<double> groceries,
      Value<double> restaurants,
      Value<double> healthInsurance,
      Value<double> phone,
      Value<double> ai,
    });

class $$BudgetEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $BudgetEntriesTable> {
  $$BudgetEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get freelanceIncome => $composableBuilder(
    column: $table.freelanceIncome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rent => $composableBuilder(
    column: $table.rent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get electricity => $composableBuilder(
    column: $table.electricity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get gas => $composableBuilder(
    column: $table.gas,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get water => $composableBuilder(
    column: $table.water,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get internet => $composableBuilder(
    column: $table.internet,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get homeInsurance => $composableBuilder(
    column: $table.homeInsurance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get publicTransport => $composableBuilder(
    column: $table.publicTransport,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get groceries => $composableBuilder(
    column: $table.groceries,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get restaurants => $composableBuilder(
    column: $table.restaurants,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get healthInsurance => $composableBuilder(
    column: $table.healthInsurance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ai => $composableBuilder(
    column: $table.ai,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BudgetEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $BudgetEntriesTable> {
  $$BudgetEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get freelanceIncome => $composableBuilder(
    column: $table.freelanceIncome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rent => $composableBuilder(
    column: $table.rent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get electricity => $composableBuilder(
    column: $table.electricity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get gas => $composableBuilder(
    column: $table.gas,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get water => $composableBuilder(
    column: $table.water,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get internet => $composableBuilder(
    column: $table.internet,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get homeInsurance => $composableBuilder(
    column: $table.homeInsurance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get publicTransport => $composableBuilder(
    column: $table.publicTransport,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get groceries => $composableBuilder(
    column: $table.groceries,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get restaurants => $composableBuilder(
    column: $table.restaurants,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get healthInsurance => $composableBuilder(
    column: $table.healthInsurance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ai => $composableBuilder(
    column: $table.ai,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BudgetEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BudgetEntriesTable> {
  $$BudgetEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get freelanceIncome => $composableBuilder(
    column: $table.freelanceIncome,
    builder: (column) => column,
  );

  GeneratedColumn<double> get rent =>
      $composableBuilder(column: $table.rent, builder: (column) => column);

  GeneratedColumn<double> get electricity => $composableBuilder(
    column: $table.electricity,
    builder: (column) => column,
  );

  GeneratedColumn<double> get gas =>
      $composableBuilder(column: $table.gas, builder: (column) => column);

  GeneratedColumn<double> get water =>
      $composableBuilder(column: $table.water, builder: (column) => column);

  GeneratedColumn<double> get internet =>
      $composableBuilder(column: $table.internet, builder: (column) => column);

  GeneratedColumn<double> get homeInsurance => $composableBuilder(
    column: $table.homeInsurance,
    builder: (column) => column,
  );

  GeneratedColumn<double> get publicTransport => $composableBuilder(
    column: $table.publicTransport,
    builder: (column) => column,
  );

  GeneratedColumn<double> get groceries =>
      $composableBuilder(column: $table.groceries, builder: (column) => column);

  GeneratedColumn<double> get restaurants => $composableBuilder(
    column: $table.restaurants,
    builder: (column) => column,
  );

  GeneratedColumn<double> get healthInsurance => $composableBuilder(
    column: $table.healthInsurance,
    builder: (column) => column,
  );

  GeneratedColumn<double> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<double> get ai =>
      $composableBuilder(column: $table.ai, builder: (column) => column);
}

class $$BudgetEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BudgetEntriesTable,
          BudgetEntry,
          $$BudgetEntriesTableFilterComposer,
          $$BudgetEntriesTableOrderingComposer,
          $$BudgetEntriesTableAnnotationComposer,
          $$BudgetEntriesTableCreateCompanionBuilder,
          $$BudgetEntriesTableUpdateCompanionBuilder,
          (
            BudgetEntry,
            BaseReferences<_$AppDatabase, $BudgetEntriesTable, BudgetEntry>,
          ),
          BudgetEntry,
          PrefetchHooks Function()
        > {
  $$BudgetEntriesTableTableManager(_$AppDatabase db, $BudgetEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BudgetEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BudgetEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BudgetEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> freelanceIncome = const Value.absent(),
                Value<double> rent = const Value.absent(),
                Value<double> electricity = const Value.absent(),
                Value<double> gas = const Value.absent(),
                Value<double> water = const Value.absent(),
                Value<double> internet = const Value.absent(),
                Value<double> homeInsurance = const Value.absent(),
                Value<double> publicTransport = const Value.absent(),
                Value<double> groceries = const Value.absent(),
                Value<double> restaurants = const Value.absent(),
                Value<double> healthInsurance = const Value.absent(),
                Value<double> phone = const Value.absent(),
                Value<double> ai = const Value.absent(),
              }) => BudgetEntriesCompanion(
                id: id,
                freelanceIncome: freelanceIncome,
                rent: rent,
                electricity: electricity,
                gas: gas,
                water: water,
                internet: internet,
                homeInsurance: homeInsurance,
                publicTransport: publicTransport,
                groceries: groceries,
                restaurants: restaurants,
                healthInsurance: healthInsurance,
                phone: phone,
                ai: ai,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> freelanceIncome = const Value.absent(),
                Value<double> rent = const Value.absent(),
                Value<double> electricity = const Value.absent(),
                Value<double> gas = const Value.absent(),
                Value<double> water = const Value.absent(),
                Value<double> internet = const Value.absent(),
                Value<double> homeInsurance = const Value.absent(),
                Value<double> publicTransport = const Value.absent(),
                Value<double> groceries = const Value.absent(),
                Value<double> restaurants = const Value.absent(),
                Value<double> healthInsurance = const Value.absent(),
                Value<double> phone = const Value.absent(),
                Value<double> ai = const Value.absent(),
              }) => BudgetEntriesCompanion.insert(
                id: id,
                freelanceIncome: freelanceIncome,
                rent: rent,
                electricity: electricity,
                gas: gas,
                water: water,
                internet: internet,
                homeInsurance: homeInsurance,
                publicTransport: publicTransport,
                groceries: groceries,
                restaurants: restaurants,
                healthInsurance: healthInsurance,
                phone: phone,
                ai: ai,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BudgetEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BudgetEntriesTable,
      BudgetEntry,
      $$BudgetEntriesTableFilterComposer,
      $$BudgetEntriesTableOrderingComposer,
      $$BudgetEntriesTableAnnotationComposer,
      $$BudgetEntriesTableCreateCompanionBuilder,
      $$BudgetEntriesTableUpdateCompanionBuilder,
      (
        BudgetEntry,
        BaseReferences<_$AppDatabase, $BudgetEntriesTable, BudgetEntry>,
      ),
      BudgetEntry,
      PrefetchHooks Function()
    >;
typedef $$CryptocurrencyEntriesTableCreateCompanionBuilder =
    CryptocurrencyEntriesCompanion Function({
      Value<int> id,
      required String type,
      Value<double> totalCrypto,
      Value<double> priceMarket,
      Value<DateTime?> lastUpdate,
    });
typedef $$CryptocurrencyEntriesTableUpdateCompanionBuilder =
    CryptocurrencyEntriesCompanion Function({
      Value<int> id,
      Value<String> type,
      Value<double> totalCrypto,
      Value<double> priceMarket,
      Value<DateTime?> lastUpdate,
    });

final class $$CryptocurrencyEntriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CryptocurrencyEntriesTable,
          CryptocurrencyEntry
        > {
  $$CryptocurrencyEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $CryptocurrencyTransactionEntriesTable,
    List<CryptocurrencyTransactionEntry>
  >
  _cryptocurrencyTransactionEntriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.cryptocurrencyTransactionEntries,
        aliasName: $_aliasNameGenerator(
          db.cryptocurrencyEntries.id,
          db.cryptocurrencyTransactionEntries.cryptocurrencyId,
        ),
      );

  $$CryptocurrencyTransactionEntriesTableProcessedTableManager
  get cryptocurrencyTransactionEntriesRefs {
    final manager = $$CryptocurrencyTransactionEntriesTableTableManager(
      $_db,
      $_db.cryptocurrencyTransactionEntries,
    ).filter((f) => f.cryptocurrencyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _cryptocurrencyTransactionEntriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CryptocurrencyEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $CryptocurrencyEntriesTable> {
  $$CryptocurrencyEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalCrypto => $composableBuilder(
    column: $table.totalCrypto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get priceMarket => $composableBuilder(
    column: $table.priceMarket,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdate => $composableBuilder(
    column: $table.lastUpdate,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> cryptocurrencyTransactionEntriesRefs(
    Expression<bool> Function(
      $$CryptocurrencyTransactionEntriesTableFilterComposer f,
    )
    f,
  ) {
    final $$CryptocurrencyTransactionEntriesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.cryptocurrencyTransactionEntries,
          getReferencedColumn: (t) => t.cryptocurrencyId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CryptocurrencyTransactionEntriesTableFilterComposer(
                $db: $db,
                $table: $db.cryptocurrencyTransactionEntries,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CryptocurrencyEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CryptocurrencyEntriesTable> {
  $$CryptocurrencyEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalCrypto => $composableBuilder(
    column: $table.totalCrypto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get priceMarket => $composableBuilder(
    column: $table.priceMarket,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdate => $composableBuilder(
    column: $table.lastUpdate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CryptocurrencyEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CryptocurrencyEntriesTable> {
  $$CryptocurrencyEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get totalCrypto => $composableBuilder(
    column: $table.totalCrypto,
    builder: (column) => column,
  );

  GeneratedColumn<double> get priceMarket => $composableBuilder(
    column: $table.priceMarket,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastUpdate => $composableBuilder(
    column: $table.lastUpdate,
    builder: (column) => column,
  );

  Expression<T> cryptocurrencyTransactionEntriesRefs<T extends Object>(
    Expression<T> Function(
      $$CryptocurrencyTransactionEntriesTableAnnotationComposer a,
    )
    f,
  ) {
    final $$CryptocurrencyTransactionEntriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.cryptocurrencyTransactionEntries,
          getReferencedColumn: (t) => t.cryptocurrencyId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CryptocurrencyTransactionEntriesTableAnnotationComposer(
                $db: $db,
                $table: $db.cryptocurrencyTransactionEntries,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CryptocurrencyEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CryptocurrencyEntriesTable,
          CryptocurrencyEntry,
          $$CryptocurrencyEntriesTableFilterComposer,
          $$CryptocurrencyEntriesTableOrderingComposer,
          $$CryptocurrencyEntriesTableAnnotationComposer,
          $$CryptocurrencyEntriesTableCreateCompanionBuilder,
          $$CryptocurrencyEntriesTableUpdateCompanionBuilder,
          (CryptocurrencyEntry, $$CryptocurrencyEntriesTableReferences),
          CryptocurrencyEntry,
          PrefetchHooks Function({bool cryptocurrencyTransactionEntriesRefs})
        > {
  $$CryptocurrencyEntriesTableTableManager(
    _$AppDatabase db,
    $CryptocurrencyEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CryptocurrencyEntriesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CryptocurrencyEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CryptocurrencyEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<double> totalCrypto = const Value.absent(),
                Value<double> priceMarket = const Value.absent(),
                Value<DateTime?> lastUpdate = const Value.absent(),
              }) => CryptocurrencyEntriesCompanion(
                id: id,
                type: type,
                totalCrypto: totalCrypto,
                priceMarket: priceMarket,
                lastUpdate: lastUpdate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String type,
                Value<double> totalCrypto = const Value.absent(),
                Value<double> priceMarket = const Value.absent(),
                Value<DateTime?> lastUpdate = const Value.absent(),
              }) => CryptocurrencyEntriesCompanion.insert(
                id: id,
                type: type,
                totalCrypto: totalCrypto,
                priceMarket: priceMarket,
                lastUpdate: lastUpdate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CryptocurrencyEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({cryptocurrencyTransactionEntriesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (cryptocurrencyTransactionEntriesRefs)
                      db.cryptocurrencyTransactionEntries,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (cryptocurrencyTransactionEntriesRefs)
                        await $_getPrefetchedData<
                          CryptocurrencyEntry,
                          $CryptocurrencyEntriesTable,
                          CryptocurrencyTransactionEntry
                        >(
                          currentTable: table,
                          referencedTable:
                              $$CryptocurrencyEntriesTableReferences
                                  ._cryptocurrencyTransactionEntriesRefsTable(
                                    db,
                                  ),
                          managerFromTypedResult: (p0) =>
                              $$CryptocurrencyEntriesTableReferences(
                                db,
                                table,
                                p0,
                              ).cryptocurrencyTransactionEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.cryptocurrencyId == item.id,
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

typedef $$CryptocurrencyEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CryptocurrencyEntriesTable,
      CryptocurrencyEntry,
      $$CryptocurrencyEntriesTableFilterComposer,
      $$CryptocurrencyEntriesTableOrderingComposer,
      $$CryptocurrencyEntriesTableAnnotationComposer,
      $$CryptocurrencyEntriesTableCreateCompanionBuilder,
      $$CryptocurrencyEntriesTableUpdateCompanionBuilder,
      (CryptocurrencyEntry, $$CryptocurrencyEntriesTableReferences),
      CryptocurrencyEntry,
      PrefetchHooks Function({bool cryptocurrencyTransactionEntriesRefs})
    >;
typedef $$CryptocurrencyTransactionEntriesTableCreateCompanionBuilder =
    CryptocurrencyTransactionEntriesCompanion Function({
      Value<int> id,
      required int cryptocurrencyId,
      required DateTime date,
      required double amount,
    });
typedef $$CryptocurrencyTransactionEntriesTableUpdateCompanionBuilder =
    CryptocurrencyTransactionEntriesCompanion Function({
      Value<int> id,
      Value<int> cryptocurrencyId,
      Value<DateTime> date,
      Value<double> amount,
    });

final class $$CryptocurrencyTransactionEntriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CryptocurrencyTransactionEntriesTable,
          CryptocurrencyTransactionEntry
        > {
  $$CryptocurrencyTransactionEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CryptocurrencyEntriesTable _cryptocurrencyIdTable(_$AppDatabase db) =>
      db.cryptocurrencyEntries.createAlias(
        $_aliasNameGenerator(
          db.cryptocurrencyTransactionEntries.cryptocurrencyId,
          db.cryptocurrencyEntries.id,
        ),
      );

  $$CryptocurrencyEntriesTableProcessedTableManager get cryptocurrencyId {
    final $_column = $_itemColumn<int>('cryptocurrency_id')!;

    final manager = $$CryptocurrencyEntriesTableTableManager(
      $_db,
      $_db.cryptocurrencyEntries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cryptocurrencyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CryptocurrencyTransactionEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $CryptocurrencyTransactionEntriesTable> {
  $$CryptocurrencyTransactionEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  $$CryptocurrencyEntriesTableFilterComposer get cryptocurrencyId {
    final $$CryptocurrencyEntriesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.cryptocurrencyId,
          referencedTable: $db.cryptocurrencyEntries,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CryptocurrencyEntriesTableFilterComposer(
                $db: $db,
                $table: $db.cryptocurrencyEntries,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$CryptocurrencyTransactionEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CryptocurrencyTransactionEntriesTable> {
  $$CryptocurrencyTransactionEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  $$CryptocurrencyEntriesTableOrderingComposer get cryptocurrencyId {
    final $$CryptocurrencyEntriesTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.cryptocurrencyId,
          referencedTable: $db.cryptocurrencyEntries,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CryptocurrencyEntriesTableOrderingComposer(
                $db: $db,
                $table: $db.cryptocurrencyEntries,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$CryptocurrencyTransactionEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CryptocurrencyTransactionEntriesTable> {
  $$CryptocurrencyTransactionEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  $$CryptocurrencyEntriesTableAnnotationComposer get cryptocurrencyId {
    final $$CryptocurrencyEntriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.cryptocurrencyId,
          referencedTable: $db.cryptocurrencyEntries,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CryptocurrencyEntriesTableAnnotationComposer(
                $db: $db,
                $table: $db.cryptocurrencyEntries,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$CryptocurrencyTransactionEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CryptocurrencyTransactionEntriesTable,
          CryptocurrencyTransactionEntry,
          $$CryptocurrencyTransactionEntriesTableFilterComposer,
          $$CryptocurrencyTransactionEntriesTableOrderingComposer,
          $$CryptocurrencyTransactionEntriesTableAnnotationComposer,
          $$CryptocurrencyTransactionEntriesTableCreateCompanionBuilder,
          $$CryptocurrencyTransactionEntriesTableUpdateCompanionBuilder,
          (
            CryptocurrencyTransactionEntry,
            $$CryptocurrencyTransactionEntriesTableReferences,
          ),
          CryptocurrencyTransactionEntry,
          PrefetchHooks Function({bool cryptocurrencyId})
        > {
  $$CryptocurrencyTransactionEntriesTableTableManager(
    _$AppDatabase db,
    $CryptocurrencyTransactionEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CryptocurrencyTransactionEntriesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CryptocurrencyTransactionEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CryptocurrencyTransactionEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> cryptocurrencyId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double> amount = const Value.absent(),
              }) => CryptocurrencyTransactionEntriesCompanion(
                id: id,
                cryptocurrencyId: cryptocurrencyId,
                date: date,
                amount: amount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int cryptocurrencyId,
                required DateTime date,
                required double amount,
              }) => CryptocurrencyTransactionEntriesCompanion.insert(
                id: id,
                cryptocurrencyId: cryptocurrencyId,
                date: date,
                amount: amount,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CryptocurrencyTransactionEntriesTableReferences(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cryptocurrencyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                    if (cryptocurrencyId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.cryptocurrencyId,
                                referencedTable:
                                    $$CryptocurrencyTransactionEntriesTableReferences
                                        ._cryptocurrencyIdTable(db),
                                referencedColumn:
                                    $$CryptocurrencyTransactionEntriesTableReferences
                                        ._cryptocurrencyIdTable(db)
                                        .id,
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

typedef $$CryptocurrencyTransactionEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CryptocurrencyTransactionEntriesTable,
      CryptocurrencyTransactionEntry,
      $$CryptocurrencyTransactionEntriesTableFilterComposer,
      $$CryptocurrencyTransactionEntriesTableOrderingComposer,
      $$CryptocurrencyTransactionEntriesTableAnnotationComposer,
      $$CryptocurrencyTransactionEntriesTableCreateCompanionBuilder,
      $$CryptocurrencyTransactionEntriesTableUpdateCompanionBuilder,
      (
        CryptocurrencyTransactionEntry,
        $$CryptocurrencyTransactionEntriesTableReferences,
      ),
      CryptocurrencyTransactionEntry,
      PrefetchHooks Function({bool cryptocurrencyId})
    >;
typedef $$ReitEntriesTableCreateCompanionBuilder =
    ReitEntriesCompanion Function({
      Value<int> id,
      required String name,
      required DateTime boughtOn,
      required int shares,
      required double price,
    });
typedef $$ReitEntriesTableUpdateCompanionBuilder =
    ReitEntriesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime> boughtOn,
      Value<int> shares,
      Value<double> price,
    });

final class $$ReitEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $ReitEntriesTable, ReitEntry> {
  $$ReitEntriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ReitDividendEntriesTable, List<ReitDividendEntry>>
  _reitDividendEntriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.reitDividendEntries,
        aliasName: $_aliasNameGenerator(
          db.reitEntries.id,
          db.reitDividendEntries.reitId,
        ),
      );

  $$ReitDividendEntriesTableProcessedTableManager get reitDividendEntriesRefs {
    final manager = $$ReitDividendEntriesTableTableManager(
      $_db,
      $_db.reitDividendEntries,
    ).filter((f) => f.reitId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _reitDividendEntriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ReitEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $ReitEntriesTable> {
  $$ReitEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get boughtOn => $composableBuilder(
    column: $table.boughtOn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shares => $composableBuilder(
    column: $table.shares,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> reitDividendEntriesRefs(
    Expression<bool> Function($$ReitDividendEntriesTableFilterComposer f) f,
  ) {
    final $$ReitDividendEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reitDividendEntries,
      getReferencedColumn: (t) => t.reitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReitDividendEntriesTableFilterComposer(
            $db: $db,
            $table: $db.reitDividendEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ReitEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ReitEntriesTable> {
  $$ReitEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get boughtOn => $composableBuilder(
    column: $table.boughtOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shares => $composableBuilder(
    column: $table.shares,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReitEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReitEntriesTable> {
  $$ReitEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get boughtOn =>
      $composableBuilder(column: $table.boughtOn, builder: (column) => column);

  GeneratedColumn<int> get shares =>
      $composableBuilder(column: $table.shares, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  Expression<T> reitDividendEntriesRefs<T extends Object>(
    Expression<T> Function($$ReitDividendEntriesTableAnnotationComposer a) f,
  ) {
    final $$ReitDividendEntriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.reitDividendEntries,
          getReferencedColumn: (t) => t.reitId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ReitDividendEntriesTableAnnotationComposer(
                $db: $db,
                $table: $db.reitDividendEntries,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ReitEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReitEntriesTable,
          ReitEntry,
          $$ReitEntriesTableFilterComposer,
          $$ReitEntriesTableOrderingComposer,
          $$ReitEntriesTableAnnotationComposer,
          $$ReitEntriesTableCreateCompanionBuilder,
          $$ReitEntriesTableUpdateCompanionBuilder,
          (ReitEntry, $$ReitEntriesTableReferences),
          ReitEntry,
          PrefetchHooks Function({bool reitDividendEntriesRefs})
        > {
  $$ReitEntriesTableTableManager(_$AppDatabase db, $ReitEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReitEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReitEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReitEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> boughtOn = const Value.absent(),
                Value<int> shares = const Value.absent(),
                Value<double> price = const Value.absent(),
              }) => ReitEntriesCompanion(
                id: id,
                name: name,
                boughtOn: boughtOn,
                shares: shares,
                price: price,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required DateTime boughtOn,
                required int shares,
                required double price,
              }) => ReitEntriesCompanion.insert(
                id: id,
                name: name,
                boughtOn: boughtOn,
                shares: shares,
                price: price,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReitEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({reitDividendEntriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (reitDividendEntriesRefs) db.reitDividendEntries,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (reitDividendEntriesRefs)
                    await $_getPrefetchedData<
                      ReitEntry,
                      $ReitEntriesTable,
                      ReitDividendEntry
                    >(
                      currentTable: table,
                      referencedTable: $$ReitEntriesTableReferences
                          ._reitDividendEntriesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ReitEntriesTableReferences(
                            db,
                            table,
                            p0,
                          ).reitDividendEntriesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.reitId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ReitEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReitEntriesTable,
      ReitEntry,
      $$ReitEntriesTableFilterComposer,
      $$ReitEntriesTableOrderingComposer,
      $$ReitEntriesTableAnnotationComposer,
      $$ReitEntriesTableCreateCompanionBuilder,
      $$ReitEntriesTableUpdateCompanionBuilder,
      (ReitEntry, $$ReitEntriesTableReferences),
      ReitEntry,
      PrefetchHooks Function({bool reitDividendEntriesRefs})
    >;
typedef $$ReitDividendEntriesTableCreateCompanionBuilder =
    ReitDividendEntriesCompanion Function({
      Value<int> id,
      required int reitId,
      required DateTime receivedAt,
      required double amount,
    });
typedef $$ReitDividendEntriesTableUpdateCompanionBuilder =
    ReitDividendEntriesCompanion Function({
      Value<int> id,
      Value<int> reitId,
      Value<DateTime> receivedAt,
      Value<double> amount,
    });

final class $$ReitDividendEntriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ReitDividendEntriesTable,
          ReitDividendEntry
        > {
  $$ReitDividendEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ReitEntriesTable _reitIdTable(_$AppDatabase db) =>
      db.reitEntries.createAlias(
        $_aliasNameGenerator(db.reitDividendEntries.reitId, db.reitEntries.id),
      );

  $$ReitEntriesTableProcessedTableManager get reitId {
    final $_column = $_itemColumn<int>('reit_id')!;

    final manager = $$ReitEntriesTableTableManager(
      $_db,
      $_db.reitEntries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_reitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReitDividendEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $ReitDividendEntriesTable> {
  $$ReitDividendEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  $$ReitEntriesTableFilterComposer get reitId {
    final $$ReitEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reitId,
      referencedTable: $db.reitEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReitEntriesTableFilterComposer(
            $db: $db,
            $table: $db.reitEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReitDividendEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ReitDividendEntriesTable> {
  $$ReitDividendEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  $$ReitEntriesTableOrderingComposer get reitId {
    final $$ReitEntriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reitId,
      referencedTable: $db.reitEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReitEntriesTableOrderingComposer(
            $db: $db,
            $table: $db.reitEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReitDividendEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReitDividendEntriesTable> {
  $$ReitDividendEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  $$ReitEntriesTableAnnotationComposer get reitId {
    final $$ReitEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reitId,
      referencedTable: $db.reitEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReitEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.reitEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReitDividendEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReitDividendEntriesTable,
          ReitDividendEntry,
          $$ReitDividendEntriesTableFilterComposer,
          $$ReitDividendEntriesTableOrderingComposer,
          $$ReitDividendEntriesTableAnnotationComposer,
          $$ReitDividendEntriesTableCreateCompanionBuilder,
          $$ReitDividendEntriesTableUpdateCompanionBuilder,
          (ReitDividendEntry, $$ReitDividendEntriesTableReferences),
          ReitDividendEntry,
          PrefetchHooks Function({bool reitId})
        > {
  $$ReitDividendEntriesTableTableManager(
    _$AppDatabase db,
    $ReitDividendEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReitDividendEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReitDividendEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ReitDividendEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> reitId = const Value.absent(),
                Value<DateTime> receivedAt = const Value.absent(),
                Value<double> amount = const Value.absent(),
              }) => ReitDividendEntriesCompanion(
                id: id,
                reitId: reitId,
                receivedAt: receivedAt,
                amount: amount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int reitId,
                required DateTime receivedAt,
                required double amount,
              }) => ReitDividendEntriesCompanion.insert(
                id: id,
                reitId: reitId,
                receivedAt: receivedAt,
                amount: amount,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReitDividendEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({reitId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                    if (reitId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.reitId,
                                referencedTable:
                                    $$ReitDividendEntriesTableReferences
                                        ._reitIdTable(db),
                                referencedColumn:
                                    $$ReitDividendEntriesTableReferences
                                        ._reitIdTable(db)
                                        .id,
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

typedef $$ReitDividendEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReitDividendEntriesTable,
      ReitDividendEntry,
      $$ReitDividendEntriesTableFilterComposer,
      $$ReitDividendEntriesTableOrderingComposer,
      $$ReitDividendEntriesTableAnnotationComposer,
      $$ReitDividendEntriesTableCreateCompanionBuilder,
      $$ReitDividendEntriesTableUpdateCompanionBuilder,
      (ReitDividendEntry, $$ReitDividendEntriesTableReferences),
      ReitDividendEntry,
      PrefetchHooks Function({bool reitId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SavingsEntriesTableTableManager get savingsEntries =>
      $$SavingsEntriesTableTableManager(_db, _db.savingsEntries);
  $$CashEntriesTableTableManager get cashEntries =>
      $$CashEntriesTableTableManager(_db, _db.cashEntries);
  $$CrowdfundingEntriesTableTableManager get crowdfundingEntries =>
      $$CrowdfundingEntriesTableTableManager(_db, _db.crowdfundingEntries);
  $$SavingsBookEntriesTableTableManager get savingsBookEntries =>
      $$SavingsBookEntriesTableTableManager(_db, _db.savingsBookEntries);
  $$CounterStrikeEntriesTableTableManager get counterStrikeEntries =>
      $$CounterStrikeEntriesTableTableManager(_db, _db.counterStrikeEntries);
  $$PeaEntriesTableTableManager get peaEntries =>
      $$PeaEntriesTableTableManager(_db, _db.peaEntries);
  $$PerEntriesTableTableManager get perEntries =>
      $$PerEntriesTableTableManager(_db, _db.perEntries);
  $$LifeInsuranceEntriesTableTableManager get lifeInsuranceEntries =>
      $$LifeInsuranceEntriesTableTableManager(_db, _db.lifeInsuranceEntries);
  $$FreelanceEntriesTableTableManager get freelanceEntries =>
      $$FreelanceEntriesTableTableManager(_db, _db.freelanceEntries);
  $$BudgetEntriesTableTableManager get budgetEntries =>
      $$BudgetEntriesTableTableManager(_db, _db.budgetEntries);
  $$CryptocurrencyEntriesTableTableManager get cryptocurrencyEntries =>
      $$CryptocurrencyEntriesTableTableManager(_db, _db.cryptocurrencyEntries);
  $$CryptocurrencyTransactionEntriesTableTableManager
  get cryptocurrencyTransactionEntries =>
      $$CryptocurrencyTransactionEntriesTableTableManager(
        _db,
        _db.cryptocurrencyTransactionEntries,
      );
  $$ReitEntriesTableTableManager get reitEntries =>
      $$ReitEntriesTableTableManager(_db, _db.reitEntries);
  $$ReitDividendEntriesTableTableManager get reitDividendEntries =>
      $$ReitDividendEntriesTableTableManager(_db, _db.reitDividendEntries);
}
