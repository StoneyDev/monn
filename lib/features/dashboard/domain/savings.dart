import 'package:isar_community/isar.dart';

part 'savings.g.dart';

@collection
class Savings {
  Id id = Isar.autoIncrement;
  @Enumerated(EnumType.name)
  late SavingsType type;
  double? startAmount;
}

enum SavingsType {
  savingsBook,
  crowdfunding,
  cryptocurrency,
  csKnives,
  cash,
  // cto,
  lifeInsurance,
  pea,
  per,
  reit,
}

enum SavingsFilter {
  sortByStartAmountDesc,
  sortByStartAmountAsc,
  sortByFinalAmountDesc,
  sortByFinalAmountAsc,
}
