// ignore_for_file: lines_longer_than_80_chars .

import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/cryptocurrency/presentation/cryptocurrency_screen/controllers/crypto_chart_provider.dart';
import 'package:monn/features/portfolio/data/savings_repository.dart';
import 'package:monn/shared/domain/payout_report_data.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/widgets/charts/chart.dart';
import 'package:monn/utils/app_colors.dart';

import '../../../test.dart';
import '../../../test.mocks.dart';
import '../../../utils.dart';

void main() {
  group('cryptocurrencyRepository', () {
    test('should return CryptocurrencyRepository when a call is made', () {
      // Arrange
      final repository = MockCryptocurrencyRepository();
      final container = createContainer(
        overrides: [
          cryptocurrencyRepositoryProvider.overrideWithValue(repository),
        ],
      );

      // Act
      final controller = container.read(cryptocurrencyRepositoryProvider);

      // Assert
      expect(controller, isA<CryptocurrencyRepository>());
    });
  });

  group('editCryptocurrency', () {
    test('attaches transactions to the updated crypto row', () async {
      // Arrange
      final db = AppDatabase(NativeDatabase.memory());
      addTearDown(db.close);
      final repository = CryptocurrencyRepository(db, SavingsRepository(db));
      final transactionDate = DateTime(2026, 1, 2);
      final (:bitcoinId, :ethereumId) = await _insertCryptoFixtures(db);

      // Act
      await repository.editCryptocurrency(
        crypto: CryptocurrencyEntriesCompanion(
          type: Value(CryptoType.bitcoin.name),
          totalCrypto: const Value(1.5),
          priceMarket: const Value(100),
        ),
        transactionAmount: 0.5,
        transactionDate: transactionDate,
      );

      // Assert
      final bitcoin = await repository.getCryptocurrency(CryptoType.bitcoin);
      final ethereum = await repository.getCryptocurrency(CryptoType.ethereum);

      expect(ethereum.crypto.id, ethereumId);
      expect(bitcoin.transactions, hasLength(1));
      expect(bitcoin.transactions.single.cryptocurrencyId, bitcoinId);
      expect(bitcoin.transactions.single.amount, 0.5);
      expect(bitcoin.transactions.single.date, transactionDate);
      expect(ethereum.transactions, isEmpty);
    });
  });

  group('recordTransaction', () {
    test('updates crypto, transaction and invested fiat atomically', () async {
      final db = AppDatabase(NativeDatabase.memory());
      addTearDown(db.close);
      final repository = CryptocurrencyRepository(db, SavingsRepository(db));
      final date = DateTime(2026, 7, 26);

      await repository.recordTransaction(
        type: CryptoType.bitcoin,
        cryptoAmount: 0.25,
        date: date,
        investedFiatAmount: 15000,
      );

      final bitcoin = await repository.getCryptocurrency(CryptoType.bitcoin);
      final savings = await db.select(db.savingsEntries).getSingle();

      expect(bitcoin.crypto.totalCrypto, 0.25);
      expect(bitcoin.transactions.single.amount, 0.25);
      expect(bitcoin.transactions.single.date, date);
      expect(savings.type, 'cryptocurrency');
      expect(savings.startAmount, 15000);
    });

    test('rolls back every write when savings update fails', () async {
      final db = AppDatabase(NativeDatabase.memory());
      addTearDown(db.close);
      final repository = CryptocurrencyRepository(db, SavingsRepository(db));
      await db.customStatement('''
CREATE TRIGGER fail_crypto_savings
BEFORE INSERT ON savings_entries
BEGIN
  SELECT RAISE(ABORT, 'forced savings failure');
END;
''');

      await expectLater(
        repository.recordTransaction(
          type: CryptoType.bitcoin,
          cryptoAmount: 0.25,
          date: DateTime(2026, 7, 26),
          investedFiatAmount: 15000,
        ),
        throwsA(isA<Exception>()),
      );

      expect(await db.select(db.cryptocurrencyEntries).get(), isEmpty);
      expect(
        await db.select(db.cryptocurrencyTransactionEntries).get(),
        isEmpty,
      );
      expect(await db.select(db.savingsEntries).get(), isEmpty);
    });
  });

  group('watchCryptocurrencies', () {
    test('should return empty list when no data is found', () async {
      // Arrange
      const cryptocurrencies = <CryptocurrencyEntry>[];

      final repository = MockCryptocurrencyRepository();
      final container = createContainer(
        overrides: [
          cryptocurrencyRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.watchCryptocurrencies()).thenAnswer(
        (_) => Stream.value(cryptocurrencies),
      );

      // Act
      final listener = MockListener<AsyncValue<List<CryptocurrencyEntry>>>();
      container.listen(
        watchCryptocurrenciesProvider,
        listener.call,
        fireImmediately: true,
      );

      final results = await container.read(
        watchCryptocurrenciesProvider.future,
      );

      // Assert
      verifyInOrder([
        listener(null, const AsyncLoading()),
        listener(const AsyncLoading(), AsyncData(results)),
      ]);
      verifyNoMoreInteractions(listener);
      expect(results, isEmpty);
    });
  });

  group('watchCryptoChart', () {
    test(
      'should return Chart with extra light gray color list when no data is found',
      () async {
        // Arrange
        const cryptocurrencies = <CryptocurrencyEntry>[];
        const chart = Chart(totalAmount: 0, data: []);

        final repository = MockCryptocurrencyRepository();
        final container = createContainer(
          overrides: [
            cryptocurrencyRepositoryProvider.overrideWithValue(repository),
          ],
        );

        when(repository.watchCryptocurrencies()).thenAnswer(
          (_) => Stream.value(cryptocurrencies),
        );

        // Act
        final listener = MockListener<AsyncValue<Chart>>();
        container.listen(
          watchCryptoChartProvider,
          listener.call,
          fireImmediately: true,
        );

        final results = await container.read(watchCryptoChartProvider.future);

        // Assert
        verifyInOrder([
          listener(null, const AsyncLoading()),
          listener(const AsyncLoading(), const AsyncData(chart)),
        ]);
        verifyNoMoreInteractions(listener);
        expect(results, chart);
      },
    );

    test('should return the data to build the graph', () async {
      // Arrange
      const chart = Chart(
        totalAmount: 193742.07,
        data: [
          ChartData(portion: 54.41, color: AppColors.btc),
          ChartData(portion: 45.59, color: AppColors.eth),
        ],
      );

      final cryptocurrencies = [
        const CryptocurrencyEntry(
          id: 1,
          type: 'bitcoin',
          totalCrypto: 1.722,
          priceMarket: 98512.66,
        ),
        const CryptocurrencyEntry(
          id: 2,
          type: 'ethereum',
          totalCrypto: 7.407,
          priceMarket: 3254.12,
        ),
      ];

      final repository = MockCryptocurrencyRepository();
      final container = createContainer(
        overrides: [
          cryptocurrencyRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.watchCryptocurrencies()).thenAnswer(
        (_) => Stream.value(cryptocurrencies),
      );

      // Act
      final listener = MockListener<AsyncValue<Chart>>();
      container.listen(
        watchCryptoChartProvider,
        listener.call,
        fireImmediately: true,
      );

      final results = await container.read(watchCryptoChartProvider.future);

      // Assert
      verifyInOrder([
        listener(null, const AsyncLoading()),
        listener(const AsyncLoading(), const AsyncData(chart)),
      ]);
      verifyNoMoreInteractions(listener);
      expect(results, chart);
    });
  });

  group('watchPayoutReportCrypto', () {
    test('should return the total amount invested', () async {
      // Arrange
      const finalAmount = 193742.07;
      final cryptocurrencies = [
        const CryptocurrencyEntry(
          id: 1,
          type: 'bitcoin',
          totalCrypto: 1.722,
          priceMarket: 98512.66,
        ),
        const CryptocurrencyEntry(
          id: 2,
          type: 'ethereum',
          totalCrypto: 7.407,
          priceMarket: 3254.12,
        ),
      ];

      final repository = MockCryptocurrencyRepository();
      final container = createContainer(
        overrides: [
          cryptocurrencyRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.watchCryptocurrencies()).thenAnswer(
        (_) => Stream.value(cryptocurrencies),
      );

      // Act
      final listener = MockListener<AsyncValue<PayoutReportData>>();
      container.listen(
        watchPayoutReportCryptoProvider,
        listener.call,
        fireImmediately: true,
      );

      final results = await container.read(
        watchPayoutReportCryptoProvider.future,
      );

      // Assert
      verifyInOrder([
        listener(null, const AsyncLoading()),
        listener(const AsyncLoading(), AsyncData(results)),
      ]);
      verifyNoMoreInteractions(listener);
      expect(results.finalAmount, finalAmount);
    });
  });
}

Future<({int bitcoinId, int ethereumId})> _insertCryptoFixtures(
  AppDatabase db,
) async {
  final bitcoinId = await db
      .into(db.cryptocurrencyEntries)
      .insert(
        CryptocurrencyEntriesCompanion.insert(
          type: CryptoType.bitcoin.name,
          totalCrypto: const Value(1),
          priceMarket: const Value(100),
        ),
      );
  final ethereumId = await db
      .into(db.cryptocurrencyEntries)
      .insert(
        CryptocurrencyEntriesCompanion.insert(
          type: CryptoType.ethereum.name,
          totalCrypto: const Value(2),
          priceMarket: const Value(200),
        ),
      );

  return (bitcoinId: bitcoinId, ethereumId: ethereumId);
}
