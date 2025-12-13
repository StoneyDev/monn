// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'life_insurance.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLifeInsuranceCollection on Isar {
  IsarCollection<LifeInsurance> get lifeInsurances => this.collection();
}

const LifeInsuranceSchema = CollectionSchema(
  name: r'LifeInsurance',
  id: 5225617674796772145,
  properties: {
    r'interests': PropertySchema(
      id: 0,
      name: r'interests',
      type: IsarType.double,
    ),
    r'invested': PropertySchema(
      id: 1,
      name: r'invested',
      type: IsarType.double,
    ),
  },

  estimateSize: _lifeInsuranceEstimateSize,
  serialize: _lifeInsuranceSerialize,
  deserialize: _lifeInsuranceDeserialize,
  deserializeProp: _lifeInsuranceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _lifeInsuranceGetId,
  getLinks: _lifeInsuranceGetLinks,
  attach: _lifeInsuranceAttach,
  version: '3.3.0',
);

int _lifeInsuranceEstimateSize(
  LifeInsurance object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _lifeInsuranceSerialize(
  LifeInsurance object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.interests);
  writer.writeDouble(offsets[1], object.invested);
}

LifeInsurance _lifeInsuranceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LifeInsurance();
  object.id = id;
  object.interests = reader.readDouble(offsets[0]);
  object.invested = reader.readDouble(offsets[1]);
  return object;
}

P _lifeInsuranceDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _lifeInsuranceGetId(LifeInsurance object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _lifeInsuranceGetLinks(LifeInsurance object) {
  return [];
}

void _lifeInsuranceAttach(
  IsarCollection<dynamic> col,
  Id id,
  LifeInsurance object,
) {
  object.id = id;
}

extension LifeInsuranceQueryWhereSort
    on QueryBuilder<LifeInsurance, LifeInsurance, QWhere> {
  QueryBuilder<LifeInsurance, LifeInsurance, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LifeInsuranceQueryWhere
    on QueryBuilder<LifeInsurance, LifeInsurance, QWhereClause> {
  QueryBuilder<LifeInsurance, LifeInsurance, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension LifeInsuranceQueryFilter
    on QueryBuilder<LifeInsurance, LifeInsurance, QFilterCondition> {
  QueryBuilder<LifeInsurance, LifeInsurance, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterFilterCondition>
  interestsEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'interests',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterFilterCondition>
  interestsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'interests',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterFilterCondition>
  interestsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'interests',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterFilterCondition>
  interestsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'interests',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterFilterCondition>
  investedEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'invested',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterFilterCondition>
  investedGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'invested',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterFilterCondition>
  investedLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'invested',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterFilterCondition>
  investedBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'invested',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }
}

extension LifeInsuranceQueryObject
    on QueryBuilder<LifeInsurance, LifeInsurance, QFilterCondition> {}

extension LifeInsuranceQueryLinks
    on QueryBuilder<LifeInsurance, LifeInsurance, QFilterCondition> {}

extension LifeInsuranceQuerySortBy
    on QueryBuilder<LifeInsurance, LifeInsurance, QSortBy> {
  QueryBuilder<LifeInsurance, LifeInsurance, QAfterSortBy> sortByInterests() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interests', Sort.asc);
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterSortBy>
  sortByInterestsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interests', Sort.desc);
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterSortBy> sortByInvested() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invested', Sort.asc);
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterSortBy>
  sortByInvestedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invested', Sort.desc);
    });
  }
}

extension LifeInsuranceQuerySortThenBy
    on QueryBuilder<LifeInsurance, LifeInsurance, QSortThenBy> {
  QueryBuilder<LifeInsurance, LifeInsurance, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterSortBy> thenByInterests() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interests', Sort.asc);
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterSortBy>
  thenByInterestsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interests', Sort.desc);
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterSortBy> thenByInvested() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invested', Sort.asc);
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QAfterSortBy>
  thenByInvestedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invested', Sort.desc);
    });
  }
}

extension LifeInsuranceQueryWhereDistinct
    on QueryBuilder<LifeInsurance, LifeInsurance, QDistinct> {
  QueryBuilder<LifeInsurance, LifeInsurance, QDistinct> distinctByInterests() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'interests');
    });
  }

  QueryBuilder<LifeInsurance, LifeInsurance, QDistinct> distinctByInvested() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invested');
    });
  }
}

extension LifeInsuranceQueryProperty
    on QueryBuilder<LifeInsurance, LifeInsurance, QQueryProperty> {
  QueryBuilder<LifeInsurance, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LifeInsurance, double, QQueryOperations> interestsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'interests');
    });
  }

  QueryBuilder<LifeInsurance, double, QQueryOperations> investedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invested');
    });
  }
}
