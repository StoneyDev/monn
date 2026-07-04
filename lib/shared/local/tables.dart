import 'package:drift/drift.dart';

class SavingsEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()();
  RealColumn get startAmount => real().nullable()();

  @override
  List<String> get customConstraints => ['UNIQUE(type)'];
}

class CashEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get label => text()();
  RealColumn get value => real()();
}

class CrowdfundingEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get brutProfit => real()();
  TextColumn get platformName => text()();
  RealColumn get netProfit => real().nullable()();
  RealColumn get taxProfit => real().nullable()();
  RealColumn get taxPercentage => real().nullable()();
  DateTimeColumn get receivedAt => dateTime().nullable()();
}

class SavingsBookEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get startAmount => real().withDefault(const Constant(0))();
  RealColumn get withdrawal => real().withDefault(const Constant(0))();
  RealColumn get interests => real().withDefault(const Constant(0))();
}

class CounterStrikeEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get boughtAt => dateTime()();
  DateTimeColumn get lastUpdate => dateTime()();
  TextColumn get imageId => text()();
  RealColumn get purchaseValue => real()();
  RealColumn get currentValue => real()();
  IntColumn get quantity => integer()();
  RealColumn get wear => real().nullable()();
}

class PeaEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get equity => integer().nullable()();
  RealColumn get costAverage => real().nullable()();
  RealColumn get lastPrice => real().nullable()();
  DateTimeColumn get lastUpdate => dateTime().nullable()();
}

class PerEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get invested => real().withDefault(const Constant(0))();
  RealColumn get interests => real().withDefault(const Constant(0))();
}

class LifeInsuranceEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get invested => real().withDefault(const Constant(0))();
  RealColumn get interests => real().withDefault(const Constant(0))();
}

class FreelanceEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get annualRevenue => real().withDefault(const Constant(0))();
}

class BudgetEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get freelanceIncome => real().withDefault(const Constant(0))();
  RealColumn get rent => real().withDefault(const Constant(0))();
  RealColumn get electricity => real().withDefault(const Constant(0))();
  RealColumn get gas => real().withDefault(const Constant(0))();
  RealColumn get water => real().withDefault(const Constant(0))();
  RealColumn get internet => real().withDefault(const Constant(0))();
  RealColumn get homeInsurance => real().withDefault(const Constant(0))();
  RealColumn get publicTransport => real().withDefault(const Constant(0))();
  RealColumn get groceries => real().withDefault(const Constant(0))();
  RealColumn get restaurants => real().withDefault(const Constant(0))();
  RealColumn get healthInsurance => real().withDefault(const Constant(0))();
  RealColumn get phone => real().withDefault(const Constant(0))();
  RealColumn get ai => real().withDefault(const Constant(0))();
}

class CryptocurrencyEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()();
  RealColumn get totalCrypto => real().withDefault(const Constant(0))();
  RealColumn get priceMarket => real().withDefault(const Constant(0))();
  DateTimeColumn get lastUpdate => dateTime().nullable()();

  @override
  List<String> get customConstraints => ['UNIQUE(type)'];
}

class CryptocurrencyTransactionEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cryptocurrencyId => integer()
      .references(CryptocurrencyEntries, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get date => dateTime()();
  RealColumn get amount => real()();
}

class ReitEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get boughtOn => dateTime()();
  IntColumn get shares => integer()();
  RealColumn get price => real()();
}

class ReitDividendEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get reitId =>
      integer().references(ReitEntries, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get receivedAt => dateTime()();
  RealColumn get amount => real()();
}
