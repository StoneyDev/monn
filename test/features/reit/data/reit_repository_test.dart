import 'package:flutter_test/flutter_test.dart';
import 'package:isar_community/isar.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/reit/domain/reit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../test.dart';
import '../../../test.mocks.dart';
import '../../../utils.dart';

void main() {
  late Isar isar;

  setUpAll(() async {
    await Isar.initializeIsarCore(download: true);

    isar = await Isar.open(
      [ReitSchema, ReitDividendSchema],
      directory: '.',
    );

    await isar.writeTxn(() async {
      await isar.reits.clear();
      await isar.reitDividends.clear();
    });

    final dividends = [
      ReitDividend()
        ..receivedAt = DateTime(2010)
        ..amount = 89.21,
      ReitDividend()
        ..receivedAt = DateTime(2012)
        ..amount = 45.67,
    ];

    final reit = Reit()
      ..name = 'Random SCPI'
      ..boughtOn = DateTime.now()
      ..price = 567
      ..shares = 10
      ..dividends.addAll(dividends);

    await isar.writeTxn(() async {
      await isar.reits.put(reit);
      await isar.reitDividends.putAll(dividends);
      await reit.dividends.save();
    });
  });

  tearDownAll(() async {
    await isar.close(deleteFromDisk: true);
  });

  group('reitRepository', () {
    test('should return ReitRepository when a call is made', () {
      // Arrange
      final repository = MockReitRepository();
      final container = createContainer(
        overrides: [
          reitRepositoryProvider.overrideWithValue(repository),
        ],
      );

      // Act
      final controller = container.read(reitRepositoryProvider);

      // Assert
      expect(controller, isA<ReitRepository>());
    });
  });

  group('watchReits', () {
    test('should return empty list when no data is found', () async {
      // Arrange
      const reits = <Reit>[];

      final repository = MockReitRepository();
      final container = createContainer(
        overrides: [
          reitRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.watchReits()).thenAnswer(
        (_) => Stream.value(reits),
      );

      // Act
      final listener = MockListener<AsyncValue<List<Reit>>>();
      container.listen(
        watchReitsProvider,
        listener.call,
        fireImmediately: true,
      );

      final results = await container.read(watchReitsProvider.future);

      // Assert
      verifyInOrder([
        listener(null, const AsyncLoading()),
        listener(const AsyncLoading(), AsyncData(results)),
      ]);
      verifyNoMoreInteractions(listener);
      expect(results, isEmpty);
    });

    test('should return data from database', () async {
      // Arrange
      final reits = await isar.reits.where().findAll();

      final repository = MockReitRepository();
      final container = createContainer(
        overrides: [
          reitRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.watchReits()).thenAnswer(
        (_) => Stream.value(reits),
      );

      // Act
      final listener = MockListener<AsyncValue<List<Reit>>>();
      container.listen(
        watchReitsProvider,
        listener.call,
        fireImmediately: true,
      );

      final results = await container.read(watchReitsProvider.future);

      // Assert
      verifyInOrder([
        listener(null, const AsyncLoading()),
        listener(const AsyncLoading(), AsyncData(results)),
      ]);
      verifyNoMoreInteractions(listener);
      expect(results, reits);
    });
  });

  group('watchPayoutReportReit', () {
    test('should return the total amount invested', () async {
      // Arrange
      const finalAmount = 2134.88;
      final reits = await isar.reits.where().findAll();

      final savings = Savings()
        ..type = SavingsType.reit
        ..startAmount = 2000;

      final repository = MockReitRepository();
      final savingRepository = MockSavingsRepository();
      final container = createContainer(
        overrides: [
          reitRepositoryProvider.overrideWithValue(repository),
          savingsRepositoryProvider.overrideWithValue(savingRepository),
        ],
      );

      when(repository.watchReits()).thenAnswer(
        (_) => Stream.value(reits),
      );

      when(savingRepository.getSavings(any)).thenAnswer(
        (_) => Future.value(savings),
      );

      // Act
      final listener = MockListener<AsyncValue<PayoutReportData>>();
      container.listen(
        watchPayoutReportReitProvider,
        listener.call,
        fireImmediately: true,
      );

      final results = await container.read(
        watchPayoutReportReitProvider.future,
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
