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
  int get schemaVersion => 3;

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
      from2To3: (m, schema) async {
        await customStatement('''
          UPDATE crowdfunding_entries
          SET tax_percentage = CASE tax_percentage
                WHEN 17.2 THEN 30.0 ELSE 31.4 END,
              tax_profit = ROUND(brut_profit * CASE tax_percentage
                WHEN 17.2 THEN 0.30 ELSE 0.314 END, 2),
              net_profit = ROUND(brut_profit - ROUND(brut_profit *
                CASE tax_percentage WHEN 17.2 THEN 0.30 ELSE 0.314 END, 2), 2)
          WHERE tax_percentage IN (17.2, 18.6) AND brut_profit >= 0
        ''');
      },
    ),
    beforeOpen: (_) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
