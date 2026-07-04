import 'package:drift/drift.dart';
import 'package:monn/shared/local/tables.dart';

part 'database.drift.dart';

extension DriftPkX on int {
  /// Wraps an autoIncrement primary key for a Drift companion. Treats 0 as
  /// "not persisted yet" so `insertOnConflictUpdate` inserts a fresh row
  /// instead of forcing rowid=0 (which would collide between unsaved rows).
  Value<int> get asPk => this != 0 ? Value(this) : const Value.absent();
}

@DriftDatabase(
  tables: [
    SavingsEntries,
    CashEntries,
    CrowdfundingEntries,
    SavingsBookEntries,
    CounterStrikeEntries,
    PeaEntries,
    PerEntries,
    LifeInsuranceEntries,
    FreelanceEntries,
    BudgetEntries,
    CryptocurrencyEntries,
    CryptocurrencyTransactionEntries,
    ReitEntries,
    ReitDividendEntries,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    beforeOpen: (_) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
