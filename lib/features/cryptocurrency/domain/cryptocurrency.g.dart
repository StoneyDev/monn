// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cryptocurrency.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCryptocurrencyCollection on Isar {
  IsarCollection<Cryptocurrency> get cryptocurrencys => this.collection();
}

const CryptocurrencySchema = CollectionSchema(
  name: r'Cryptocurrency',
  id: 5620952694823968014,
  properties: {
    r'lastUpdate': PropertySchema(
      id: 0,
      name: r'lastUpdate',
      type: IsarType.dateTime,
    ),
    r'priceMarket': PropertySchema(
      id: 1,
      name: r'priceMarket',
      type: IsarType.double,
    ),
    r'totalCrypto': PropertySchema(
      id: 2,
      name: r'totalCrypto',
      type: IsarType.double,
    ),
    r'type': PropertySchema(
      id: 3,
      name: r'type',
      type: IsarType.string,
      enumMap: _CryptocurrencytypeEnumValueMap,
    )
  },
  estimateSize: _cryptocurrencyEstimateSize,
  serialize: _cryptocurrencySerialize,
  deserialize: _cryptocurrencyDeserialize,
  deserializeProp: _cryptocurrencyDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'transactions': LinkSchema(
      id: 7967137908181561228,
      name: r'transactions',
      target: r'CryptocurrencyTransaction',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _cryptocurrencyGetId,
  getLinks: _cryptocurrencyGetLinks,
  attach: _cryptocurrencyAttach,
  version: '3.1.8',
);

int _cryptocurrencyEstimateSize(
  Cryptocurrency object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _cryptocurrencySerialize(
  Cryptocurrency object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.lastUpdate);
  writer.writeDouble(offsets[1], object.priceMarket);
  writer.writeDouble(offsets[2], object.totalCrypto);
  writer.writeString(offsets[3], object.type.name);
}

Cryptocurrency _cryptocurrencyDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Cryptocurrency();
  object.id = id;
  object.lastUpdate = reader.readDateTimeOrNull(offsets[0]);
  object.priceMarket = reader.readDouble(offsets[1]);
  object.totalCrypto = reader.readDouble(offsets[2]);
  object.type =
      _CryptocurrencytypeValueEnumMap[reader.readStringOrNull(offsets[3])] ??
          CryptoType.bitcoin;
  return object;
}

P _cryptocurrencyDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (_CryptocurrencytypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          CryptoType.bitcoin) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CryptocurrencytypeEnumValueMap = {
  r'bitcoin': r'bitcoin',
  r'ethereum': r'ethereum',
  r'chainlink': r'chainlink',
  r'tether': r'tether',
  r'usdCoin': r'usdCoin',
};
const _CryptocurrencytypeValueEnumMap = {
  r'bitcoin': CryptoType.bitcoin,
  r'ethereum': CryptoType.ethereum,
  r'chainlink': CryptoType.chainlink,
  r'tether': CryptoType.tether,
  r'usdCoin': CryptoType.usdCoin,
};

Id _cryptocurrencyGetId(Cryptocurrency object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _cryptocurrencyGetLinks(Cryptocurrency object) {
  return [object.transactions];
}

void _cryptocurrencyAttach(
    IsarCollection<dynamic> col, Id id, Cryptocurrency object) {
  object.id = id;
  object.transactions.attach(col,
      col.isar.collection<CryptocurrencyTransaction>(), r'transactions', id);
}

extension CryptocurrencyQueryWhereSort
    on QueryBuilder<Cryptocurrency, Cryptocurrency, QWhere> {
  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CryptocurrencyQueryWhere
    on QueryBuilder<Cryptocurrency, Cryptocurrency, QWhereClause> {
  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterWhereClause> idBetween(
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

extension CryptocurrencyQueryFilter
    on QueryBuilder<Cryptocurrency, Cryptocurrency, QFilterCondition> {
  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
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

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      idLessThan(
    Id? value, {
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

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      lastUpdateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUpdate',
      ));
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      lastUpdateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUpdate',
      ));
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      lastUpdateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      lastUpdateGreaterThan(
    DateTime? value, {
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

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      lastUpdateLessThan(
    DateTime? value, {
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

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      lastUpdateBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      priceMarketEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceMarket',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      priceMarketGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceMarket',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      priceMarketLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceMarket',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      priceMarketBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceMarket',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      totalCryptoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCrypto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      totalCryptoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCrypto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      totalCryptoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCrypto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      totalCryptoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCrypto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      typeEqualTo(
    CryptoType value, {
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

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      typeGreaterThan(
    CryptoType value, {
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

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      typeLessThan(
    CryptoType value, {
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

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      typeBetween(
    CryptoType lower,
    CryptoType upper, {
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

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      typeStartsWith(
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

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      typeEndsWith(
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

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension CryptocurrencyQueryObject
    on QueryBuilder<Cryptocurrency, Cryptocurrency, QFilterCondition> {}

extension CryptocurrencyQueryLinks
    on QueryBuilder<Cryptocurrency, Cryptocurrency, QFilterCondition> {
  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      transactions(FilterQuery<CryptocurrencyTransaction> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'transactions');
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      transactionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transactions', length, true, length, true);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      transactionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transactions', 0, true, 0, true);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      transactionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transactions', 0, false, 999999, true);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      transactionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transactions', 0, true, length, include);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      transactionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transactions', length, include, 999999, true);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterFilterCondition>
      transactionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'transactions', lower, includeLower, upper, includeUpper);
    });
  }
}

extension CryptocurrencyQuerySortBy
    on QueryBuilder<Cryptocurrency, Cryptocurrency, QSortBy> {
  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterSortBy>
      sortByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.asc);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterSortBy>
      sortByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.desc);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterSortBy>
      sortByPriceMarket() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceMarket', Sort.asc);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterSortBy>
      sortByPriceMarketDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceMarket', Sort.desc);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterSortBy>
      sortByTotalCrypto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCrypto', Sort.asc);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterSortBy>
      sortByTotalCryptoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCrypto', Sort.desc);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension CryptocurrencyQuerySortThenBy
    on QueryBuilder<Cryptocurrency, Cryptocurrency, QSortThenBy> {
  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterSortBy>
      thenByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.asc);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterSortBy>
      thenByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.desc);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterSortBy>
      thenByPriceMarket() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceMarket', Sort.asc);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterSortBy>
      thenByPriceMarketDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceMarket', Sort.desc);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterSortBy>
      thenByTotalCrypto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCrypto', Sort.asc);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterSortBy>
      thenByTotalCryptoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCrypto', Sort.desc);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension CryptocurrencyQueryWhereDistinct
    on QueryBuilder<Cryptocurrency, Cryptocurrency, QDistinct> {
  QueryBuilder<Cryptocurrency, Cryptocurrency, QDistinct>
      distinctByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdate');
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QDistinct>
      distinctByPriceMarket() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priceMarket');
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QDistinct>
      distinctByTotalCrypto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCrypto');
    });
  }

  QueryBuilder<Cryptocurrency, Cryptocurrency, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension CryptocurrencyQueryProperty
    on QueryBuilder<Cryptocurrency, Cryptocurrency, QQueryProperty> {
  QueryBuilder<Cryptocurrency, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Cryptocurrency, DateTime?, QQueryOperations>
      lastUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdate');
    });
  }

  QueryBuilder<Cryptocurrency, double, QQueryOperations> priceMarketProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priceMarket');
    });
  }

  QueryBuilder<Cryptocurrency, double, QQueryOperations> totalCryptoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCrypto');
    });
  }

  QueryBuilder<Cryptocurrency, CryptoType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCryptocurrencyTransactionCollection on Isar {
  IsarCollection<CryptocurrencyTransaction> get cryptocurrencyTransactions =>
      this.collection();
}

const CryptocurrencyTransactionSchema = CollectionSchema(
  name: r'CryptocurrencyTransaction',
  id: 7445994297209788579,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _cryptocurrencyTransactionEstimateSize,
  serialize: _cryptocurrencyTransactionSerialize,
  deserialize: _cryptocurrencyTransactionDeserialize,
  deserializeProp: _cryptocurrencyTransactionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _cryptocurrencyTransactionGetId,
  getLinks: _cryptocurrencyTransactionGetLinks,
  attach: _cryptocurrencyTransactionAttach,
  version: '3.1.8',
);

int _cryptocurrencyTransactionEstimateSize(
  CryptocurrencyTransaction object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _cryptocurrencyTransactionSerialize(
  CryptocurrencyTransaction object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeDateTime(offsets[1], object.date);
}

CryptocurrencyTransaction _cryptocurrencyTransactionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CryptocurrencyTransaction();
  object.amount = reader.readDouble(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.id = id;
  return object;
}

P _cryptocurrencyTransactionDeserializeProp<P>(
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

Id _cryptocurrencyTransactionGetId(CryptocurrencyTransaction object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _cryptocurrencyTransactionGetLinks(
    CryptocurrencyTransaction object) {
  return [];
}

void _cryptocurrencyTransactionAttach(
    IsarCollection<dynamic> col, Id id, CryptocurrencyTransaction object) {
  object.id = id;
}

extension CryptocurrencyTransactionQueryWhereSort on QueryBuilder<
    CryptocurrencyTransaction, CryptocurrencyTransaction, QWhere> {
  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CryptocurrencyTransactionQueryWhere on QueryBuilder<
    CryptocurrencyTransaction, CryptocurrencyTransaction, QWhereClause> {
  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterWhereClause> idBetween(
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

extension CryptocurrencyTransactionQueryFilter on QueryBuilder<
    CryptocurrencyTransaction, CryptocurrencyTransaction, QFilterCondition> {
  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterFilterCondition> amountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterFilterCondition> amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterFilterCondition> amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterFilterCondition> amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterFilterCondition> dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterFilterCondition> idGreaterThan(
    Id? value, {
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

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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
}

extension CryptocurrencyTransactionQueryObject on QueryBuilder<
    CryptocurrencyTransaction, CryptocurrencyTransaction, QFilterCondition> {}

extension CryptocurrencyTransactionQueryLinks on QueryBuilder<
    CryptocurrencyTransaction, CryptocurrencyTransaction, QFilterCondition> {}

extension CryptocurrencyTransactionQuerySortBy on QueryBuilder<
    CryptocurrencyTransaction, CryptocurrencyTransaction, QSortBy> {
  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterSortBy> sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }
}

extension CryptocurrencyTransactionQuerySortThenBy on QueryBuilder<
    CryptocurrencyTransaction, CryptocurrencyTransaction, QSortThenBy> {
  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterSortBy> thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension CryptocurrencyTransactionQueryWhereDistinct on QueryBuilder<
    CryptocurrencyTransaction, CryptocurrencyTransaction, QDistinct> {
  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction, QDistinct>
      distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<CryptocurrencyTransaction, CryptocurrencyTransaction, QDistinct>
      distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }
}

extension CryptocurrencyTransactionQueryProperty on QueryBuilder<
    CryptocurrencyTransaction, CryptocurrencyTransaction, QQueryProperty> {
  QueryBuilder<CryptocurrencyTransaction, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CryptocurrencyTransaction, double, QQueryOperations>
      amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<CryptocurrencyTransaction, DateTime, QQueryOperations>
      dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }
}
