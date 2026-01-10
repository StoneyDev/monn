import 'package:isar_community/isar.dart';

part 'budget.g.dart';

@collection
class Budget {
  Id id = 1;

  double freelanceIncome = 0;

  double rent = 0;
  double electricity = 0;
  double gas = 0;
  double water = 0;
  double internet = 0;
  double homeInsurance = 0;

  double publicTransport = 0;

  double groceries = 0;
  double restaurants = 0;

  double healthInsurance = 0;

  double phone = 0;
  double ai = 0;

  double get totalHousing =>
      rent + electricity + gas + water + internet + homeInsurance;

  double get totalTransport => publicTransport;

  double get totalFood => groceries + restaurants;

  double get totalHealth => healthInsurance;

  double get totalSubscriptions => phone + ai;

  double get totalExpenses =>
      totalHousing +
      totalTransport +
      totalFood +
      totalHealth +
      totalSubscriptions;

  double get balance => freelanceIncome - totalExpenses;
}
