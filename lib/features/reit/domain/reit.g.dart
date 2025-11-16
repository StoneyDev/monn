// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reit.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReitCollection on Isar {
  IsarCollection<Reit> get reits => this.collection();
}

const ReitSchema = CollectionSchema(
  name: r'Reit',
  id: -636743457645672575,
  properties: {
    r'boughtOn': PropertySchema(
      id: 0,
      name: r'boughtOn',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(id: 1, name: r'name', type: IsarType.string),
    r'price': PropertySchema(id: 2, name: r'price', type: IsarType.double),
    r'shares': PropertySchema(id: 3, name: r'shares', type: IsarType.long),
  },

  estimateSize: _reitEstimateSize,
  serialize: _reitSerialize,
  deserialize: _reitDeserialize,
  deserializeProp: _reitDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'dividends': LinkSchema(
      id: 2866028557231016047,
      name: r'dividends',
      target: r'ReitDividend',
      single: false,
    ),
  },
  embeddedSchemas: {},

  getId: _reitGetId,
  getLinks: _reitGetLinks,
  attach: _reitAttach,
  version: '3.3.0',
);

int _reitEstimateSize(
  Reit object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _reitSerialize(
  Reit object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.boughtOn);
  writer.writeString(offsets[1], object.name);
  writer.writeDouble(offsets[2], object.price);
  writer.writeLong(offsets[3], object.shares);
}

Reit _reitDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Reit();
  object.boughtOn = reader.readDateTime(offsets[0]);
  object.id = id;
  object.name = reader.readString(offsets[1]);
  object.price = reader.readDouble(offsets[2]);
  object.shares = reader.readLong(offsets[3]);
  return object;
}

P _reitDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _reitGetId(Reit object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _reitGetLinks(Reit object) {
  return [object.dividends];
}

void _reitAttach(IsarCollection<dynamic> col, Id id, Reit object) {
  object.id = id;
  object.dividends.attach(
    col,
    col.isar.collection<ReitDividend>(),
    r'dividends',
    id,
  );
}

extension ReitQueryWhereSort on QueryBuilder<Reit, Reit, QWhere> {
  QueryBuilder<Reit, Reit, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ReitQueryWhere on QueryBuilder<Reit, Reit, QWhereClause> {
  QueryBuilder<Reit, Reit, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Reit, Reit, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Reit, Reit, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterWhereClause> idBetween(
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

extension ReitQueryFilter on QueryBuilder<Reit, Reit, QFilterCondition> {
  QueryBuilder<Reit, Reit, QAfterFilterCondition> boughtOnEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'boughtOn', value: value),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> boughtOnGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'boughtOn',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> boughtOnLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'boughtOn',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> boughtOnBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'boughtOn',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'id'),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'id'),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> idGreaterThan(
    Id? value, {
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

  QueryBuilder<Reit, Reit, QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<Reit, Reit, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<Reit, Reit, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> nameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> priceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'price',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> priceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'price',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> priceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'price',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> priceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'price',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> sharesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'shares', value: value),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> sharesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'shares',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> sharesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'shares',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> sharesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'shares',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ReitQueryObject on QueryBuilder<Reit, Reit, QFilterCondition> {}

extension ReitQueryLinks on QueryBuilder<Reit, Reit, QFilterCondition> {
  QueryBuilder<Reit, Reit, QAfterFilterCondition> dividends(
    FilterQuery<ReitDividend> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'dividends');
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> dividendsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'dividends', length, true, length, true);
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> dividendsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'dividends', 0, true, 0, true);
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> dividendsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'dividends', 0, false, 999999, true);
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> dividendsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'dividends', 0, true, length, include);
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> dividendsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'dividends', length, include, 999999, true);
    });
  }

  QueryBuilder<Reit, Reit, QAfterFilterCondition> dividendsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
        r'dividends',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ReitQuerySortBy on QueryBuilder<Reit, Reit, QSortBy> {
  QueryBuilder<Reit, Reit, QAfterSortBy> sortByBoughtOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boughtOn', Sort.asc);
    });
  }

  QueryBuilder<Reit, Reit, QAfterSortBy> sortByBoughtOnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boughtOn', Sort.desc);
    });
  }

  QueryBuilder<Reit, Reit, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Reit, Reit, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Reit, Reit, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<Reit, Reit, QAfterSortBy> sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<Reit, Reit, QAfterSortBy> sortByShares() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shares', Sort.asc);
    });
  }

  QueryBuilder<Reit, Reit, QAfterSortBy> sortBySharesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shares', Sort.desc);
    });
  }
}

extension ReitQuerySortThenBy on QueryBuilder<Reit, Reit, QSortThenBy> {
  QueryBuilder<Reit, Reit, QAfterSortBy> thenByBoughtOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boughtOn', Sort.asc);
    });
  }

  QueryBuilder<Reit, Reit, QAfterSortBy> thenByBoughtOnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boughtOn', Sort.desc);
    });
  }

  QueryBuilder<Reit, Reit, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Reit, Reit, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Reit, Reit, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Reit, Reit, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Reit, Reit, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<Reit, Reit, QAfterSortBy> thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<Reit, Reit, QAfterSortBy> thenByShares() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shares', Sort.asc);
    });
  }

  QueryBuilder<Reit, Reit, QAfterSortBy> thenBySharesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shares', Sort.desc);
    });
  }
}

extension ReitQueryWhereDistinct on QueryBuilder<Reit, Reit, QDistinct> {
  QueryBuilder<Reit, Reit, QDistinct> distinctByBoughtOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'boughtOn');
    });
  }

  QueryBuilder<Reit, Reit, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Reit, Reit, QDistinct> distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<Reit, Reit, QDistinct> distinctByShares() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shares');
    });
  }
}

extension ReitQueryProperty on QueryBuilder<Reit, Reit, QQueryProperty> {
  QueryBuilder<Reit, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Reit, DateTime, QQueryOperations> boughtOnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'boughtOn');
    });
  }

  QueryBuilder<Reit, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Reit, double, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<Reit, int, QQueryOperations> sharesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shares');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReitDividendCollection on Isar {
  IsarCollection<ReitDividend> get reitDividends => this.collection();
}

const ReitDividendSchema = CollectionSchema(
  name: r'ReitDividend',
  id: 1657365802072717448,
  properties: {
    r'amount': PropertySchema(id: 0, name: r'amount', type: IsarType.double),
    r'receivedAt': PropertySchema(
      id: 1,
      name: r'receivedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _reitDividendEstimateSize,
  serialize: _reitDividendSerialize,
  deserialize: _reitDividendDeserialize,
  deserializeProp: _reitDividendDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _reitDividendGetId,
  getLinks: _reitDividendGetLinks,
  attach: _reitDividendAttach,
  version: '3.3.0',
);

int _reitDividendEstimateSize(
  ReitDividend object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _reitDividendSerialize(
  ReitDividend object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeDateTime(offsets[1], object.receivedAt);
}

ReitDividend _reitDividendDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReitDividend();
  object.amount = reader.readDouble(offsets[0]);
  object.id = id;
  object.receivedAt = reader.readDateTime(offsets[1]);
  return object;
}

P _reitDividendDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _reitDividendGetId(ReitDividend object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _reitDividendGetLinks(ReitDividend object) {
  return [];
}

void _reitDividendAttach(
  IsarCollection<dynamic> col,
  Id id,
  ReitDividend object,
) {
  object.id = id;
}

extension ReitDividendQueryWhereSort
    on QueryBuilder<ReitDividend, ReitDividend, QWhere> {
  QueryBuilder<ReitDividend, ReitDividend, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ReitDividendQueryWhere
    on QueryBuilder<ReitDividend, ReitDividend, QWhereClause> {
  QueryBuilder<ReitDividend, ReitDividend, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ReitDividend, ReitDividend, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterWhereClause> idBetween(
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

extension ReitDividendQueryFilter
    on QueryBuilder<ReitDividend, ReitDividend, QFilterCondition> {
  QueryBuilder<ReitDividend, ReitDividend, QAfterFilterCondition> amountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'amount',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterFilterCondition>
  amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'amount',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterFilterCondition>
  amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'amount',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterFilterCondition> amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'amount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'id'),
      );
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterFilterCondition>
  idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'id'),
      );
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterFilterCondition> idEqualTo(
    Id? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterFilterCondition> idGreaterThan(
    Id? value, {
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

  QueryBuilder<ReitDividend, ReitDividend, QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<ReitDividend, ReitDividend, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<ReitDividend, ReitDividend, QAfterFilterCondition>
  receivedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'receivedAt', value: value),
      );
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterFilterCondition>
  receivedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'receivedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterFilterCondition>
  receivedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'receivedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterFilterCondition>
  receivedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'receivedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ReitDividendQueryObject
    on QueryBuilder<ReitDividend, ReitDividend, QFilterCondition> {}

extension ReitDividendQueryLinks
    on QueryBuilder<ReitDividend, ReitDividend, QFilterCondition> {}

extension ReitDividendQuerySortBy
    on QueryBuilder<ReitDividend, ReitDividend, QSortBy> {
  QueryBuilder<ReitDividend, ReitDividend, QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterSortBy> sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterSortBy> sortByReceivedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedAt', Sort.asc);
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterSortBy>
  sortByReceivedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedAt', Sort.desc);
    });
  }
}

extension ReitDividendQuerySortThenBy
    on QueryBuilder<ReitDividend, ReitDividend, QSortThenBy> {
  QueryBuilder<ReitDividend, ReitDividend, QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterSortBy> thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterSortBy> thenByReceivedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedAt', Sort.asc);
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QAfterSortBy>
  thenByReceivedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedAt', Sort.desc);
    });
  }
}

extension ReitDividendQueryWhereDistinct
    on QueryBuilder<ReitDividend, ReitDividend, QDistinct> {
  QueryBuilder<ReitDividend, ReitDividend, QDistinct> distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<ReitDividend, ReitDividend, QDistinct> distinctByReceivedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receivedAt');
    });
  }
}

extension ReitDividendQueryProperty
    on QueryBuilder<ReitDividend, ReitDividend, QQueryProperty> {
  QueryBuilder<ReitDividend, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReitDividend, double, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<ReitDividend, DateTime, QQueryOperations> receivedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receivedAt');
    });
  }
}
