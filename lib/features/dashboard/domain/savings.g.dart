// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSavingsCollection on Isar {
  IsarCollection<Savings> get savings => this.collection();
}

const SavingsSchema = CollectionSchema(
  name: r'Savings',
  id: 792239108590555903,
  properties: {
    r'startAmount': PropertySchema(
      id: 0,
      name: r'startAmount',
      type: IsarType.double,
    ),
    r'type': PropertySchema(
      id: 1,
      name: r'type',
      type: IsarType.string,
      enumMap: _SavingstypeEnumValueMap,
    )
  },
  estimateSize: _savingsEstimateSize,
  serialize: _savingsSerialize,
  deserialize: _savingsDeserialize,
  deserializeProp: _savingsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _savingsGetId,
  getLinks: _savingsGetLinks,
  attach: _savingsAttach,
  version: '3.1.8',
);

int _savingsEstimateSize(
  Savings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _savingsSerialize(
  Savings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.startAmount);
  writer.writeString(offsets[1], object.type.name);
}

Savings _savingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Savings(
    id: id,
    startAmount: reader.readDoubleOrNull(offsets[0]),
    type: _SavingstypeValueEnumMap[reader.readStringOrNull(offsets[1])] ??
        SavingsType.savingsBook,
  );
  return object;
}

P _savingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (_SavingstypeValueEnumMap[reader.readStringOrNull(offset)] ??
          SavingsType.savingsBook) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SavingstypeEnumValueMap = {
  r'savingsBook': r'savingsBook',
  r'crowdfunding': r'crowdfunding',
  r'cryptocurrency': r'cryptocurrency',
  r'csKnives': r'csKnives',
  r'pea': r'pea',
  r'reit': r'reit',
};
const _SavingstypeValueEnumMap = {
  r'savingsBook': SavingsType.savingsBook,
  r'crowdfunding': SavingsType.crowdfunding,
  r'cryptocurrency': SavingsType.cryptocurrency,
  r'csKnives': SavingsType.csKnives,
  r'pea': SavingsType.pea,
  r'reit': SavingsType.reit,
};

Id _savingsGetId(Savings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _savingsGetLinks(Savings object) {
  return [];
}

void _savingsAttach(IsarCollection<dynamic> col, Id id, Savings object) {}

extension SavingsQueryWhereSort on QueryBuilder<Savings, Savings, QWhere> {
  QueryBuilder<Savings, Savings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SavingsQueryWhere on QueryBuilder<Savings, Savings, QWhereClause> {
  QueryBuilder<Savings, Savings, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Savings, Savings, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Savings, Savings, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Savings, Savings, QAfterWhereClause> idBetween(
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

extension SavingsQueryFilter
    on QueryBuilder<Savings, Savings, QFilterCondition> {
  QueryBuilder<Savings, Savings, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Savings, Savings, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Savings, Savings, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Savings, Savings, QAfterFilterCondition> startAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startAmount',
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> startAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startAmount',
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> startAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> startAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> startAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> startAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> typeEqualTo(
    SavingsType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> typeGreaterThan(
    SavingsType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> typeLessThan(
    SavingsType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> typeBetween(
    SavingsType lower,
    SavingsType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> typeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension SavingsQueryObject
    on QueryBuilder<Savings, Savings, QFilterCondition> {}

extension SavingsQueryLinks
    on QueryBuilder<Savings, Savings, QFilterCondition> {}

extension SavingsQuerySortBy on QueryBuilder<Savings, Savings, QSortBy> {
  QueryBuilder<Savings, Savings, QAfterSortBy> sortByStartAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAmount', Sort.asc);
    });
  }

  QueryBuilder<Savings, Savings, QAfterSortBy> sortByStartAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAmount', Sort.desc);
    });
  }

  QueryBuilder<Savings, Savings, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Savings, Savings, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension SavingsQuerySortThenBy
    on QueryBuilder<Savings, Savings, QSortThenBy> {
  QueryBuilder<Savings, Savings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Savings, Savings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Savings, Savings, QAfterSortBy> thenByStartAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAmount', Sort.asc);
    });
  }

  QueryBuilder<Savings, Savings, QAfterSortBy> thenByStartAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAmount', Sort.desc);
    });
  }

  QueryBuilder<Savings, Savings, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Savings, Savings, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension SavingsQueryWhereDistinct
    on QueryBuilder<Savings, Savings, QDistinct> {
  QueryBuilder<Savings, Savings, QDistinct> distinctByStartAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startAmount');
    });
  }

  QueryBuilder<Savings, Savings, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension SavingsQueryProperty
    on QueryBuilder<Savings, Savings, QQueryProperty> {
  QueryBuilder<Savings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Savings, double?, QQueryOperations> startAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startAmount');
    });
  }

  QueryBuilder<Savings, SavingsType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
