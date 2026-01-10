// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBudgetCollection on Isar {
  IsarCollection<Budget> get budgets => this.collection();
}

const BudgetSchema = CollectionSchema(
  name: r'Budget',
  id: -3383598594604670326,
  properties: {
    r'ai': PropertySchema(id: 0, name: r'ai', type: IsarType.double),
    r'balance': PropertySchema(id: 1, name: r'balance', type: IsarType.double),
    r'electricity': PropertySchema(
      id: 2,
      name: r'electricity',
      type: IsarType.double,
    ),
    r'freelanceIncome': PropertySchema(
      id: 3,
      name: r'freelanceIncome',
      type: IsarType.double,
    ),
    r'gas': PropertySchema(id: 4, name: r'gas', type: IsarType.double),
    r'groceries': PropertySchema(
      id: 5,
      name: r'groceries',
      type: IsarType.double,
    ),
    r'healthInsurance': PropertySchema(
      id: 6,
      name: r'healthInsurance',
      type: IsarType.double,
    ),
    r'homeInsurance': PropertySchema(
      id: 7,
      name: r'homeInsurance',
      type: IsarType.double,
    ),
    r'internet': PropertySchema(
      id: 8,
      name: r'internet',
      type: IsarType.double,
    ),
    r'phone': PropertySchema(id: 9, name: r'phone', type: IsarType.double),
    r'publicTransport': PropertySchema(
      id: 10,
      name: r'publicTransport',
      type: IsarType.double,
    ),
    r'rent': PropertySchema(id: 11, name: r'rent', type: IsarType.double),
    r'restaurants': PropertySchema(
      id: 12,
      name: r'restaurants',
      type: IsarType.double,
    ),
    r'totalExpenses': PropertySchema(
      id: 13,
      name: r'totalExpenses',
      type: IsarType.double,
    ),
    r'totalFood': PropertySchema(
      id: 14,
      name: r'totalFood',
      type: IsarType.double,
    ),
    r'totalHealth': PropertySchema(
      id: 15,
      name: r'totalHealth',
      type: IsarType.double,
    ),
    r'totalHousing': PropertySchema(
      id: 16,
      name: r'totalHousing',
      type: IsarType.double,
    ),
    r'totalSubscriptions': PropertySchema(
      id: 17,
      name: r'totalSubscriptions',
      type: IsarType.double,
    ),
    r'totalTransport': PropertySchema(
      id: 18,
      name: r'totalTransport',
      type: IsarType.double,
    ),
    r'water': PropertySchema(id: 19, name: r'water', type: IsarType.double),
  },

  estimateSize: _budgetEstimateSize,
  serialize: _budgetSerialize,
  deserialize: _budgetDeserialize,
  deserializeProp: _budgetDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _budgetGetId,
  getLinks: _budgetGetLinks,
  attach: _budgetAttach,
  version: '3.3.0',
);

int _budgetEstimateSize(
  Budget object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _budgetSerialize(
  Budget object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.ai);
  writer.writeDouble(offsets[1], object.balance);
  writer.writeDouble(offsets[2], object.electricity);
  writer.writeDouble(offsets[3], object.freelanceIncome);
  writer.writeDouble(offsets[4], object.gas);
  writer.writeDouble(offsets[5], object.groceries);
  writer.writeDouble(offsets[6], object.healthInsurance);
  writer.writeDouble(offsets[7], object.homeInsurance);
  writer.writeDouble(offsets[8], object.internet);
  writer.writeDouble(offsets[9], object.phone);
  writer.writeDouble(offsets[10], object.publicTransport);
  writer.writeDouble(offsets[11], object.rent);
  writer.writeDouble(offsets[12], object.restaurants);
  writer.writeDouble(offsets[13], object.totalExpenses);
  writer.writeDouble(offsets[14], object.totalFood);
  writer.writeDouble(offsets[15], object.totalHealth);
  writer.writeDouble(offsets[16], object.totalHousing);
  writer.writeDouble(offsets[17], object.totalSubscriptions);
  writer.writeDouble(offsets[18], object.totalTransport);
  writer.writeDouble(offsets[19], object.water);
}

Budget _budgetDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Budget();
  object.ai = reader.readDouble(offsets[0]);
  object.electricity = reader.readDouble(offsets[2]);
  object.freelanceIncome = reader.readDouble(offsets[3]);
  object.gas = reader.readDouble(offsets[4]);
  object.groceries = reader.readDouble(offsets[5]);
  object.healthInsurance = reader.readDouble(offsets[6]);
  object.homeInsurance = reader.readDouble(offsets[7]);
  object.id = id;
  object.internet = reader.readDouble(offsets[8]);
  object.phone = reader.readDouble(offsets[9]);
  object.publicTransport = reader.readDouble(offsets[10]);
  object.rent = reader.readDouble(offsets[11]);
  object.restaurants = reader.readDouble(offsets[12]);
  object.water = reader.readDouble(offsets[19]);
  return object;
}

P _budgetDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readDouble(offset)) as P;
    case 17:
      return (reader.readDouble(offset)) as P;
    case 18:
      return (reader.readDouble(offset)) as P;
    case 19:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _budgetGetId(Budget object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _budgetGetLinks(Budget object) {
  return [];
}

void _budgetAttach(IsarCollection<dynamic> col, Id id, Budget object) {
  object.id = id;
}

extension BudgetQueryWhereSort on QueryBuilder<Budget, Budget, QWhere> {
  QueryBuilder<Budget, Budget, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BudgetQueryWhere on QueryBuilder<Budget, Budget, QWhereClause> {
  QueryBuilder<Budget, Budget, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Budget, Budget, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Budget, Budget, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterWhereClause> idBetween(
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

extension BudgetQueryFilter on QueryBuilder<Budget, Budget, QFilterCondition> {
  QueryBuilder<Budget, Budget, QAfterFilterCondition> aiEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'ai',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> aiGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ai',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> aiLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ai',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> aiBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ai',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> balanceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'balance',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> balanceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'balance',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> balanceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'balance',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> balanceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'balance',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> electricityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'electricity',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> electricityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'electricity',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> electricityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'electricity',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> electricityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'electricity',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> freelanceIncomeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'freelanceIncome',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition>
  freelanceIncomeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'freelanceIncome',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> freelanceIncomeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'freelanceIncome',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> freelanceIncomeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'freelanceIncome',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> gasEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'gas',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> gasGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'gas',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> gasLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'gas',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> gasBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'gas',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> groceriesEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'groceries',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> groceriesGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'groceries',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> groceriesLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'groceries',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> groceriesBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'groceries',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> healthInsuranceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'healthInsurance',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition>
  healthInsuranceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'healthInsurance',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> healthInsuranceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'healthInsurance',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> healthInsuranceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'healthInsurance',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> homeInsuranceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'homeInsurance',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> homeInsuranceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'homeInsurance',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> homeInsuranceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'homeInsurance',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> homeInsuranceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'homeInsurance',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Budget, Budget, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Budget, Budget, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Budget, Budget, QAfterFilterCondition> internetEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'internet',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> internetGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'internet',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> internetLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'internet',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> internetBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'internet',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> phoneEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'phone',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> phoneGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'phone',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> phoneLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'phone',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> phoneBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'phone',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> publicTransportEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'publicTransport',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition>
  publicTransportGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'publicTransport',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> publicTransportLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'publicTransport',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> publicTransportBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'publicTransport',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> rentEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'rent',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> rentGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rent',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> rentLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rent',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> rentBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rent',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> restaurantsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'restaurants',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> restaurantsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'restaurants',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> restaurantsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'restaurants',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> restaurantsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'restaurants',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalExpensesEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'totalExpenses',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalExpensesGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalExpenses',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalExpensesLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalExpenses',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalExpensesBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalExpenses',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalFoodEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'totalFood',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalFoodGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalFood',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalFoodLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalFood',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalFoodBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalFood',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalHealthEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'totalHealth',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalHealthGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalHealth',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalHealthLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalHealth',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalHealthBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalHealth',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalHousingEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'totalHousing',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalHousingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalHousing',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalHousingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalHousing',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalHousingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalHousing',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalSubscriptionsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'totalSubscriptions',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition>
  totalSubscriptionsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalSubscriptions',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition>
  totalSubscriptionsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalSubscriptions',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalSubscriptionsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalSubscriptions',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalTransportEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'totalTransport',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalTransportGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalTransport',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalTransportLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalTransport',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> totalTransportBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalTransport',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> waterEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'water',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> waterGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'water',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> waterLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'water',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Budget, Budget, QAfterFilterCondition> waterBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'water',
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

extension BudgetQueryObject on QueryBuilder<Budget, Budget, QFilterCondition> {}

extension BudgetQueryLinks on QueryBuilder<Budget, Budget, QFilterCondition> {}

extension BudgetQuerySortBy on QueryBuilder<Budget, Budget, QSortBy> {
  QueryBuilder<Budget, Budget, QAfterSortBy> sortByAi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ai', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByAiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ai', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByElectricity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'electricity', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByElectricityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'electricity', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByFreelanceIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'freelanceIncome', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByFreelanceIncomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'freelanceIncome', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByGas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gas', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByGasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gas', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByGroceries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groceries', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByGroceriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groceries', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByHealthInsurance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthInsurance', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByHealthInsuranceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthInsurance', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByHomeInsurance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homeInsurance', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByHomeInsuranceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homeInsurance', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByInternet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internet', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByInternetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internet', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByPublicTransport() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicTransport', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByPublicTransportDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicTransport', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByRent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rent', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByRentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rent', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByRestaurants() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restaurants', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByRestaurantsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restaurants', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByTotalExpenses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalExpenses', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByTotalExpensesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalExpenses', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByTotalFood() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFood', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByTotalFoodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFood', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByTotalHealth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHealth', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByTotalHealthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHealth', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByTotalHousing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHousing', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByTotalHousingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHousing', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByTotalSubscriptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSubscriptions', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByTotalSubscriptionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSubscriptions', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByTotalTransport() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTransport', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByTotalTransportDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTransport', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'water', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> sortByWaterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'water', Sort.desc);
    });
  }
}

extension BudgetQuerySortThenBy on QueryBuilder<Budget, Budget, QSortThenBy> {
  QueryBuilder<Budget, Budget, QAfterSortBy> thenByAi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ai', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByAiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ai', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByElectricity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'electricity', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByElectricityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'electricity', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByFreelanceIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'freelanceIncome', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByFreelanceIncomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'freelanceIncome', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByGas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gas', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByGasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gas', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByGroceries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groceries', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByGroceriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groceries', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByHealthInsurance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthInsurance', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByHealthInsuranceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthInsurance', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByHomeInsurance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homeInsurance', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByHomeInsuranceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homeInsurance', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByInternet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internet', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByInternetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internet', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByPublicTransport() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicTransport', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByPublicTransportDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicTransport', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByRent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rent', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByRentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rent', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByRestaurants() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restaurants', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByRestaurantsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restaurants', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByTotalExpenses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalExpenses', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByTotalExpensesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalExpenses', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByTotalFood() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFood', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByTotalFoodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFood', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByTotalHealth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHealth', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByTotalHealthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHealth', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByTotalHousing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHousing', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByTotalHousingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHousing', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByTotalSubscriptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSubscriptions', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByTotalSubscriptionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSubscriptions', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByTotalTransport() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTransport', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByTotalTransportDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTransport', Sort.desc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'water', Sort.asc);
    });
  }

  QueryBuilder<Budget, Budget, QAfterSortBy> thenByWaterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'water', Sort.desc);
    });
  }
}

extension BudgetQueryWhereDistinct on QueryBuilder<Budget, Budget, QDistinct> {
  QueryBuilder<Budget, Budget, QDistinct> distinctByAi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ai');
    });
  }

  QueryBuilder<Budget, Budget, QDistinct> distinctByBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balance');
    });
  }

  QueryBuilder<Budget, Budget, QDistinct> distinctByElectricity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'electricity');
    });
  }

  QueryBuilder<Budget, Budget, QDistinct> distinctByFreelanceIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'freelanceIncome');
    });
  }

  QueryBuilder<Budget, Budget, QDistinct> distinctByGas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gas');
    });
  }

  QueryBuilder<Budget, Budget, QDistinct> distinctByGroceries() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groceries');
    });
  }

  QueryBuilder<Budget, Budget, QDistinct> distinctByHealthInsurance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'healthInsurance');
    });
  }

  QueryBuilder<Budget, Budget, QDistinct> distinctByHomeInsurance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'homeInsurance');
    });
  }

  QueryBuilder<Budget, Budget, QDistinct> distinctByInternet() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'internet');
    });
  }

  QueryBuilder<Budget, Budget, QDistinct> distinctByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone');
    });
  }

  QueryBuilder<Budget, Budget, QDistinct> distinctByPublicTransport() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publicTransport');
    });
  }

  QueryBuilder<Budget, Budget, QDistinct> distinctByRent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rent');
    });
  }

  QueryBuilder<Budget, Budget, QDistinct> distinctByRestaurants() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'restaurants');
    });
  }

  QueryBuilder<Budget, Budget, QDistinct> distinctByTotalExpenses() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalExpenses');
    });
  }

  QueryBuilder<Budget, Budget, QDistinct> distinctByTotalFood() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalFood');
    });
  }

  QueryBuilder<Budget, Budget, QDistinct> distinctByTotalHealth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalHealth');
    });
  }

  QueryBuilder<Budget, Budget, QDistinct> distinctByTotalHousing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalHousing');
    });
  }

  QueryBuilder<Budget, Budget, QDistinct> distinctByTotalSubscriptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalSubscriptions');
    });
  }

  QueryBuilder<Budget, Budget, QDistinct> distinctByTotalTransport() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalTransport');
    });
  }

  QueryBuilder<Budget, Budget, QDistinct> distinctByWater() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'water');
    });
  }
}

extension BudgetQueryProperty on QueryBuilder<Budget, Budget, QQueryProperty> {
  QueryBuilder<Budget, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Budget, double, QQueryOperations> aiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ai');
    });
  }

  QueryBuilder<Budget, double, QQueryOperations> balanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balance');
    });
  }

  QueryBuilder<Budget, double, QQueryOperations> electricityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'electricity');
    });
  }

  QueryBuilder<Budget, double, QQueryOperations> freelanceIncomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'freelanceIncome');
    });
  }

  QueryBuilder<Budget, double, QQueryOperations> gasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gas');
    });
  }

  QueryBuilder<Budget, double, QQueryOperations> groceriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groceries');
    });
  }

  QueryBuilder<Budget, double, QQueryOperations> healthInsuranceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'healthInsurance');
    });
  }

  QueryBuilder<Budget, double, QQueryOperations> homeInsuranceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'homeInsurance');
    });
  }

  QueryBuilder<Budget, double, QQueryOperations> internetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'internet');
    });
  }

  QueryBuilder<Budget, double, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<Budget, double, QQueryOperations> publicTransportProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publicTransport');
    });
  }

  QueryBuilder<Budget, double, QQueryOperations> rentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rent');
    });
  }

  QueryBuilder<Budget, double, QQueryOperations> restaurantsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'restaurants');
    });
  }

  QueryBuilder<Budget, double, QQueryOperations> totalExpensesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalExpenses');
    });
  }

  QueryBuilder<Budget, double, QQueryOperations> totalFoodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalFood');
    });
  }

  QueryBuilder<Budget, double, QQueryOperations> totalHealthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalHealth');
    });
  }

  QueryBuilder<Budget, double, QQueryOperations> totalHousingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalHousing');
    });
  }

  QueryBuilder<Budget, double, QQueryOperations> totalSubscriptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalSubscriptions');
    });
  }

  QueryBuilder<Budget, double, QQueryOperations> totalTransportProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalTransport');
    });
  }

  QueryBuilder<Budget, double, QQueryOperations> waterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'water');
    });
  }
}
