import 'package:drift/drift.dart';
import 'package:monn/shared/local/database.steps.dart';
import 'package:monn/shared/local/tables.dart';

part 'database.drift.dart';

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
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: stepByStep(
      from1To2: (m, schema) async {
        await m.alterTable(
          TableMigration(
            schema.crowdfundingEntries,
            columnTransformer: {
              schema.crowdfundingEntries.receivedAt: coalesce([
                crowdfundingEntries.receivedAt,
                Constant(DateTime.fromMillisecondsSinceEpoch(0)),
              ]),
            },
          ),
        );
        await m.create(schema.cryptocurrencyTransactionCryptoDate);
        await m.create(schema.reitDividendReit);
      },
    ),
    beforeOpen: (_) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
