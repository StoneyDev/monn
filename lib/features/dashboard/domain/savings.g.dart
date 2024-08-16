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
    r'income': PropertySchema(
      id: 0,
      name: r'income',
      type: IsarType.double,
    ),
    r'startAmount': PropertySchema(
      id: 1,
      name: r'startAmount',
      type: IsarType.double,
    ),
    r'type': PropertySchema(
      id: 2,
      name: r'type',
      type: IsarType.byte,
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
  version: '3.1.7',
);

int _savingsEstimateSize(
  Savings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _savingsSerialize(
  Savings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.income);
  writer.writeDouble(offsets[1], object.startAmount);
  writer.writeByte(offsets[2], object.type.index);
}

Savings _savingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Savings(
    id: id,
    income: reader.readDouble(offsets[0]),
    startAmount: reader.readDouble(offsets[1]),
    type: _SavingstypeValueEnumMap[reader.readByteOrNull(offsets[2])] ??
        SavingsType.bookletA,
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
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (_SavingstypeValueEnumMap[reader.readByteOrNull(offset)] ??
          SavingsType.bookletA) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SavingstypeEnumValueMap = {
  'bookletA': 0,
  'bookletSSD': 1,
  'crowdfunding': 2,
  'cryptocurrency': 3,
  'csknives': 4,
  'cto': 5,
  'lifeInsurance': 6,
  'pea': 7,
  'reit': 8,
  'rip': 9,
};
const _SavingstypeValueEnumMap = {
  0: SavingsType.bookletA,
  1: SavingsType.bookletSSD,
  2: SavingsType.crowdfunding,
  3: SavingsType.cryptocurrency,
  4: SavingsType.csknives,
  5: SavingsType.cto,
  6: SavingsType.lifeInsurance,
  7: SavingsType.pea,
  8: SavingsType.reit,
  9: SavingsType.rip,
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

  QueryBuilder<Savings, Savings, QAfterFilterCondition> incomeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'income',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> incomeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'income',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> incomeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'income',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> incomeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'income',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> startAmountEqualTo(
    double value, {
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
    double value, {
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
    double value, {
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
    double lower,
    double upper, {
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
      SavingsType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> typeGreaterThan(
    SavingsType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> typeLessThan(
    SavingsType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Savings, Savings, QAfterFilterCondition> typeBetween(
    SavingsType lower,
    SavingsType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SavingsQueryObject
    on QueryBuilder<Savings, Savings, QFilterCondition> {}

extension SavingsQueryLinks
    on QueryBuilder<Savings, Savings, QFilterCondition> {}

extension SavingsQuerySortBy on QueryBuilder<Savings, Savings, QSortBy> {
  QueryBuilder<Savings, Savings, QAfterSortBy> sortByIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income', Sort.asc);
    });
  }

  QueryBuilder<Savings, Savings, QAfterSortBy> sortByIncomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income', Sort.desc);
    });
  }

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

  QueryBuilder<Savings, Savings, QAfterSortBy> thenByIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income', Sort.asc);
    });
  }

  QueryBuilder<Savings, Savings, QAfterSortBy> thenByIncomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income', Sort.desc);
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
  QueryBuilder<Savings, Savings, QDistinct> distinctByIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'income');
    });
  }

  QueryBuilder<Savings, Savings, QDistinct> distinctByStartAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startAmount');
    });
  }

  QueryBuilder<Savings, Savings, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
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

  QueryBuilder<Savings, double, QQueryOperations> incomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'income');
    });
  }

  QueryBuilder<Savings, double, QQueryOperations> startAmountProperty() {
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
