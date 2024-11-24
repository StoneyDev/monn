// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_strike.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCounterStrikeCollection on Isar {
  IsarCollection<CounterStrike> get counterStrikes => this.collection();
}

const CounterStrikeSchema = CollectionSchema(
  name: r'CounterStrike',
  id: -6924635953155074745,
  properties: {
    r'boughtAt': PropertySchema(
      id: 0,
      name: r'boughtAt',
      type: IsarType.dateTime,
    ),
    r'currentValue': PropertySchema(
      id: 1,
      name: r'currentValue',
      type: IsarType.double,
    ),
    r'imageId': PropertySchema(
      id: 2,
      name: r'imageId',
      type: IsarType.string,
    ),
    r'lastUpdate': PropertySchema(
      id: 3,
      name: r'lastUpdate',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'purchaseValue': PropertySchema(
      id: 5,
      name: r'purchaseValue',
      type: IsarType.double,
    ),
    r'quantity': PropertySchema(
      id: 6,
      name: r'quantity',
      type: IsarType.long,
    ),
    r'wear': PropertySchema(
      id: 7,
      name: r'wear',
      type: IsarType.string,
    )
  },
  estimateSize: _counterStrikeEstimateSize,
  serialize: _counterStrikeSerialize,
  deserialize: _counterStrikeDeserialize,
  deserializeProp: _counterStrikeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _counterStrikeGetId,
  getLinks: _counterStrikeGetLinks,
  attach: _counterStrikeAttach,
  version: '3.1.7',
);

int _counterStrikeEstimateSize(
  CounterStrike object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.imageId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.wear;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _counterStrikeSerialize(
  CounterStrike object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.boughtAt);
  writer.writeDouble(offsets[1], object.currentValue);
  writer.writeString(offsets[2], object.imageId);
  writer.writeDateTime(offsets[3], object.lastUpdate);
  writer.writeString(offsets[4], object.name);
  writer.writeDouble(offsets[5], object.purchaseValue);
  writer.writeLong(offsets[6], object.quantity);
  writer.writeString(offsets[7], object.wear);
}

CounterStrike _counterStrikeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CounterStrike(
    boughtAt: reader.readDateTime(offsets[0]),
    currentValue: reader.readDouble(offsets[1]),
    id: id,
    imageId: reader.readString(offsets[2]),
    lastUpdate: reader.readDateTime(offsets[3]),
    name: reader.readString(offsets[4]),
    purchaseValue: reader.readDouble(offsets[5]),
    quantity: reader.readLong(offsets[6]),
    wear: reader.readStringOrNull(offsets[7]),
  );
  return object;
}

P _counterStrikeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _counterStrikeGetId(CounterStrike object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _counterStrikeGetLinks(CounterStrike object) {
  return [];
}

void _counterStrikeAttach(
    IsarCollection<dynamic> col, Id id, CounterStrike object) {}

extension CounterStrikeQueryWhereSort
    on QueryBuilder<CounterStrike, CounterStrike, QWhere> {
  QueryBuilder<CounterStrike, CounterStrike, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CounterStrikeQueryWhere
    on QueryBuilder<CounterStrike, CounterStrike, QWhereClause> {
  QueryBuilder<CounterStrike, CounterStrike, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CounterStrikeQueryFilter
    on QueryBuilder<CounterStrike, CounterStrike, QFilterCondition> {
  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      boughtAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'boughtAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      boughtAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'boughtAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      boughtAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'boughtAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      boughtAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'boughtAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      currentValueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      currentValueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      currentValueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      currentValueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      imageIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      imageIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      imageIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      imageIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      imageIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      imageIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      imageIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      imageIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      imageIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageId',
        value: '',
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      imageIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageId',
        value: '',
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      lastUpdateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      lastUpdateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      lastUpdateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      lastUpdateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      purchaseValueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      purchaseValueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchaseValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      purchaseValueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchaseValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      purchaseValueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchaseValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      quantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      quantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      quantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      quantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      wearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wear',
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      wearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wear',
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition> wearEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      wearGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      wearLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition> wearBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wear',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      wearStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'wear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      wearEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'wear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      wearContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'wear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition> wearMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'wear',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      wearIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wear',
        value: '',
      ));
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterFilterCondition>
      wearIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'wear',
        value: '',
      ));
    });
  }
}

extension CounterStrikeQueryObject
    on QueryBuilder<CounterStrike, CounterStrike, QFilterCondition> {}

extension CounterStrikeQueryLinks
    on QueryBuilder<CounterStrike, CounterStrike, QFilterCondition> {}

extension CounterStrikeQuerySortBy
    on QueryBuilder<CounterStrike, CounterStrike, QSortBy> {
  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy> sortByBoughtAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boughtAt', Sort.asc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy>
      sortByBoughtAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boughtAt', Sort.desc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy>
      sortByCurrentValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentValue', Sort.asc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy>
      sortByCurrentValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentValue', Sort.desc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy> sortByImageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageId', Sort.asc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy> sortByImageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageId', Sort.desc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy> sortByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.asc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy>
      sortByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.desc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy>
      sortByPurchaseValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseValue', Sort.asc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy>
      sortByPurchaseValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseValue', Sort.desc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy> sortByWear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wear', Sort.asc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy> sortByWearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wear', Sort.desc);
    });
  }
}

extension CounterStrikeQuerySortThenBy
    on QueryBuilder<CounterStrike, CounterStrike, QSortThenBy> {
  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy> thenByBoughtAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boughtAt', Sort.asc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy>
      thenByBoughtAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boughtAt', Sort.desc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy>
      thenByCurrentValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentValue', Sort.asc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy>
      thenByCurrentValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentValue', Sort.desc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy> thenByImageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageId', Sort.asc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy> thenByImageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageId', Sort.desc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy> thenByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.asc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy>
      thenByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.desc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy>
      thenByPurchaseValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseValue', Sort.asc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy>
      thenByPurchaseValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseValue', Sort.desc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy> thenByWear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wear', Sort.asc);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QAfterSortBy> thenByWearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wear', Sort.desc);
    });
  }
}

extension CounterStrikeQueryWhereDistinct
    on QueryBuilder<CounterStrike, CounterStrike, QDistinct> {
  QueryBuilder<CounterStrike, CounterStrike, QDistinct> distinctByBoughtAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'boughtAt');
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QDistinct>
      distinctByCurrentValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentValue');
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QDistinct> distinctByImageId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QDistinct> distinctByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdate');
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QDistinct>
      distinctByPurchaseValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchaseValue');
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QDistinct> distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<CounterStrike, CounterStrike, QDistinct> distinctByWear(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wear', caseSensitive: caseSensitive);
    });
  }
}

extension CounterStrikeQueryProperty
    on QueryBuilder<CounterStrike, CounterStrike, QQueryProperty> {
  QueryBuilder<CounterStrike, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CounterStrike, DateTime, QQueryOperations> boughtAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'boughtAt');
    });
  }

  QueryBuilder<CounterStrike, double, QQueryOperations> currentValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentValue');
    });
  }

  QueryBuilder<CounterStrike, String, QQueryOperations> imageIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageId');
    });
  }

  QueryBuilder<CounterStrike, DateTime, QQueryOperations> lastUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdate');
    });
  }

  QueryBuilder<CounterStrike, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<CounterStrike, double, QQueryOperations>
      purchaseValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchaseValue');
    });
  }

  QueryBuilder<CounterStrike, int, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<CounterStrike, String?, QQueryOperations> wearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wear');
    });
  }
}
