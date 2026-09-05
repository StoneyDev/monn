// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class SavingsEntries extends Table
    with TableInfo<SavingsEntries, SavingsEntriesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  SavingsEntries(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SavingsEntriesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavingsEntriesData(
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
  SavingsEntries createAlias(String alias) {
    return SavingsEntries(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE(type)'];
}

class SavingsEntriesData extends DataClass
    implements Insertable<SavingsEntriesData> {
  final int id;
  final String type;
  final double? startAmount;
  const SavingsEntriesData({
    required this.id,
    required this.type,
    this.startAmount,
  });
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

  factory SavingsEntriesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavingsEntriesData(
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

  SavingsEntriesData copyWith({
    int? id,
    String? type,
    Value<double?> startAmount = const Value.absent(),
  }) => SavingsEntriesData(
    id: id ?? this.id,
    type: type ?? this.type,
    startAmount: startAmount.present ? startAmount.value : this.startAmount,
  );
  SavingsEntriesData copyWithCompanion(SavingsEntriesCompanion data) {
    return SavingsEntriesData(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      startAmount: data.startAmount.present
          ? data.startAmount.value
          : this.startAmount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavingsEntriesData(')
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
      (other is SavingsEntriesData &&
          other.id == this.id &&
          other.type == this.type &&
          other.startAmount == this.startAmount);
}

class SavingsEntriesCompanion extends UpdateCompanion<SavingsEntriesData> {
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
  static Insertable<SavingsEntriesData> custom({
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

class CashEntries extends Table with TableInfo<CashEntries, CashEntriesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CashEntries(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CashEntriesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CashEntriesData(
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
  CashEntries createAlias(String alias) {
    return CashEntries(attachedDatabase, alias);
  }
}

class CashEntriesData extends DataClass implements Insertable<CashEntriesData> {
  final int id;
  final String label;
  final double value;
  const CashEntriesData({
    required this.id,
    required this.label,
    required this.value,
  });
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

  factory CashEntriesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CashEntriesData(
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

  CashEntriesData copyWith({int? id, String? label, double? value}) =>
      CashEntriesData(
        id: id ?? this.id,
        label: label ?? this.label,
        value: value ?? this.value,
      );
  CashEntriesData copyWithCompanion(CashEntriesCompanion data) {
    return CashEntriesData(
      id: data.id.present ? data.id.value : this.id,
      label: data.label.present ? data.label.value : this.label,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CashEntriesData(')
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
      (other is CashEntriesData &&
          other.id == this.id &&
          other.label == this.label &&
          other.value == this.value);
}

class CashEntriesCompanion extends UpdateCompanion<CashEntriesData> {
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
  static Insertable<CashEntriesData> custom({
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

class CrowdfundingEntries extends Table
    with TableInfo<CrowdfundingEntries, CrowdfundingEntriesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CrowdfundingEntries(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<double> brutProfit = GeneratedColumn<double>(
    'brut_profit',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> platformName = GeneratedColumn<String>(
    'platform_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<double> netProfit = GeneratedColumn<double>(
    'net_profit',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  late final GeneratedColumn<double> taxProfit = GeneratedColumn<double>(
    'tax_profit',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  late final GeneratedColumn<double> taxPercentage = GeneratedColumn<double>(
    'tax_percentage',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  late final GeneratedColumn<DateTime> receivedAt = GeneratedColumn<DateTime>(
    'received_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CrowdfundingEntriesData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CrowdfundingEntriesData(
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
      ),
    );
  }

  @override
  CrowdfundingEntries createAlias(String alias) {
    return CrowdfundingEntries(attachedDatabase, alias);
  }
}

class CrowdfundingEntriesData extends DataClass
    implements Insertable<CrowdfundingEntriesData> {
  final int id;
  final double brutProfit;
  final String platformName;
  final double? netProfit;
  final double? taxProfit;
  final double? taxPercentage;
  final DateTime? receivedAt;
  const CrowdfundingEntriesData({
    required this.id,
    required this.brutProfit,
    required this.platformName,
    this.netProfit,
    this.taxProfit,
    this.taxPercentage,
    this.receivedAt,
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
    if (!nullToAbsent || receivedAt != null) {
      map['received_at'] = Variable<DateTime>(receivedAt);
    }
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
      receivedAt: receivedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(receivedAt),
    );
  }

  factory CrowdfundingEntriesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CrowdfundingEntriesData(
      id: serializer.fromJson<int>(json['id']),
      brutProfit: serializer.fromJson<double>(json['brutProfit']),
      platformName: serializer.fromJson<String>(json['platformName']),
      netProfit: serializer.fromJson<double?>(json['netProfit']),
      taxProfit: serializer.fromJson<double?>(json['taxProfit']),
      taxPercentage: serializer.fromJson<double?>(json['taxPercentage']),
      receivedAt: serializer.fromJson<DateTime?>(json['receivedAt']),
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
      'receivedAt': serializer.toJson<DateTime?>(receivedAt),
    };
  }

  CrowdfundingEntriesData copyWith({
    int? id,
    double? brutProfit,
    String? platformName,
    Value<double?> netProfit = const Value.absent(),
    Value<double?> taxProfit = const Value.absent(),
    Value<double?> taxPercentage = const Value.absent(),
    Value<DateTime?> receivedAt = const Value.absent(),
  }) => CrowdfundingEntriesData(
    id: id ?? this.id,
    brutProfit: brutProfit ?? this.brutProfit,
    platformName: platformName ?? this.platformName,
    netProfit: netProfit.present ? netProfit.value : this.netProfit,
    taxProfit: taxProfit.present ? taxProfit.value : this.taxProfit,
    taxPercentage: taxPercentage.present
        ? taxPercentage.value
        : this.taxPercentage,
    receivedAt: receivedAt.present ? receivedAt.value : this.receivedAt,
  );
  CrowdfundingEntriesData copyWithCompanion(CrowdfundingEntriesCompanion data) {
    return CrowdfundingEntriesData(
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
    return (StringBuffer('CrowdfundingEntriesData(')
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
      (other is CrowdfundingEntriesData &&
          other.id == this.id &&
          other.brutProfit == this.brutProfit &&
          other.platformName == this.platformName &&
          other.netProfit == this.netProfit &&
          other.taxProfit == this.taxProfit &&
          other.taxPercentage == this.taxPercentage &&
          other.receivedAt == this.receivedAt);
}

class CrowdfundingEntriesCompanion
    extends UpdateCompanion<CrowdfundingEntriesData> {
  final Value<int> id;
  final Value<double> brutProfit;
  final Value<String> platformName;
  final Value<double?> netProfit;
  final Value<double?> taxProfit;
  final Value<double?> taxPercentage;
  final Value<DateTime?> receivedAt;
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
    this.receivedAt = const Value.absent(),
  }) : brutProfit = Value(brutProfit),
       platformName = Value(platformName);
  static Insertable<CrowdfundingEntriesData> custom({
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
    Value<DateTime?>? receivedAt,
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

class SavingsBookEntries extends Table
    with TableInfo<SavingsBookEntries, SavingsBookEntriesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  SavingsBookEntries(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<double> startAmount = GeneratedColumn<double>(
    'start_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
  late final GeneratedColumn<double> withdrawal = GeneratedColumn<double>(
    'withdrawal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
  late final GeneratedColumn<double> interests = GeneratedColumn<double>(
    'interests',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SavingsBookEntriesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavingsBookEntriesData(
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
  SavingsBookEntries createAlias(String alias) {
    return SavingsBookEntries(attachedDatabase, alias);
  }
}

class SavingsBookEntriesData extends DataClass
    implements Insertable<SavingsBookEntriesData> {
  final int id;
  final String name;
  final double startAmount;
  final double withdrawal;
  final double interests;
  const SavingsBookEntriesData({
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

  factory SavingsBookEntriesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavingsBookEntriesData(
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

  SavingsBookEntriesData copyWith({
    int? id,
    String? name,
    double? startAmount,
    double? withdrawal,
    double? interests,
  }) => SavingsBookEntriesData(
    id: id ?? this.id,
    name: name ?? this.name,
    startAmount: startAmount ?? this.startAmount,
    withdrawal: withdrawal ?? this.withdrawal,
    interests: interests ?? this.interests,
  );
  SavingsBookEntriesData copyWithCompanion(SavingsBookEntriesCompanion data) {
    return SavingsBookEntriesData(
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
    return (StringBuffer('SavingsBookEntriesData(')
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
      (other is SavingsBookEntriesData &&
          other.id == this.id &&
          other.name == this.name &&
          other.startAmount == this.startAmount &&
          other.withdrawal == this.withdrawal &&
          other.interests == this.interests);
}

class SavingsBookEntriesCompanion
    extends UpdateCompanion<SavingsBookEntriesData> {
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
  static Insertable<SavingsBookEntriesData> custom({
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

class CounterStrikeEntries extends Table
    with TableInfo<CounterStrikeEntries, CounterStrikeEntriesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CounterStrikeEntries(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<DateTime> boughtAt = GeneratedColumn<DateTime>(
    'bought_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<DateTime> lastUpdate = GeneratedColumn<DateTime>(
    'last_update',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> imageId = GeneratedColumn<String>(
    'image_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<double> purchaseValue = GeneratedColumn<double>(
    'purchase_value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<double> currentValue = GeneratedColumn<double>(
    'current_value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CounterStrikeEntriesData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CounterStrikeEntriesData(
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
  CounterStrikeEntries createAlias(String alias) {
    return CounterStrikeEntries(attachedDatabase, alias);
  }
}

class CounterStrikeEntriesData extends DataClass
    implements Insertable<CounterStrikeEntriesData> {
  final int id;
  final DateTime boughtAt;
  final DateTime lastUpdate;
  final String imageId;
  final double purchaseValue;
  final double currentValue;
  final int quantity;
  final double? wear;
  const CounterStrikeEntriesData({
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

  factory CounterStrikeEntriesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CounterStrikeEntriesData(
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

  CounterStrikeEntriesData copyWith({
    int? id,
    DateTime? boughtAt,
    DateTime? lastUpdate,
    String? imageId,
    double? purchaseValue,
    double? currentValue,
    int? quantity,
    Value<double?> wear = const Value.absent(),
  }) => CounterStrikeEntriesData(
    id: id ?? this.id,
    boughtAt: boughtAt ?? this.boughtAt,
    lastUpdate: lastUpdate ?? this.lastUpdate,
    imageId: imageId ?? this.imageId,
    purchaseValue: purchaseValue ?? this.purchaseValue,
    currentValue: currentValue ?? this.currentValue,
    quantity: quantity ?? this.quantity,
    wear: wear.present ? wear.value : this.wear,
  );
  CounterStrikeEntriesData copyWithCompanion(
    CounterStrikeEntriesCompanion data,
  ) {
    return CounterStrikeEntriesData(
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
    return (StringBuffer('CounterStrikeEntriesData(')
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
      (other is CounterStrikeEntriesData &&
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
    extends UpdateCompanion<CounterStrikeEntriesData> {
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
  static Insertable<CounterStrikeEntriesData> custom({
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

class PeaEntries extends Table with TableInfo<PeaEntries, PeaEntriesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  PeaEntries(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<int> equity = GeneratedColumn<int>(
    'equity',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  late final GeneratedColumn<double> costAverage = GeneratedColumn<double>(
    'cost_average',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  late final GeneratedColumn<double> lastPrice = GeneratedColumn<double>(
    'last_price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PeaEntriesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PeaEntriesData(
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
  PeaEntries createAlias(String alias) {
    return PeaEntries(attachedDatabase, alias);
  }
}

class PeaEntriesData extends DataClass implements Insertable<PeaEntriesData> {
  final int id;
  final int? equity;
  final double? costAverage;
  final double? lastPrice;
  final DateTime? lastUpdate;
  const PeaEntriesData({
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

  factory PeaEntriesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PeaEntriesData(
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

  PeaEntriesData copyWith({
    int? id,
    Value<int?> equity = const Value.absent(),
    Value<double?> costAverage = const Value.absent(),
    Value<double?> lastPrice = const Value.absent(),
    Value<DateTime?> lastUpdate = const Value.absent(),
  }) => PeaEntriesData(
    id: id ?? this.id,
    equity: equity.present ? equity.value : this.equity,
    costAverage: costAverage.present ? costAverage.value : this.costAverage,
    lastPrice: lastPrice.present ? lastPrice.value : this.lastPrice,
    lastUpdate: lastUpdate.present ? lastUpdate.value : this.lastUpdate,
  );
  PeaEntriesData copyWithCompanion(PeaEntriesCompanion data) {
    return PeaEntriesData(
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
    return (StringBuffer('PeaEntriesData(')
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
      (other is PeaEntriesData &&
          other.id == this.id &&
          other.equity == this.equity &&
          other.costAverage == this.costAverage &&
          other.lastPrice == this.lastPrice &&
          other.lastUpdate == this.lastUpdate);
}

class PeaEntriesCompanion extends UpdateCompanion<PeaEntriesData> {
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
  static Insertable<PeaEntriesData> custom({
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

class PerEntries extends Table with TableInfo<PerEntries, PerEntriesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  PerEntries(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<double> invested = GeneratedColumn<double>(
    'invested',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
  late final GeneratedColumn<double> interests = GeneratedColumn<double>(
    'interests',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, invested, interests];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'per_entries';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PerEntriesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PerEntriesData(
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
  PerEntries createAlias(String alias) {
    return PerEntries(attachedDatabase, alias);
  }
}

class PerEntriesData extends DataClass implements Insertable<PerEntriesData> {
  final int id;
  final double invested;
  final double interests;
  const PerEntriesData({
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

  factory PerEntriesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PerEntriesData(
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

  PerEntriesData copyWith({int? id, double? invested, double? interests}) =>
      PerEntriesData(
        id: id ?? this.id,
        invested: invested ?? this.invested,
        interests: interests ?? this.interests,
      );
  PerEntriesData copyWithCompanion(PerEntriesCompanion data) {
    return PerEntriesData(
      id: data.id.present ? data.id.value : this.id,
      invested: data.invested.present ? data.invested.value : this.invested,
      interests: data.interests.present ? data.interests.value : this.interests,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PerEntriesData(')
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
      (other is PerEntriesData &&
          other.id == this.id &&
          other.invested == this.invested &&
          other.interests == this.interests);
}

class PerEntriesCompanion extends UpdateCompanion<PerEntriesData> {
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
  static Insertable<PerEntriesData> custom({
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

class LifeInsuranceEntries extends Table
    with TableInfo<LifeInsuranceEntries, LifeInsuranceEntriesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  LifeInsuranceEntries(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<double> invested = GeneratedColumn<double>(
    'invested',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
  late final GeneratedColumn<double> interests = GeneratedColumn<double>(
    'interests',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, invested, interests];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'life_insurance_entries';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LifeInsuranceEntriesData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LifeInsuranceEntriesData(
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
  LifeInsuranceEntries createAlias(String alias) {
    return LifeInsuranceEntries(attachedDatabase, alias);
  }
}

class LifeInsuranceEntriesData extends DataClass
    implements Insertable<LifeInsuranceEntriesData> {
  final int id;
  final double invested;
  final double interests;
  const LifeInsuranceEntriesData({
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

  factory LifeInsuranceEntriesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LifeInsuranceEntriesData(
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

  LifeInsuranceEntriesData copyWith({
    int? id,
    double? invested,
    double? interests,
  }) => LifeInsuranceEntriesData(
    id: id ?? this.id,
    invested: invested ?? this.invested,
    interests: interests ?? this.interests,
  );
  LifeInsuranceEntriesData copyWithCompanion(
    LifeInsuranceEntriesCompanion data,
  ) {
    return LifeInsuranceEntriesData(
      id: data.id.present ? data.id.value : this.id,
      invested: data.invested.present ? data.invested.value : this.invested,
      interests: data.interests.present ? data.interests.value : this.interests,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LifeInsuranceEntriesData(')
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
      (other is LifeInsuranceEntriesData &&
          other.id == this.id &&
          other.invested == this.invested &&
          other.interests == this.interests);
}

class LifeInsuranceEntriesCompanion
    extends UpdateCompanion<LifeInsuranceEntriesData> {
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
  static Insertable<LifeInsuranceEntriesData> custom({
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

class FreelanceEntries extends Table
    with TableInfo<FreelanceEntries, FreelanceEntriesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  FreelanceEntries(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<double> annualRevenue = GeneratedColumn<double>(
    'annual_revenue',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, annualRevenue];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'freelance_entries';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FreelanceEntriesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FreelanceEntriesData(
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
  FreelanceEntries createAlias(String alias) {
    return FreelanceEntries(attachedDatabase, alias);
  }
}

class FreelanceEntriesData extends DataClass
    implements Insertable<FreelanceEntriesData> {
  final int id;
  final double annualRevenue;
  const FreelanceEntriesData({required this.id, required this.annualRevenue});
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

  factory FreelanceEntriesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FreelanceEntriesData(
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

  FreelanceEntriesData copyWith({int? id, double? annualRevenue}) =>
      FreelanceEntriesData(
        id: id ?? this.id,
        annualRevenue: annualRevenue ?? this.annualRevenue,
      );
  FreelanceEntriesData copyWithCompanion(FreelanceEntriesCompanion data) {
    return FreelanceEntriesData(
      id: data.id.present ? data.id.value : this.id,
      annualRevenue: data.annualRevenue.present
          ? data.annualRevenue.value
          : this.annualRevenue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FreelanceEntriesData(')
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
      (other is FreelanceEntriesData &&
          other.id == this.id &&
          other.annualRevenue == this.annualRevenue);
}

class FreelanceEntriesCompanion extends UpdateCompanion<FreelanceEntriesData> {
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
  static Insertable<FreelanceEntriesData> custom({
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

class BudgetEntries extends Table
    with TableInfo<BudgetEntries, BudgetEntriesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  BudgetEntries(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<double> freelanceIncome = GeneratedColumn<double>(
    'freelance_income',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
  late final GeneratedColumn<double> rent = GeneratedColumn<double>(
    'rent',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
  late final GeneratedColumn<double> electricity = GeneratedColumn<double>(
    'electricity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
  late final GeneratedColumn<double> gas = GeneratedColumn<double>(
    'gas',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
  late final GeneratedColumn<double> water = GeneratedColumn<double>(
    'water',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
  late final GeneratedColumn<double> internet = GeneratedColumn<double>(
    'internet',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
  late final GeneratedColumn<double> homeInsurance = GeneratedColumn<double>(
    'home_insurance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
  late final GeneratedColumn<double> publicTransport = GeneratedColumn<double>(
    'public_transport',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
  late final GeneratedColumn<double> groceries = GeneratedColumn<double>(
    'groceries',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
  late final GeneratedColumn<double> restaurants = GeneratedColumn<double>(
    'restaurants',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
  late final GeneratedColumn<double> healthInsurance = GeneratedColumn<double>(
    'health_insurance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
  late final GeneratedColumn<double> phone = GeneratedColumn<double>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
  late final GeneratedColumn<double> ai = GeneratedColumn<double>(
    'ai',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BudgetEntriesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BudgetEntriesData(
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
  BudgetEntries createAlias(String alias) {
    return BudgetEntries(attachedDatabase, alias);
  }
}

class BudgetEntriesData extends DataClass
    implements Insertable<BudgetEntriesData> {
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
  const BudgetEntriesData({
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

  factory BudgetEntriesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BudgetEntriesData(
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

  BudgetEntriesData copyWith({
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
  }) => BudgetEntriesData(
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
  BudgetEntriesData copyWithCompanion(BudgetEntriesCompanion data) {
    return BudgetEntriesData(
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
    return (StringBuffer('BudgetEntriesData(')
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
      (other is BudgetEntriesData &&
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

class BudgetEntriesCompanion extends UpdateCompanion<BudgetEntriesData> {
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
  static Insertable<BudgetEntriesData> custom({
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

class CryptocurrencyEntries extends Table
    with TableInfo<CryptocurrencyEntries, CryptocurrencyEntriesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CryptocurrencyEntries(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<double> totalCrypto = GeneratedColumn<double>(
    'total_crypto',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
  late final GeneratedColumn<double> priceMarket = GeneratedColumn<double>(
    'price_market',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('0.0'),
  );
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CryptocurrencyEntriesData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CryptocurrencyEntriesData(
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
  CryptocurrencyEntries createAlias(String alias) {
    return CryptocurrencyEntries(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE(type)'];
}

class CryptocurrencyEntriesData extends DataClass
    implements Insertable<CryptocurrencyEntriesData> {
  final int id;
  final String type;
  final double totalCrypto;
  final double priceMarket;
  final DateTime? lastUpdate;
  const CryptocurrencyEntriesData({
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

  factory CryptocurrencyEntriesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CryptocurrencyEntriesData(
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

  CryptocurrencyEntriesData copyWith({
    int? id,
    String? type,
    double? totalCrypto,
    double? priceMarket,
    Value<DateTime?> lastUpdate = const Value.absent(),
  }) => CryptocurrencyEntriesData(
    id: id ?? this.id,
    type: type ?? this.type,
    totalCrypto: totalCrypto ?? this.totalCrypto,
    priceMarket: priceMarket ?? this.priceMarket,
    lastUpdate: lastUpdate.present ? lastUpdate.value : this.lastUpdate,
  );
  CryptocurrencyEntriesData copyWithCompanion(
    CryptocurrencyEntriesCompanion data,
  ) {
    return CryptocurrencyEntriesData(
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
    return (StringBuffer('CryptocurrencyEntriesData(')
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
      (other is CryptocurrencyEntriesData &&
          other.id == this.id &&
          other.type == this.type &&
          other.totalCrypto == this.totalCrypto &&
          other.priceMarket == this.priceMarket &&
          other.lastUpdate == this.lastUpdate);
}

class CryptocurrencyEntriesCompanion
    extends UpdateCompanion<CryptocurrencyEntriesData> {
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
  static Insertable<CryptocurrencyEntriesData> custom({
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

class CryptocurrencyTransactionEntries extends Table
    with
        TableInfo<
          CryptocurrencyTransactionEntries,
          CryptocurrencyTransactionEntriesData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CryptocurrencyTransactionEntries(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CryptocurrencyTransactionEntriesData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CryptocurrencyTransactionEntriesData(
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
  CryptocurrencyTransactionEntries createAlias(String alias) {
    return CryptocurrencyTransactionEntries(attachedDatabase, alias);
  }
}

class CryptocurrencyTransactionEntriesData extends DataClass
    implements Insertable<CryptocurrencyTransactionEntriesData> {
  final int id;
  final int cryptocurrencyId;
  final DateTime date;
  final double amount;
  const CryptocurrencyTransactionEntriesData({
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

  factory CryptocurrencyTransactionEntriesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CryptocurrencyTransactionEntriesData(
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

  CryptocurrencyTransactionEntriesData copyWith({
    int? id,
    int? cryptocurrencyId,
    DateTime? date,
    double? amount,
  }) => CryptocurrencyTransactionEntriesData(
    id: id ?? this.id,
    cryptocurrencyId: cryptocurrencyId ?? this.cryptocurrencyId,
    date: date ?? this.date,
    amount: amount ?? this.amount,
  );
  CryptocurrencyTransactionEntriesData copyWithCompanion(
    CryptocurrencyTransactionEntriesCompanion data,
  ) {
    return CryptocurrencyTransactionEntriesData(
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
    return (StringBuffer('CryptocurrencyTransactionEntriesData(')
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
      (other is CryptocurrencyTransactionEntriesData &&
          other.id == this.id &&
          other.cryptocurrencyId == this.cryptocurrencyId &&
          other.date == this.date &&
          other.amount == this.amount);
}

class CryptocurrencyTransactionEntriesCompanion
    extends UpdateCompanion<CryptocurrencyTransactionEntriesData> {
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
  static Insertable<CryptocurrencyTransactionEntriesData> custom({
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

class ReitEntries extends Table with TableInfo<ReitEntries, ReitEntriesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ReitEntries(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<DateTime> boughtOn = GeneratedColumn<DateTime>(
    'bought_on',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> shares = GeneratedColumn<int>(
    'shares',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReitEntriesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReitEntriesData(
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
  ReitEntries createAlias(String alias) {
    return ReitEntries(attachedDatabase, alias);
  }
}

class ReitEntriesData extends DataClass implements Insertable<ReitEntriesData> {
  final int id;
  final String name;
  final DateTime boughtOn;
  final int shares;
  final double price;
  const ReitEntriesData({
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

  factory ReitEntriesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReitEntriesData(
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

  ReitEntriesData copyWith({
    int? id,
    String? name,
    DateTime? boughtOn,
    int? shares,
    double? price,
  }) => ReitEntriesData(
    id: id ?? this.id,
    name: name ?? this.name,
    boughtOn: boughtOn ?? this.boughtOn,
    shares: shares ?? this.shares,
    price: price ?? this.price,
  );
  ReitEntriesData copyWithCompanion(ReitEntriesCompanion data) {
    return ReitEntriesData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      boughtOn: data.boughtOn.present ? data.boughtOn.value : this.boughtOn,
      shares: data.shares.present ? data.shares.value : this.shares,
      price: data.price.present ? data.price.value : this.price,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReitEntriesData(')
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
      (other is ReitEntriesData &&
          other.id == this.id &&
          other.name == this.name &&
          other.boughtOn == this.boughtOn &&
          other.shares == this.shares &&
          other.price == this.price);
}

class ReitEntriesCompanion extends UpdateCompanion<ReitEntriesData> {
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
  static Insertable<ReitEntriesData> custom({
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

class ReitDividendEntries extends Table
    with TableInfo<ReitDividendEntries, ReitDividendEntriesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ReitDividendEntries(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<DateTime> receivedAt = GeneratedColumn<DateTime>(
    'received_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReitDividendEntriesData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReitDividendEntriesData(
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
  ReitDividendEntries createAlias(String alias) {
    return ReitDividendEntries(attachedDatabase, alias);
  }
}

class ReitDividendEntriesData extends DataClass
    implements Insertable<ReitDividendEntriesData> {
  final int id;
  final int reitId;
  final DateTime receivedAt;
  final double amount;
  const ReitDividendEntriesData({
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

  factory ReitDividendEntriesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReitDividendEntriesData(
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

  ReitDividendEntriesData copyWith({
    int? id,
    int? reitId,
    DateTime? receivedAt,
    double? amount,
  }) => ReitDividendEntriesData(
    id: id ?? this.id,
    reitId: reitId ?? this.reitId,
    receivedAt: receivedAt ?? this.receivedAt,
    amount: amount ?? this.amount,
  );
  ReitDividendEntriesData copyWithCompanion(ReitDividendEntriesCompanion data) {
    return ReitDividendEntriesData(
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
    return (StringBuffer('ReitDividendEntriesData(')
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
      (other is ReitDividendEntriesData &&
          other.id == this.id &&
          other.reitId == this.reitId &&
          other.receivedAt == this.receivedAt &&
          other.amount == this.amount);
}

class ReitDividendEntriesCompanion
    extends UpdateCompanion<ReitDividendEntriesData> {
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
  static Insertable<ReitDividendEntriesData> custom({
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

class DatabaseAtV1 extends GeneratedDatabase {
  DatabaseAtV1(QueryExecutor e) : super(e);
  late final SavingsEntries savingsEntries = SavingsEntries(this);
  late final CashEntries cashEntries = CashEntries(this);
  late final CrowdfundingEntries crowdfundingEntries = CrowdfundingEntries(
    this,
  );
  late final SavingsBookEntries savingsBookEntries = SavingsBookEntries(this);
  late final CounterStrikeEntries counterStrikeEntries = CounterStrikeEntries(
    this,
  );
  late final PeaEntries peaEntries = PeaEntries(this);
  late final PerEntries perEntries = PerEntries(this);
  late final LifeInsuranceEntries lifeInsuranceEntries = LifeInsuranceEntries(
    this,
  );
  late final FreelanceEntries freelanceEntries = FreelanceEntries(this);
  late final BudgetEntries budgetEntries = BudgetEntries(this);
  late final CryptocurrencyEntries cryptocurrencyEntries =
      CryptocurrencyEntries(this);
  late final CryptocurrencyTransactionEntries cryptocurrencyTransactionEntries =
      CryptocurrencyTransactionEntries(this);
  late final ReitEntries reitEntries = ReitEntries(this);
  late final ReitDividendEntries reitDividendEntries = ReitDividendEntries(
    this,
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
  ];
  @override
  int get schemaVersion => 1;
}
