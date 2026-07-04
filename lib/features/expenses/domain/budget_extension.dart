import 'package:monn/shared/local/database.dart';

extension BudgetComputed on BudgetEntry {
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
