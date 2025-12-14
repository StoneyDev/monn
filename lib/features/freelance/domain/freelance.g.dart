// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freelance.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFreelanceCollection on Isar {
  IsarCollection<Freelance> get freelances => this.collection();
}

const FreelanceSchema = CollectionSchema(
  name: r'Freelance',
  id: 829203357787171595,
  properties: {
    r'annualRevenue': PropertySchema(
      id: 0,
      name: r'annualRevenue',
      type: IsarType.double,
    ),
  },

  estimateSize: _freelanceEstimateSize,
  serialize: _freelanceSerialize,
  deserialize: _freelanceDeserialize,
  deserializeProp: _freelanceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _freelanceGetId,
  getLinks: _freelanceGetLinks,
  attach: _freelanceAttach,
  version: '3.3.0',
);

int _freelanceEstimateSize(
  Freelance object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _freelanceSerialize(
  Freelance object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.annualRevenue);
}

Freelance _freelanceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Freelance();
  object.annualRevenue = reader.readDouble(offsets[0]);
  object.id = id;
  return object;
}

P _freelanceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _freelanceGetId(Freelance object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _freelanceGetLinks(Freelance object) {
  return [];
}

void _freelanceAttach(IsarCollection<dynamic> col, Id id, Freelance object) {
  object.id = id;
}

extension FreelanceQueryWhereSort
    on QueryBuilder<Freelance, Freelance, QWhere> {
  QueryBuilder<Freelance, Freelance, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FreelanceQueryWhere
    on QueryBuilder<Freelance, Freelance, QWhereClause> {
  QueryBuilder<Freelance, Freelance, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Freelance, Freelance, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Freelance, Freelance, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Freelance, Freelance, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Freelance, Freelance, QAfterWhereClause> idBetween(
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

extension FreelanceQueryFilter
    on QueryBuilder<Freelance, Freelance, QFilterCondition> {
  QueryBuilder<Freelance, Freelance, QAfterFilterCondition>
  annualRevenueEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'annualRevenue',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Freelance, Freelance, QAfterFilterCondition>
  annualRevenueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'annualRevenue',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Freelance, Freelance, QAfterFilterCondition>
  annualRevenueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'annualRevenue',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Freelance, Freelance, QAfterFilterCondition>
  annualRevenueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'annualRevenue',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Freelance, Freelance, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Freelance, Freelance, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Freelance, Freelance, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Freelance, Freelance, QAfterFilterCondition> idBetween(
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
}

extension FreelanceQueryObject
    on QueryBuilder<Freelance, Freelance, QFilterCondition> {}

extension FreelanceQueryLinks
    on QueryBuilder<Freelance, Freelance, QFilterCondition> {}

extension FreelanceQuerySortBy on QueryBuilder<Freelance, Freelance, QSortBy> {
  QueryBuilder<Freelance, Freelance, QAfterSortBy> sortByAnnualRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualRevenue', Sort.asc);
    });
  }

  QueryBuilder<Freelance, Freelance, QAfterSortBy> sortByAnnualRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualRevenue', Sort.desc);
    });
  }
}

extension FreelanceQuerySortThenBy
    on QueryBuilder<Freelance, Freelance, QSortThenBy> {
  QueryBuilder<Freelance, Freelance, QAfterSortBy> thenByAnnualRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualRevenue', Sort.asc);
    });
  }

  QueryBuilder<Freelance, Freelance, QAfterSortBy> thenByAnnualRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualRevenue', Sort.desc);
    });
  }

  QueryBuilder<Freelance, Freelance, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Freelance, Freelance, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension FreelanceQueryWhereDistinct
    on QueryBuilder<Freelance, Freelance, QDistinct> {
  QueryBuilder<Freelance, Freelance, QDistinct> distinctByAnnualRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'annualRevenue');
    });
  }
}

extension FreelanceQueryProperty
    on QueryBuilder<Freelance, Freelance, QQueryProperty> {
  QueryBuilder<Freelance, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Freelance, double, QQueryOperations> annualRevenueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'annualRevenue');
    });
  }
}
