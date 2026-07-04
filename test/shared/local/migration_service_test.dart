import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
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
import 'package:monn/shared/local/migration_service.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late Directory tempDir;
  late AppDatabase driftDb;

  setUpAll(() async {
    await Isar.initializeIsarCore(download: true);
  });

  setUp(() async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    tempDir = await Directory.systemTemp.createTemp('monn_migration_test_');
    driftDb = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await driftDb.close();
    if (tempDir.existsSync()) tempDir.deleteSync(recursive: true);
  });

  Future<Isar> openIsar() => Isar.open(
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
    directory: tempDir.path,
  );

  group('MigrationService.migrateIfNeeded', () {
    test('fresh install: no Isar file, marks flag and does nothing', () async {
      await MigrationService.migrateIfNeeded(
        driftDb,
        isarDirectory: tempDir,
      );

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('isar_to_drift_migrated'), isTrue);

      final savingsCount = await driftDb
          .customSelect('SELECT COUNT(*) AS c FROM savings_entries')
          .getSingle();
      expect(savingsCount.read<int>('c'), 0);
    });

    test('flag already set: skips even if Isar file exists', () async {
      SharedPreferences.setMockInitialValues(
        <String, Object>{'isar_to_drift_migrated': true},
      );
      final isar = await openIsar();
      await isar.writeTxn(() async {
        await isar.savings.put(
          Savings()
            ..type = SavingsType.cash
            ..startAmount = 100,
        );
      });
      await isar.close();

      await MigrationService.migrateIfNeeded(
        driftDb,
        isarDirectory: tempDir,
      );

      final count = await driftDb
          .customSelect('SELECT COUNT(*) AS c FROM savings_entries')
          .getSingle();
      expect(count.read<int>('c'), 0);
    });

    test(
      'full migration: copies all rows and preserves parent-child links',
      () async {
        final isar = await openIsar();

        await isar.writeTxn(() async {
          await isar.savings.put(
            Savings()
              ..type = SavingsType.cash
              ..startAmount = 500,
          );
          await isar.savings.put(
            Savings()
              ..type = SavingsType.cryptocurrency
              ..startAmount = 1000,
          );

          await isar.cashs.put(
            Cash()
              ..label = 'Wallet'
              ..value = 250,
          );

          await isar.counterStrikes.put(
            CounterStrike()
              ..boughtAt = DateTime(2025)
              ..lastUpdate = DateTime(2025, 6)
              ..imageId = CounterStrikeItem.ak47Bloodsport
              ..purchaseValue = 100
              ..currentValue = 150
              ..quantity = 2
              ..wear = 0.15,
          );

          // Crypto with 2 transactions
          final btc = Cryptocurrency()
            ..type = CryptoType.bitcoin
            ..totalCrypto = 0.5
            ..priceMarket = 50000
            ..lastUpdate = DateTime(2025, 6);
          await isar.cryptocurrencys.put(btc);

          final tx1 = CryptocurrencyTransaction()
            ..date = DateTime(2025)
            ..amount = 0.3;
          final tx2 = CryptocurrencyTransaction()
            ..date = DateTime(2025, 2)
            ..amount = 0.2;
          await isar.cryptocurrencyTransactions.put(tx1);
          await isar.cryptocurrencyTransactions.put(tx2);
          btc.transactions.addAll([tx1, tx2]);
          await btc.transactions.save();

          // Reit with 3 dividends
          final reit = Reit()
            ..name = 'MyReit'
            ..boughtOn = DateTime(2024)
            ..shares = 10
            ..price = 20;
          await isar.reits.put(reit);

          final dividends = [
            ReitDividend()
              ..receivedAt = DateTime(2025, 3)
              ..amount = 5,
            ReitDividend()
              ..receivedAt = DateTime(2025, 6)
              ..amount = 6,
            ReitDividend()
              ..receivedAt = DateTime(2025, 9)
              ..amount = 7,
          ];
          for (final d in dividends) {
            await isar.reitDividends.put(d);
          }
          reit.dividends.addAll(dividends);
          await reit.dividends.save();
        });
        await isar.close();

        await MigrationService.migrateIfNeeded(
          driftDb,
          isarDirectory: tempDir,
        );

        // Row counts preserved
        final savings = await driftDb.select(driftDb.savingsEntries).get();
        expect(savings, hasLength(2));

        final cash = await driftDb.select(driftDb.cashEntries).get();
        expect(cash, hasLength(1));
        expect(cash.single.label, 'Wallet');

        final cs = await driftDb.select(driftDb.counterStrikeEntries).get();
        expect(cs, hasLength(1));
        expect(cs.single.imageId, 'ak47Bloodsport');

        // Crypto parent + child link
        final cryptos = await driftDb
            .select(driftDb.cryptocurrencyEntries)
            .get();
        expect(cryptos, hasLength(1));
        expect(cryptos.single.type, 'bitcoin');

        final txs = await (driftDb.select(
          driftDb.cryptocurrencyTransactionEntries,
        )..where((t) => t.cryptocurrencyId.equals(cryptos.single.id))).get();
        expect(txs, hasLength(2));
        expect(txs.map((t) => t.amount).toSet(), {0.3, 0.2});

        // Reit parent + child link
        final reits = await driftDb.select(driftDb.reitEntries).get();
        expect(reits, hasLength(1));
        expect(reits.single.name, 'MyReit');

        final divs = await (driftDb.select(
          driftDb.reitDividendEntries,
        )..where((t) => t.reitId.equals(reits.single.id))).get();
        expect(divs, hasLength(3));
        expect(divs.map((d) => d.amount).toSet(), {5, 6, 7});

        // Flag set and Isar file backed up
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getBool('isar_to_drift_migrated'), isTrue);
        expect(
          File(p.join(tempDir.path, 'default.isar')).existsSync(),
          isFalse,
        );
        expect(
          File(
            p.join(tempDir.path, 'default.isar.migrated_backup'),
          ).existsSync(),
          isTrue,
        );
      },
    );

    test('preserves Isar primary keys and relationship foreign keys', () async {
      final isar = await openIsar();

      await isar.writeTxn(() async {
        await isar.savings.put(
          Savings()
            ..id = 7
            ..type = SavingsType.cash
            ..startAmount = 500,
        );

        await isar.cashs.put(
          Cash()
            ..id = 42
            ..label = 'Wallet'
            ..value = 250,
        );

        final crypto = Cryptocurrency()
          ..id = 10
          ..type = CryptoType.ethereum
          ..totalCrypto = 1.5
          ..priceMarket = 3000;
        await isar.cryptocurrencys.put(crypto);

        final transaction = CryptocurrencyTransaction()
          ..id = 99
          ..date = DateTime(2025)
          ..amount = 1.5;
        await isar.cryptocurrencyTransactions.put(transaction);
        crypto.transactions.add(transaction);
        await crypto.transactions.save();

        final reit = Reit()
          ..id = 20
          ..name = 'StableReit'
          ..boughtOn = DateTime(2024)
          ..shares = 8
          ..price = 30;
        await isar.reits.put(reit);

        final dividend = ReitDividend()
          ..id = 21
          ..receivedAt = DateTime(2025, 3)
          ..amount = 12;
        await isar.reitDividends.put(dividend);
        reit.dividends.add(dividend);
        await reit.dividends.save();
      });
      await isar.close();

      await MigrationService.migrateIfNeeded(
        driftDb,
        isarDirectory: tempDir,
      );

      final savings = await driftDb.select(driftDb.savingsEntries).get();
      expect(savings.single.id, 7);

      final cash = await driftDb.select(driftDb.cashEntries).get();
      expect(cash.single.id, 42);

      final crypto = await driftDb.select(driftDb.cryptocurrencyEntries).get();
      expect(crypto.single.id, 10);

      final transactions = await driftDb
          .select(driftDb.cryptocurrencyTransactionEntries)
          .get();
      expect(transactions.single.id, 99);
      expect(transactions.single.cryptocurrencyId, 10);

      final reits = await driftDb.select(driftDb.reitEntries).get();
      expect(reits.single.id, 20);

      final dividends = await driftDb.select(driftDb.reitDividendEntries).get();
      expect(dividends.single.id, 21);
      expect(dividends.single.reitId, 20);
    });

    test('aborts instead of dropping unlinked Isar child rows', () async {
      final isar = await openIsar();

      await isar.writeTxn(() async {
        await isar.cryptocurrencys.put(
          Cryptocurrency()
            ..id = 10
            ..type = CryptoType.bitcoin
            ..totalCrypto = 0.5,
        );

        await isar.cryptocurrencyTransactions.put(
          CryptocurrencyTransaction()
            ..id = 99
            ..date = DateTime(2025)
            ..amount = 0.5,
        );
      });
      await isar.close();

      await expectLater(
        MigrationService.migrateIfNeeded(
          driftDb,
          isarDirectory: tempDir,
        ),
        throwsA(isA<StateError>()),
      );

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('isar_to_drift_migrated'), isNull);
      expect(File(p.join(tempDir.path, 'default.isar')).existsSync(), isTrue);
      expect(
        File(p.join(tempDir.path, 'default.isar.migrated_backup')).existsSync(),
        isFalse,
      );

      final cryptos = await driftDb.select(driftDb.cryptocurrencyEntries).get();
      expect(cryptos, isEmpty);
    });

    test('normalizes legacy crowdfunding nulls used by runtime', () async {
      final isar = await openIsar();

      await isar.writeTxn(() async {
        await isar.crowdfundings.put(
          Crowdfunding()
            ..id = 8
            ..platformName = 'Legacy LPB'
            ..brutProfit = 100,
        );
      });
      await isar.close();

      await MigrationService.migrateIfNeeded(
        driftDb,
        isarDirectory: tempDir,
      );

      final crowdfundings = await driftDb
          .select(driftDb.crowdfundingEntries)
          .get();
      expect(crowdfundings, hasLength(1));
      expect(crowdfundings.single.id, 8);
      expect(
        crowdfundings.single.receivedAt,
        DateTime.fromMillisecondsSinceEpoch(0),
      );
      expect(crowdfundings.single.netProfit, 100);
      expect(crowdfundings.single.taxProfit, isNull);
      expect(crowdfundings.single.taxPercentage, isNull);
    });

    test('idempotent: second call is a no-op', () async {
      final isar = await openIsar();
      await isar.writeTxn(() async {
        await isar.cashs.put(
          Cash()
            ..label = 'Wallet'
            ..value = 100,
        );
      });
      await isar.close();

      await MigrationService.migrateIfNeeded(
        driftDb,
        isarDirectory: tempDir,
      );
      await MigrationService.migrateIfNeeded(
        driftDb,
        isarDirectory: tempDir,
      );

      final cash = await driftDb.select(driftDb.cashEntries).get();
      expect(cash, hasLength(1));
    });

    test(
      'defence in depth: Drift populated but flag unset still skips',
      () async {
        // Simulate post-migration state with stale prefs: Drift has data, flag
        // not set, Isar file never existed (was deleted).
        await driftDb
            .into(driftDb.cashEntries)
            .insert(
              CashEntriesCompanion.insert(label: 'Existing', value: 42),
            );
        final isar = await openIsar();
        await isar.writeTxn(() async {
          await isar.cashs.put(
            Cash()
              ..label = 'FromIsar'
              ..value = 999,
          );
        });
        await isar.close();

        await MigrationService.migrateIfNeeded(
          driftDb,
          isarDirectory: tempDir,
        );

        final cash = await driftDb.select(driftDb.cashEntries).get();
        expect(cash, hasLength(1));
        expect(cash.single.label, 'Existing');

        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getBool('isar_to_drift_migrated'), isTrue);
      },
    );

    test('enum strings round-trip correctly', () async {
      final isar = await openIsar();
      await isar.writeTxn(() async {
        for (final type in SavingsType.values) {
          await isar.savings.put(Savings()..type = type);
        }
        for (final type in CryptoType.values) {
          await isar.cryptocurrencys.put(Cryptocurrency()..type = type);
        }
        await isar.counterStrikes.put(
          CounterStrike()
            ..boughtAt = DateTime(2025)
            ..lastUpdate = DateTime(2025)
            ..imageId = CounterStrikeItem.skeletonFade
            ..purchaseValue = 0
            ..currentValue = 0
            ..quantity = 1,
        );
      });
      await isar.close();

      await MigrationService.migrateIfNeeded(
        driftDb,
        isarDirectory: tempDir,
      );

      final savings = await driftDb.select(driftDb.savingsEntries).get();
      expect(
        savings.map((s) => s.savingsType).toSet(),
        SavingsType.values.toSet(),
      );

      final cryptos = await driftDb.select(driftDb.cryptocurrencyEntries).get();
      expect(
        cryptos.map((c) => c.cryptoType).toSet(),
        CryptoType.values.toSet(),
      );

      final cs = await driftDb.select(driftDb.counterStrikeEntries).get();
      expect(cs.single.imageItem, CounterStrikeItem.skeletonFade);
    });
  });
}
