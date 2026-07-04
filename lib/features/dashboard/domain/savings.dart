import 'package:monn/shared/local/database.dart';

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

extension SavingsEntryX on SavingsEntry {
  SavingsType get savingsType => SavingsType.values.byName(type);
}
