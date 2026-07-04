import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/reit/domain/reit_with_dividends.dart';
import 'package:monn/shared/local/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../test.dart';
import '../../../test.mocks.dart';
import '../../../utils.dart';

void main() {
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

  group('deleteReit', () {
    test('deletes dividends through the foreign-key cascade', () async {
      // Arrange
      final db = AppDatabase(NativeDatabase.memory());
      addTearDown(db.close);
      final repository = ReitRepository(db);

      final reitId = await db
          .into(db.reitEntries)
          .insert(
            ReitEntriesCompanion.insert(
              name: 'Cascade SCPI',
              boughtOn: DateTime(2026),
              shares: 2,
              price: 100,
            ),
          );
      await db
          .into(db.reitDividendEntries)
          .insert(
            ReitDividendEntriesCompanion.insert(
              reitId: reitId,
              receivedAt: DateTime(2026, 2),
              amount: 12,
            ),
          );

      // Act
      await repository.deleteReit(reitId);

      // Assert
      final dividends = await db.select(db.reitDividendEntries).get();
      expect(dividends, isEmpty);
    });
  });

  group('watchReits', () {
    test('should return empty list when no data is found', () async {
      // Arrange
      const reits = <ReitWithDividends>[];

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
      final listener = MockListener<AsyncValue<List<ReitWithDividends>>>();
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
      final reits = [
        ReitWithDividends(
          reit: ReitEntry(
            id: 1,
            name: 'Random SCPI',
            boughtOn: DateTime.now(),
            price: 567,
            shares: 10,
          ),
          dividends: [
            ReitDividendEntry(
              id: 1,
              reitId: 1,
              receivedAt: DateTime(2010),
              amount: 89.21,
            ),
            ReitDividendEntry(
              id: 2,
              reitId: 1,
              receivedAt: DateTime(2012),
              amount: 45.67,
            ),
          ],
        ),
      ];

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
      final listener = MockListener<AsyncValue<List<ReitWithDividends>>>();
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
      final reits = [
        ReitWithDividends(
          reit: ReitEntry(
            id: 1,
            name: 'Random SCPI',
            boughtOn: DateTime.now(),
            price: 567,
            shares: 10,
          ),
          dividends: [
            ReitDividendEntry(
              id: 1,
              reitId: 1,
              receivedAt: DateTime(2010),
              amount: 89.21,
            ),
            ReitDividendEntry(
              id: 2,
              reitId: 1,
              receivedAt: DateTime(2012),
              amount: 45.67,
            ),
          ],
        ),
      ];

      const savings = SavingsEntry(
        id: 1,
        type: 'reit',
        startAmount: 2000,
      );

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
