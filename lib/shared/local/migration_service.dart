import 'dart:io';

import 'package:drift/drift.dart';
import 'package:isar_community/isar.dart';
import 'package:monn/features/cash/domain/cash.dart';
import 'package:monn/features/counter_strike/domain/counter_strike.dart';
import 'package:monn/features/crowdfunding/domain/crowdfunding.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/expenses/domain/budget.dart';
import 'package:monn/features/freelance/domain/freelance.dart';
import 'package:monn/features/life_insurance/domain/life_insurance.dart';
import 'package:monn/features/pea/domain/pea.dart';
import 'package:monn/features/per/domain/per.dart';
import 'package:monn/features/reit/domain/reit.dart';
import 'package:monn/features/savings_book/domain/savings_book.dart';
import 'package:monn/shared/local/database.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO(drop-isar): once every active user has launched a build that ran this
// migration at least once, delete this entire file along with:
//   - `isar_community` + `isar_community_flutter_libs` deps in pubspec.yaml
//   - `isar_community_generator` dev dep + related build_runner config
//   - all `*.g.dart` Isar-generated files and `@collection` annotations in the
//     domain classes (cash.dart, counter_strike.dart, crowdfunding.dart,
//     cryptocurrency.dart, savings.dart, budget.dart, freelance.dart,
//     life_insurance.dart, pea.dart, per.dart, reit.dart, savings_book.dart)
//   - the `MigrationService.migrateIfNeeded` call in main.dart
class MigrationService {
  static const _migrationKey = 'isar_to_drift_migrated';
  static final _legacyFallbackDate = DateTime.fromMillisecondsSinceEpoch(0);

  /// Single entry point: if an Isar DB exists and the Drift DB is empty, copies
  /// all data across and tears Isar down. No-op on fresh installs, re-runs, or
  /// when the user already owns data in Drift (defence against stale prefs).
  ///
  /// [isarDirectory] defaults to the app documents directory; tests override.
  static Future<void> migrateIfNeeded(
    AppDatabase driftDb, {
    Directory? isarDirectory,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(_migrationKey) ?? false) return;

    final dir = isarDirectory ?? await getApplicationDocumentsDirectory();
    final isarFile = File(p.join(dir.path, 'default.isar'));
    if (!isarFile.existsSync()) {
      // Fresh install: just mark the migration done so we skip this path
      // forever, even if someone sideloads an Isar file later.
      await prefs.setBool(_migrationKey, true);
      return;
    }

    // Defence in depth: if Drift is already populated, don't replay — it would
    // create duplicates. Could happen if prefs were cleared post-migration.
    if (await _isDriftPopulated(driftDb)) {
      await prefs.setBool(_migrationKey, true);
      return;
    }

    final isarDb = await Isar.open(
      [
        SavingsSchema,
        CashSchema,
        CrowdfundingSchema,
        SavingsBookSchema,
        CounterStrikeSchema,
        PeaSchema,
        PerSchema,
        LifeInsuranceSchema,
        FreelanceSchema,
        BudgetSchema,
        CryptocurrencySchema,
        CryptocurrencyTransactionSchema,
        ReitSchema,
        ReitDividendSchema,
      ],
      directory: dir.path,
    );

    try {
      await _migrate(isarDb: isarDb, driftDb: driftDb);
    } finally {
      await isarDb.close();
    }

    await _backupIsarFile(isarFile);
    await prefs.setBool(_migrationKey, true);
  }

  static Future<bool> _isDriftPopulated(AppDatabase driftDb) async {
    const sql = '''
SELECT (
  (SELECT COUNT(*) FROM savings_entries) +
  (SELECT COUNT(*) FROM cash_entries) +
  (SELECT COUNT(*) FROM crowdfunding_entries) +
  (SELECT COUNT(*) FROM savings_book_entries) +
  (SELECT COUNT(*) FROM counter_strike_entries) +
  (SELECT COUNT(*) FROM pea_entries) +
  (SELECT COUNT(*) FROM per_entries) +
  (SELECT COUNT(*) FROM life_insurance_entries) +
  (SELECT COUNT(*) FROM freelance_entries) +
  (SELECT COUNT(*) FROM budget_entries) +
  (SELECT COUNT(*) FROM cryptocurrency_entries) +
  (SELECT COUNT(*) FROM reit_entries)
) AS total''';

    final row = await driftDb.customSelect(sql).getSingle();
    return row.read<int>('total') > 0;
  }

  static Future<void> _migrate({
    required Isar isarDb,
    required AppDatabase driftDb,
  }) async {
    // Read all data from Isar
    final savings = await isarDb.savings.where().findAll();
    final cashItems = await isarDb.cashs.where().findAll();
    final crowdfundings = await isarDb.crowdfundings.where().findAll();
    final savingsBooks = await isarDb.savingsBooks.where().findAll();
    final counterStrikes = await isarDb.counterStrikes.where().findAll();
    final peas = await isarDb.peas.where().findAll();
    final pers = await isarDb.pers.where().findAll();
    final lifeInsurances = await isarDb.lifeInsurances.where().findAll();
    final freelances = await isarDb.freelances.where().findAll();
    final budgets = await isarDb.budgets.where().findAll();
    final cryptos = await isarDb.cryptocurrencys.where().findAll();
    final cryptoTransactions = await isarDb.cryptocurrencyTransactions
        .where()
        .findAll();
    final reits = await isarDb.reits.where().findAll();
    final reitDividends = await isarDb.reitDividends.where().findAll();

    // Load IsarLinks for relations
    for (final crypto in cryptos) {
      await crypto.transactions.load();
    }
    for (final reit in reits) {
      await reit.dividends.load();
    }

    _validateAllChildRowsAreLinked(
      cryptoTransactions: cryptoTransactions,
      cryptos: cryptos,
      reitDividends: reitDividends,
      reits: reits,
    );

    final expectedCounts = {
      'savings_entries': savings.length,
      'cash_entries': cashItems.length,
      'crowdfunding_entries': crowdfundings.length,
      'savings_book_entries': savingsBooks.length,
      'counter_strike_entries': counterStrikes.length,
      'pea_entries': peas.length,
      'per_entries': pers.length,
      'life_insurance_entries': lifeInsurances.length,
      'freelance_entries': freelances.length,
      'budget_entries': budgets.length,
      'cryptocurrency_entries': cryptos.length,
      'cryptocurrency_transaction_entries': cryptoTransactions.length,
      'reit_entries': reits.length,
      'reit_dividend_entries': reitDividends.length,
    };

    await driftDb.transaction(() async {
      await driftDb.batch((batch) {
        _insertAll(
          batch,
          driftDb.savingsEntries,
          savings
              .map(
                (s) => SavingsEntriesCompanion.insert(
                  id: Value(s.id),
                  type: s.type.name,
                  startAmount: Value(s.startAmount),
                ),
              )
              .toList(),
        );

        _insertAll(
          batch,
          driftDb.cashEntries,
          cashItems
              .map(
                (c) => CashEntriesCompanion.insert(
                  id: Value(c.id),
                  label: c.label,
                  value: c.value,
                ),
              )
              .toList(),
        );

        _insertAll(
          batch,
          driftDb.crowdfundingEntries,
          crowdfundings
              .map(
                (c) => CrowdfundingEntriesCompanion.insert(
                  id: Value(c.id),
                  brutProfit: c.brutProfit,
                  platformName: c.platformName,
                  netProfit: Value(_legacyCrowdfundingNetProfit(c)),
                  taxProfit: Value(c.taxProfit),
                  taxPercentage: Value(c.taxPercentage),
                  receivedAt: Value(c.receivedAt ?? _legacyFallbackDate),
                ),
              )
              .toList(),
        );

        _insertAll(
          batch,
          driftDb.savingsBookEntries,
          savingsBooks
              .map(
                (s) => SavingsBookEntriesCompanion.insert(
                  id: Value(_requireId('SavingsBook', s.id)),
                  name: s.name,
                  startAmount: Value(s.startAmount),
                  withdrawal: Value(s.withdrawal),
                  interests: Value(s.interests),
                ),
              )
              .toList(),
        );

        _insertAll(
          batch,
          driftDb.counterStrikeEntries,
          counterStrikes
              .map(
                (cs) => CounterStrikeEntriesCompanion.insert(
                  id: Value(cs.id),
                  boughtAt: cs.boughtAt,
                  lastUpdate: cs.lastUpdate,
                  imageId: cs.imageId.name,
                  purchaseValue: cs.purchaseValue,
                  currentValue: cs.currentValue,
                  quantity: cs.quantity,
                  wear: Value(cs.wear),
                ),
              )
              .toList(),
        );

        _insertAll(
          batch,
          driftDb.peaEntries,
          peas
              .map(
                (p) => PeaEntriesCompanion.insert(
                  id: Value(p.id),
                  equity: Value(p.equity),
                  costAverage: Value(p.costAverage),
                  lastPrice: Value(p.lastPrice),
                  lastUpdate: Value(p.lastUpdate),
                ),
              )
              .toList(),
        );

        _insertAll(
          batch,
          driftDb.perEntries,
          pers
              .map(
                (p) => PerEntriesCompanion.insert(
                  id: Value(p.id),
                  invested: Value(p.invested),
                  interests: Value(p.interests),
                ),
              )
              .toList(),
        );

        _insertAll(
          batch,
          driftDb.lifeInsuranceEntries,
          lifeInsurances
              .map(
                (li) => LifeInsuranceEntriesCompanion.insert(
                  id: Value(li.id),
                  invested: Value(li.invested),
                  interests: Value(li.interests),
                ),
              )
              .toList(),
        );

        _insertAll(
          batch,
          driftDb.freelanceEntries,
          freelances
              .map(
                (f) => FreelanceEntriesCompanion.insert(
                  id: Value(f.id),
                  annualRevenue: Value(f.annualRevenue),
                ),
              )
              .toList(),
        );

        _insertAll(
          batch,
          driftDb.budgetEntries,
          budgets
              .map(
                (b) => BudgetEntriesCompanion.insert(
                  id: Value(b.id),
                  freelanceIncome: Value(b.freelanceIncome),
                  rent: Value(b.rent),
                  electricity: Value(b.electricity),
                  gas: Value(b.gas),
                  water: Value(b.water),
                  internet: Value(b.internet),
                  homeInsurance: Value(b.homeInsurance),
                  publicTransport: Value(b.publicTransport),
                  groceries: Value(b.groceries),
                  restaurants: Value(b.restaurants),
                  healthInsurance: Value(b.healthInsurance),
                  phone: Value(b.phone),
                  ai: Value(b.ai),
                ),
              )
              .toList(),
        );

        _insertAll(
          batch,
          driftDb.cryptocurrencyEntries,
          cryptos
              .map(
                (crypto) => CryptocurrencyEntriesCompanion.insert(
                  id: Value(_requireId('Cryptocurrency', crypto.id)),
                  type: crypto.type.name,
                  totalCrypto: Value(crypto.totalCrypto),
                  priceMarket: Value(crypto.priceMarket),
                  lastUpdate: Value(crypto.lastUpdate),
                ),
              )
              .toList(),
        );

        _insertAll(
          batch,
          driftDb.cryptocurrencyTransactionEntries,
          [
            for (final crypto in cryptos)
              for (final tx in crypto.transactions)
                CryptocurrencyTransactionEntriesCompanion.insert(
                  id: Value(
                    _requireId('CryptocurrencyTransaction', tx.id),
                  ),
                  cryptocurrencyId: _requireId('Cryptocurrency', crypto.id),
                  date: tx.date,
                  amount: tx.amount,
                ),
          ],
        );

        _insertAll(
          batch,
          driftDb.reitEntries,
          reits
              .map(
                (reit) => ReitEntriesCompanion.insert(
                  id: Value(_requireId('Reit', reit.id)),
                  name: reit.name,
                  boughtOn: reit.boughtOn,
                  shares: reit.shares,
                  price: reit.price,
                ),
              )
              .toList(),
        );

        _insertAll(
          batch,
          driftDb.reitDividendEntries,
          [
            for (final reit in reits)
              for (final dividend in reit.dividends)
                ReitDividendEntriesCompanion.insert(
                  id: Value(_requireId('ReitDividend', dividend.id)),
                  reitId: _requireId('Reit', reit.id),
                  receivedAt: dividend.receivedAt,
                  amount: dividend.amount,
                ),
          ],
        );
      });

      await _validateDriftCounts(driftDb, expectedCounts);
    });
  }

  static void _insertAll<T extends Table, D>(
    Batch batch,
    TableInfo<T, D> table,
    List<Insertable<D>> rows,
  ) {
    if (rows.isEmpty) return;
    batch.insertAll(table, rows);
  }

  static int _requireId(String entityName, int? id) {
    if (id == null) {
      throw StateError('Cannot migrate unsaved $entityName row.');
    }
    return id;
  }

  static double? _legacyCrowdfundingNetProfit(Crowdfunding crowdfunding) {
    if (crowdfunding.netProfit != null) return crowdfunding.netProfit;
    if (crowdfunding.brutProfit.isNegative) return null;

    final taxProfit = crowdfunding.taxProfit;
    if (taxProfit != null) {
      return double.parse(
        (crowdfunding.brutProfit - taxProfit).toStringAsFixed(2),
      );
    }

    return crowdfunding.brutProfit;
  }

  static void _validateAllChildRowsAreLinked({
    required List<CryptocurrencyTransaction> cryptoTransactions,
    required List<Cryptocurrency> cryptos,
    required List<ReitDividend> reitDividends,
    required List<Reit> reits,
  }) {
    final linkedCryptoTransactionIds = <int>{};
    for (final crypto in cryptos) {
      for (final tx in crypto.transactions) {
        final txId = _requireId('CryptocurrencyTransaction', tx.id);
        if (!linkedCryptoTransactionIds.add(txId)) {
          throw StateError(
            'Cannot migrate cryptocurrency transaction $txId because it is '
            'linked to more than one cryptocurrency.',
          );
        }
      }
    }

    final unlinkedCryptoTransactionIds = cryptoTransactions
        .map((tx) => _requireId('CryptocurrencyTransaction', tx.id))
        .where((id) => !linkedCryptoTransactionIds.contains(id))
        .toList();

    if (unlinkedCryptoTransactionIds.isNotEmpty) {
      throw StateError(
        'Cannot migrate unlinked cryptocurrency transactions: '
        '${unlinkedCryptoTransactionIds.join(', ')}.',
      );
    }

    final linkedReitDividendIds = <int>{};
    for (final reit in reits) {
      for (final dividend in reit.dividends) {
        final dividendId = _requireId('ReitDividend', dividend.id);
        if (!linkedReitDividendIds.add(dividendId)) {
          throw StateError(
            'Cannot migrate REIT dividend $dividendId because it is linked to '
            'more than one REIT.',
          );
        }
      }
    }

    final unlinkedReitDividendIds = reitDividends
        .map((dividend) => _requireId('ReitDividend', dividend.id))
        .where((id) => !linkedReitDividendIds.contains(id))
        .toList();

    if (unlinkedReitDividendIds.isNotEmpty) {
      throw StateError(
        'Cannot migrate unlinked REIT dividends: '
        '${unlinkedReitDividendIds.join(', ')}.',
      );
    }
  }

  static Future<void> _validateDriftCounts(
    AppDatabase driftDb,
    Map<String, int> expectedCounts,
  ) async {
    for (final entry in expectedCounts.entries) {
      final row = await driftDb
          .customSelect('SELECT COUNT(*) AS c FROM ${entry.key}')
          .getSingle();
      final actual = row.read<int>('c');
      if (actual != entry.value) {
        throw StateError(
          'Migration validation failed for ${entry.key}: expected '
          '${entry.value}, got $actual.',
        );
      }
    }
  }

  static Future<void> _backupIsarFile(File isarFile) async {
    if (!isarFile.existsSync()) return;

    var backupPath = '${isarFile.path}.migrated_backup';
    var index = 1;
    while (File(backupPath).existsSync()) {
      backupPath = '${isarFile.path}.migrated_backup_$index';
      index++;
    }

    await isarFile.rename(backupPath);
  }
}
