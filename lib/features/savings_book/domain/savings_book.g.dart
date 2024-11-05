// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings_book.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSavingsBookCollection on Isar {
  IsarCollection<SavingsBook> get savingsBooks => this.collection();
}

const SavingsBookSchema = CollectionSchema(
  name: r'SavingsBook',
  id: -2436578569250775187,
  properties: {
    r'interests': PropertySchema(
      id: 0,
      name: r'interests',
      type: IsarType.double,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'startAmount': PropertySchema(
      id: 2,
      name: r'startAmount',
      type: IsarType.double,
    ),
    r'withdrawal': PropertySchema(
      id: 3,
      name: r'withdrawal',
      type: IsarType.double,
    )
  },
  estimateSize: _savingsBookEstimateSize,
  serialize: _savingsBookSerialize,
  deserialize: _savingsBookDeserialize,
  deserializeProp: _savingsBookDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _savingsBookGetId,
  getLinks: _savingsBookGetLinks,
  attach: _savingsBookAttach,
  version: '3.1.7',
);

int _savingsBookEstimateSize(
  SavingsBook object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _savingsBookSerialize(
  SavingsBook object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.interests);
  writer.writeString(offsets[1], object.name);
  writer.writeDouble(offsets[2], object.startAmount);
  writer.writeDouble(offsets[3], object.withdrawal);
}

SavingsBook _savingsBookDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SavingsBook();
  object.id = id;
  object.interests = reader.readDouble(offsets[0]);
  object.name = reader.readString(offsets[1]);
  object.startAmount = reader.readDouble(offsets[2]);
  object.withdrawal = reader.readDouble(offsets[3]);
  return object;
}

P _savingsBookDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _savingsBookGetId(SavingsBook object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _savingsBookGetLinks(SavingsBook object) {
  return [];
}

void _savingsBookAttach(
    IsarCollection<dynamic> col, Id id, SavingsBook object) {
  object.id = id;
}

extension SavingsBookQueryWhereSort
    on QueryBuilder<SavingsBook, SavingsBook, QWhere> {
  QueryBuilder<SavingsBook, SavingsBook, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SavingsBookQueryWhere
    on QueryBuilder<SavingsBook, SavingsBook, QWhereClause> {
  QueryBuilder<SavingsBook, SavingsBook, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<SavingsBook, SavingsBook, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterWhereClause> idBetween(
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

extension SavingsBookQueryFilter
    on QueryBuilder<SavingsBook, SavingsBook, QFilterCondition> {
  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition>
      interestsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'interests',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition>
      interestsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'interests',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition>
      interestsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'interests',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition>
      interestsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'interests',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition>
      startAmountEqualTo(
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

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition>
      startAmountGreaterThan(
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

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition>
      startAmountLessThan(
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

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition>
      startAmountBetween(
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

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition>
      withdrawalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'withdrawal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition>
      withdrawalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'withdrawal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition>
      withdrawalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'withdrawal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterFilterCondition>
      withdrawalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'withdrawal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension SavingsBookQueryObject
    on QueryBuilder<SavingsBook, SavingsBook, QFilterCondition> {}

extension SavingsBookQueryLinks
    on QueryBuilder<SavingsBook, SavingsBook, QFilterCondition> {}

extension SavingsBookQuerySortBy
    on QueryBuilder<SavingsBook, SavingsBook, QSortBy> {
  QueryBuilder<SavingsBook, SavingsBook, QAfterSortBy> sortByInterests() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interests', Sort.asc);
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterSortBy> sortByInterestsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interests', Sort.desc);
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterSortBy> sortByStartAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAmount', Sort.asc);
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterSortBy> sortByStartAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAmount', Sort.desc);
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterSortBy> sortByWithdrawal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'withdrawal', Sort.asc);
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterSortBy> sortByWithdrawalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'withdrawal', Sort.desc);
    });
  }
}

extension SavingsBookQuerySortThenBy
    on QueryBuilder<SavingsBook, SavingsBook, QSortThenBy> {
  QueryBuilder<SavingsBook, SavingsBook, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterSortBy> thenByInterests() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interests', Sort.asc);
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterSortBy> thenByInterestsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interests', Sort.desc);
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterSortBy> thenByStartAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAmount', Sort.asc);
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterSortBy> thenByStartAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAmount', Sort.desc);
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterSortBy> thenByWithdrawal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'withdrawal', Sort.asc);
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QAfterSortBy> thenByWithdrawalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'withdrawal', Sort.desc);
    });
  }
}

extension SavingsBookQueryWhereDistinct
    on QueryBuilder<SavingsBook, SavingsBook, QDistinct> {
  QueryBuilder<SavingsBook, SavingsBook, QDistinct> distinctByInterests() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'interests');
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QDistinct> distinctByStartAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startAmount');
    });
  }

  QueryBuilder<SavingsBook, SavingsBook, QDistinct> distinctByWithdrawal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'withdrawal');
    });
  }
}

extension SavingsBookQueryProperty
    on QueryBuilder<SavingsBook, SavingsBook, QQueryProperty> {
  QueryBuilder<SavingsBook, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SavingsBook, double, QQueryOperations> interestsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'interests');
    });
  }

  QueryBuilder<SavingsBook, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<SavingsBook, double, QQueryOperations> startAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startAmount');
    });
  }

  QueryBuilder<SavingsBook, double, QQueryOperations> withdrawalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'withdrawal');
    });
  }
}
