// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'per.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPerCollection on Isar {
  IsarCollection<Per> get pers => this.collection();
}

const PerSchema = CollectionSchema(
  name: r'Per',
  id: 2416036492035336479,
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

  estimateSize: _perEstimateSize,
  serialize: _perSerialize,
  deserialize: _perDeserialize,
  deserializeProp: _perDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _perGetId,
  getLinks: _perGetLinks,
  attach: _perAttach,
  version: '3.3.0',
);

int _perEstimateSize(
  Per object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _perSerialize(
  Per object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.interests);
  writer.writeDouble(offsets[1], object.invested);
}

Per _perDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Per();
  object.id = id;
  object.interests = reader.readDouble(offsets[0]);
  object.invested = reader.readDouble(offsets[1]);
  return object;
}

P _perDeserializeProp<P>(
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

Id _perGetId(Per object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _perGetLinks(Per object) {
  return [];
}

void _perAttach(IsarCollection<dynamic> col, Id id, Per object) {
  object.id = id;
}

extension PerQueryWhereSort on QueryBuilder<Per, Per, QWhere> {
  QueryBuilder<Per, Per, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PerQueryWhere on QueryBuilder<Per, Per, QWhereClause> {
  QueryBuilder<Per, Per, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Per, Per, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Per, Per, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Per, Per, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Per, Per, QAfterWhereClause> idBetween(
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

extension PerQueryFilter on QueryBuilder<Per, Per, QFilterCondition> {
  QueryBuilder<Per, Per, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Per, Per, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
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

  QueryBuilder<Per, Per, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Per, Per, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Per, Per, QAfterFilterCondition> interestsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
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

  QueryBuilder<Per, Per, QAfterFilterCondition> interestsGreaterThan(
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

  QueryBuilder<Per, Per, QAfterFilterCondition> interestsLessThan(
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

  QueryBuilder<Per, Per, QAfterFilterCondition> interestsBetween(
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

  QueryBuilder<Per, Per, QAfterFilterCondition> investedEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
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

  QueryBuilder<Per, Per, QAfterFilterCondition> investedGreaterThan(
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

  QueryBuilder<Per, Per, QAfterFilterCondition> investedLessThan(
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

  QueryBuilder<Per, Per, QAfterFilterCondition> investedBetween(
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

extension PerQueryObject on QueryBuilder<Per, Per, QFilterCondition> {}

extension PerQueryLinks on QueryBuilder<Per, Per, QFilterCondition> {}

extension PerQuerySortBy on QueryBuilder<Per, Per, QSortBy> {
  QueryBuilder<Per, Per, QAfterSortBy> sortByInterests() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interests', Sort.asc);
    });
  }

  QueryBuilder<Per, Per, QAfterSortBy> sortByInterestsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interests', Sort.desc);
    });
  }

  QueryBuilder<Per, Per, QAfterSortBy> sortByInvested() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invested', Sort.asc);
    });
  }

  QueryBuilder<Per, Per, QAfterSortBy> sortByInvestedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invested', Sort.desc);
    });
  }
}

extension PerQuerySortThenBy on QueryBuilder<Per, Per, QSortThenBy> {
  QueryBuilder<Per, Per, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Per, Per, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Per, Per, QAfterSortBy> thenByInterests() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interests', Sort.asc);
    });
  }

  QueryBuilder<Per, Per, QAfterSortBy> thenByInterestsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interests', Sort.desc);
    });
  }

  QueryBuilder<Per, Per, QAfterSortBy> thenByInvested() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invested', Sort.asc);
    });
  }

  QueryBuilder<Per, Per, QAfterSortBy> thenByInvestedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invested', Sort.desc);
    });
  }
}

extension PerQueryWhereDistinct on QueryBuilder<Per, Per, QDistinct> {
  QueryBuilder<Per, Per, QDistinct> distinctByInterests() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'interests');
    });
  }

  QueryBuilder<Per, Per, QDistinct> distinctByInvested() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invested');
    });
  }
}

extension PerQueryProperty on QueryBuilder<Per, Per, QQueryProperty> {
  QueryBuilder<Per, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Per, double, QQueryOperations> interestsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'interests');
    });
  }

  QueryBuilder<Per, double, QQueryOperations> investedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invested');
    });
  }
}
