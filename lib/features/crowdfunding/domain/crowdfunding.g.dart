// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crowdfunding.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCrowdfundingCollection on Isar {
  IsarCollection<Crowdfunding> get crowdfundings => this.collection();
}

const CrowdfundingSchema = CollectionSchema(
  name: r'Crowdfunding',
  id: -6315037646820644457,
  properties: {
    r'brutProfit': PropertySchema(
      id: 0,
      name: r'brutProfit',
      type: IsarType.double,
    ),
    r'netProfit': PropertySchema(
      id: 1,
      name: r'netProfit',
      type: IsarType.double,
    ),
    r'platformName': PropertySchema(
      id: 2,
      name: r'platformName',
      type: IsarType.string,
    ),
    r'receivedAt': PropertySchema(
      id: 3,
      name: r'receivedAt',
      type: IsarType.dateTime,
    ),
    r'taxPercentage': PropertySchema(
      id: 4,
      name: r'taxPercentage',
      type: IsarType.double,
    ),
    r'taxProfit': PropertySchema(
      id: 5,
      name: r'taxProfit',
      type: IsarType.double,
    )
  },
  estimateSize: _crowdfundingEstimateSize,
  serialize: _crowdfundingSerialize,
  deserialize: _crowdfundingDeserialize,
  deserializeProp: _crowdfundingDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _crowdfundingGetId,
  getLinks: _crowdfundingGetLinks,
  attach: _crowdfundingAttach,
  version: '3.1.8',
);

int _crowdfundingEstimateSize(
  Crowdfunding object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.platformName.length * 3;
  return bytesCount;
}

void _crowdfundingSerialize(
  Crowdfunding object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.brutProfit);
  writer.writeDouble(offsets[1], object.netProfit);
  writer.writeString(offsets[2], object.platformName);
  writer.writeDateTime(offsets[3], object.receivedAt);
  writer.writeDouble(offsets[4], object.taxPercentage);
  writer.writeDouble(offsets[5], object.taxProfit);
}

Crowdfunding _crowdfundingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Crowdfunding(
    brutProfit: reader.readDouble(offsets[0]),
    id: id,
    netProfit: reader.readDouble(offsets[1]),
    platformName: reader.readString(offsets[2]),
    receivedAt: reader.readDateTimeOrNull(offsets[3]),
    taxPercentage: reader.readDouble(offsets[4]),
    taxProfit: reader.readDouble(offsets[5]),
  );
  return object;
}

P _crowdfundingDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _crowdfundingGetId(Crowdfunding object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _crowdfundingGetLinks(Crowdfunding object) {
  return [];
}

void _crowdfundingAttach(
    IsarCollection<dynamic> col, Id id, Crowdfunding object) {}

extension CrowdfundingQueryWhereSort
    on QueryBuilder<Crowdfunding, Crowdfunding, QWhere> {
  QueryBuilder<Crowdfunding, Crowdfunding, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CrowdfundingQueryWhere
    on QueryBuilder<Crowdfunding, Crowdfunding, QWhereClause> {
  QueryBuilder<Crowdfunding, Crowdfunding, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterWhereClause> idBetween(
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

extension CrowdfundingQueryFilter
    on QueryBuilder<Crowdfunding, Crowdfunding, QFilterCondition> {
  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      brutProfitEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brutProfit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      brutProfitGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brutProfit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      brutProfitLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brutProfit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      brutProfitBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brutProfit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      netProfitEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'netProfit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      netProfitGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'netProfit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      netProfitLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'netProfit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      netProfitBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'netProfit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      platformNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'platformName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      platformNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'platformName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      platformNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'platformName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      platformNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'platformName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      platformNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'platformName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      platformNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'platformName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      platformNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'platformName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      platformNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'platformName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      platformNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'platformName',
        value: '',
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      platformNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'platformName',
        value: '',
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      receivedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'receivedAt',
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      receivedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'receivedAt',
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      receivedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receivedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      receivedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'receivedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      receivedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'receivedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      receivedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'receivedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      taxPercentageEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      taxPercentageGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      taxPercentageLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      taxPercentageBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxPercentage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      taxProfitEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxProfit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      taxProfitGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxProfit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      taxProfitLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxProfit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterFilterCondition>
      taxProfitBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxProfit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension CrowdfundingQueryObject
    on QueryBuilder<Crowdfunding, Crowdfunding, QFilterCondition> {}

extension CrowdfundingQueryLinks
    on QueryBuilder<Crowdfunding, Crowdfunding, QFilterCondition> {}

extension CrowdfundingQuerySortBy
    on QueryBuilder<Crowdfunding, Crowdfunding, QSortBy> {
  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy> sortByBrutProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brutProfit', Sort.asc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy>
      sortByBrutProfitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brutProfit', Sort.desc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy> sortByNetProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netProfit', Sort.asc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy> sortByNetProfitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netProfit', Sort.desc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy> sortByPlatformName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platformName', Sort.asc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy>
      sortByPlatformNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platformName', Sort.desc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy> sortByReceivedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedAt', Sort.asc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy>
      sortByReceivedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedAt', Sort.desc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy> sortByTaxPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxPercentage', Sort.asc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy>
      sortByTaxPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxPercentage', Sort.desc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy> sortByTaxProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxProfit', Sort.asc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy> sortByTaxProfitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxProfit', Sort.desc);
    });
  }
}

extension CrowdfundingQuerySortThenBy
    on QueryBuilder<Crowdfunding, Crowdfunding, QSortThenBy> {
  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy> thenByBrutProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brutProfit', Sort.asc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy>
      thenByBrutProfitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brutProfit', Sort.desc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy> thenByNetProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netProfit', Sort.asc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy> thenByNetProfitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netProfit', Sort.desc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy> thenByPlatformName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platformName', Sort.asc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy>
      thenByPlatformNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platformName', Sort.desc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy> thenByReceivedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedAt', Sort.asc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy>
      thenByReceivedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedAt', Sort.desc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy> thenByTaxPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxPercentage', Sort.asc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy>
      thenByTaxPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxPercentage', Sort.desc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy> thenByTaxProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxProfit', Sort.asc);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QAfterSortBy> thenByTaxProfitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxProfit', Sort.desc);
    });
  }
}

extension CrowdfundingQueryWhereDistinct
    on QueryBuilder<Crowdfunding, Crowdfunding, QDistinct> {
  QueryBuilder<Crowdfunding, Crowdfunding, QDistinct> distinctByBrutProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brutProfit');
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QDistinct> distinctByNetProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'netProfit');
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QDistinct> distinctByPlatformName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'platformName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QDistinct> distinctByReceivedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receivedAt');
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QDistinct>
      distinctByTaxPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxPercentage');
    });
  }

  QueryBuilder<Crowdfunding, Crowdfunding, QDistinct> distinctByTaxProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxProfit');
    });
  }
}

extension CrowdfundingQueryProperty
    on QueryBuilder<Crowdfunding, Crowdfunding, QQueryProperty> {
  QueryBuilder<Crowdfunding, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Crowdfunding, double, QQueryOperations> brutProfitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brutProfit');
    });
  }

  QueryBuilder<Crowdfunding, double, QQueryOperations> netProfitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'netProfit');
    });
  }

  QueryBuilder<Crowdfunding, String, QQueryOperations> platformNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'platformName');
    });
  }

  QueryBuilder<Crowdfunding, DateTime?, QQueryOperations> receivedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receivedAt');
    });
  }

  QueryBuilder<Crowdfunding, double, QQueryOperations> taxPercentageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxPercentage');
    });
  }

  QueryBuilder<Crowdfunding, double, QQueryOperations> taxProfitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxProfit');
    });
  }
}
