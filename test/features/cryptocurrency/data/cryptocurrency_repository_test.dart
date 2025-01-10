// ignore_for_file: lines_longer_than_80_chars .

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/features/settings/presentation/settings_screen/controllers/theme_switch_controller.dart';
import 'package:monn/shared/widgets/charts/chart.dart';
import 'package:monn/utils/app_colors.dart';

import '../../../test.dart';
import '../../../test.mocks.dart';
import '../../../utils.dart';

void main() {
  late Isar isar;

  setUpAll(() async {
    await Isar.initializeIsarCore(download: true);

    isar = await Isar.open(
      [CryptocurrencySchema, CryptocurrencyTransactionSchema],
      directory: '.',
    );

    await isar.writeTxn(() async {
      await isar.cryptocurrencys.clear();
      await isar.cryptocurrencyTransactions.clear();
    });

    final bitcoinTransactions = [
      CryptocurrencyTransaction()
        ..date = DateTime(2010)
        ..amount = 0.5,
      CryptocurrencyTransaction()
        ..date = DateTime(2012)
        ..amount = 1.222,
    ];
    final bitcoin = Cryptocurrency()
      ..type = CryptoType.bitcoin
      ..totalCrypto = 1.722
      ..priceMarket = 98512.66
      ..transactions.addAll(bitcoinTransactions);

    final ethereumTransactions = [
      CryptocurrencyTransaction()
        ..date = DateTime(2019)
        ..amount = 0.984,
      CryptocurrencyTransaction()
        ..date = DateTime(2022)
        ..amount = 6.423,
    ];
    final ethereum = Cryptocurrency()
      ..type = CryptoType.ethereum
      ..totalCrypto = 7.407
      ..priceMarket = 3254.12
      ..transactions.addAll(ethereumTransactions);

    await isar.writeTxn(() async {
      await isar.cryptocurrencys.putAll([bitcoin, ethereum]);
      await isar.cryptocurrencyTransactions.putAll(
        [...bitcoinTransactions, ...ethereumTransactions],
      );
      await bitcoin.transactions.save();
      await ethereum.transactions.save();
    });
  });

  tearDownAll(() async {
    await isar.close(deleteFromDisk: true);
  });

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

  group('watchCryptocurrencies', () {
    test('should return empty list when no data is found', () async {
      // Arrange
      const cryptocurrencies = <Cryptocurrency>[];

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
      final listener = MockListener<AsyncValue<List<Cryptocurrency>>>();
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

    test('should return error when repository throws exception', () async {
      // Arrange
      final error = Exception();

      final repository = MockCryptocurrencyRepository();
      final container = createContainer(
        overrides: [
          cryptocurrencyRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.watchCryptocurrencies()).thenThrow(error);

      // Act
      final controller = container.read(watchCryptocurrenciesProvider.future);

      // Assert
      await expectLater(controller, throwsA(error));
    });
  });

  group('watchCryptoChart', () {
    test(
      'should return Chart with extra light gray color list when no data is found',
      () async {
        // Arrange
        const cryptocurrencies = <Cryptocurrency>[];
        const chart = Chart(
          totalAmount: 0,
          data: [ChartData(portion: 100, color: AppColors.gray300)],
        );

        final repository = MockCryptocurrencyRepository();
        final container = createContainer(
          overrides: [
            cryptocurrencyRepositoryProvider.overrideWithValue(repository),
            themeSwitchControllerProvider.overrideWith(
              ThemeSwitchControllerMock.new,
            ),
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
          ChartData(portion: 21.35, color: AppColors.btc),
          ChartData(portion: 78.65, color: AppColors.eth),
        ],
      );

      final cryptocurrencies = await isar.cryptocurrencys.where().findAll();

      final repository = MockCryptocurrencyRepository();
      final container = createContainer(
        overrides: [
          cryptocurrencyRepositoryProvider.overrideWithValue(repository),
          themeSwitchControllerProvider.overrideWith(
            ThemeSwitchControllerMock.new,
          ),
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

    test('should return error when repository throws exception', () async {
      // Arrange
      final error = Exception();

      final repository = MockCryptocurrencyRepository();
      final container = createContainer(
        overrides: [
          cryptocurrencyRepositoryProvider.overrideWithValue(repository),
          themeSwitchControllerProvider.overrideWith(
            ThemeSwitchControllerMock.new,
          ),
        ],
      );

      when(repository.watchCryptocurrencies()).thenThrow(error);

      // Act
      final controller = container.read(watchCryptoChartProvider.future);

      // Assert
      await expectLater(controller, throwsA(error));
    });
  });

  group('watchPayoutReportCrypto', () {
    test('should return the total amount invested', () async {
      // Arrange
      const finalAmount = 193742.07;
      final cryptocurrencies = await isar.cryptocurrencys.where().findAll();

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

    test('should return error when repository throws exception', () async {
      // Arrange
      final error = Exception();

      final repository = MockCryptocurrencyRepository();
      final container = createContainer(
        overrides: [
          cryptocurrencyRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.watchCryptocurrencies()).thenThrow(error);

      // Act
      final controller = container.read(watchPayoutReportCryptoProvider.future);

      // Assert
      await expectLater(controller, throwsA(error));
    });
  });
}
