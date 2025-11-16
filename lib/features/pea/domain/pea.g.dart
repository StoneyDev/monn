// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pea.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPeaCollection on Isar {
  IsarCollection<Pea> get peas => this.collection();
}

const PeaSchema = CollectionSchema(
  name: r'Pea',
  id: 5723906190007623028,
  properties: {
    r'costAverage': PropertySchema(
      id: 0,
      name: r'costAverage',
      type: IsarType.double,
    ),
    r'equity': PropertySchema(id: 1, name: r'equity', type: IsarType.long),
    r'lastPrice': PropertySchema(
      id: 2,
      name: r'lastPrice',
      type: IsarType.double,
    ),
    r'lastUpdate': PropertySchema(
      id: 3,
      name: r'lastUpdate',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _peaEstimateSize,
  serialize: _peaSerialize,
  deserialize: _peaDeserialize,
  deserializeProp: _peaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _peaGetId,
  getLinks: _peaGetLinks,
  attach: _peaAttach,
  version: '3.3.0',
);

int _peaEstimateSize(
  Pea object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _peaSerialize(
  Pea object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.costAverage);
  writer.writeLong(offsets[1], object.equity);
  writer.writeDouble(offsets[2], object.lastPrice);
  writer.writeDateTime(offsets[3], object.lastUpdate);
}

Pea _peaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Pea();
  object.costAverage = reader.readDoubleOrNull(offsets[0]);
  object.equity = reader.readLongOrNull(offsets[1]);
  object.id = id;
  object.lastPrice = reader.readDoubleOrNull(offsets[2]);
  object.lastUpdate = reader.readDateTimeOrNull(offsets[3]);
  return object;
}

P _peaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _peaGetId(Pea object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _peaGetLinks(Pea object) {
  return [];
}

void _peaAttach(IsarCollection<dynamic> col, Id id, Pea object) {
  object.id = id;
}

extension PeaQueryWhereSort on QueryBuilder<Pea, Pea, QWhere> {
  QueryBuilder<Pea, Pea, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PeaQueryWhere on QueryBuilder<Pea, Pea, QWhereClause> {
  QueryBuilder<Pea, Pea, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Pea, Pea, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Pea, Pea, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterWhereClause> idBetween(
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

extension PeaQueryFilter on QueryBuilder<Pea, Pea, QFilterCondition> {
  QueryBuilder<Pea, Pea, QAfterFilterCondition> costAverageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'costAverage'),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> costAverageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'costAverage'),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> costAverageEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'costAverage',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> costAverageGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'costAverage',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> costAverageLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'costAverage',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> costAverageBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'costAverage',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> equityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'equity'),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> equityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'equity'),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> equityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'equity', value: value),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> equityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'equity',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> equityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'equity',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> equityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'equity',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Pea, Pea, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Pea, Pea, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Pea, Pea, QAfterFilterCondition> lastPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastPrice'),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> lastPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastPrice'),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> lastPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lastPrice',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> lastPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastPrice',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> lastPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastPrice',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> lastPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastPrice',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> lastUpdateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastUpdate'),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> lastUpdateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastUpdate'),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> lastUpdateEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastUpdate', value: value),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> lastUpdateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastUpdate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> lastUpdateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastUpdate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Pea, Pea, QAfterFilterCondition> lastUpdateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastUpdate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension PeaQueryObject on QueryBuilder<Pea, Pea, QFilterCondition> {}

extension PeaQueryLinks on QueryBuilder<Pea, Pea, QFilterCondition> {}

extension PeaQuerySortBy on QueryBuilder<Pea, Pea, QSortBy> {
  QueryBuilder<Pea, Pea, QAfterSortBy> sortByCostAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costAverage', Sort.asc);
    });
  }

  QueryBuilder<Pea, Pea, QAfterSortBy> sortByCostAverageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costAverage', Sort.desc);
    });
  }

  QueryBuilder<Pea, Pea, QAfterSortBy> sortByEquity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equity', Sort.asc);
    });
  }

  QueryBuilder<Pea, Pea, QAfterSortBy> sortByEquityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equity', Sort.desc);
    });
  }

  QueryBuilder<Pea, Pea, QAfterSortBy> sortByLastPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPrice', Sort.asc);
    });
  }

  QueryBuilder<Pea, Pea, QAfterSortBy> sortByLastPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPrice', Sort.desc);
    });
  }

  QueryBuilder<Pea, Pea, QAfterSortBy> sortByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.asc);
    });
  }

  QueryBuilder<Pea, Pea, QAfterSortBy> sortByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.desc);
    });
  }
}

extension PeaQuerySortThenBy on QueryBuilder<Pea, Pea, QSortThenBy> {
  QueryBuilder<Pea, Pea, QAfterSortBy> thenByCostAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costAverage', Sort.asc);
    });
  }

  QueryBuilder<Pea, Pea, QAfterSortBy> thenByCostAverageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costAverage', Sort.desc);
    });
  }

  QueryBuilder<Pea, Pea, QAfterSortBy> thenByEquity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equity', Sort.asc);
    });
  }

  QueryBuilder<Pea, Pea, QAfterSortBy> thenByEquityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equity', Sort.desc);
    });
  }

  QueryBuilder<Pea, Pea, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Pea, Pea, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Pea, Pea, QAfterSortBy> thenByLastPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPrice', Sort.asc);
    });
  }

  QueryBuilder<Pea, Pea, QAfterSortBy> thenByLastPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPrice', Sort.desc);
    });
  }

  QueryBuilder<Pea, Pea, QAfterSortBy> thenByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.asc);
    });
  }

  QueryBuilder<Pea, Pea, QAfterSortBy> thenByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.desc);
    });
  }
}

extension PeaQueryWhereDistinct on QueryBuilder<Pea, Pea, QDistinct> {
  QueryBuilder<Pea, Pea, QDistinct> distinctByCostAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'costAverage');
    });
  }

  QueryBuilder<Pea, Pea, QDistinct> distinctByEquity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equity');
    });
  }

  QueryBuilder<Pea, Pea, QDistinct> distinctByLastPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastPrice');
    });
  }

  QueryBuilder<Pea, Pea, QDistinct> distinctByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdate');
    });
  }
}

extension PeaQueryProperty on QueryBuilder<Pea, Pea, QQueryProperty> {
  QueryBuilder<Pea, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Pea, double?, QQueryOperations> costAverageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'costAverage');
    });
  }

  QueryBuilder<Pea, int?, QQueryOperations> equityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equity');
    });
  }

  QueryBuilder<Pea, double?, QQueryOperations> lastPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastPrice');
    });
  }

  QueryBuilder<Pea, DateTime?, QQueryOperations> lastUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdate');
    });
  }
}
