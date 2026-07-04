import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/features/savings_book/data/savings_book_repository.dart';
import 'package:monn/shared/local/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../test.dart';
import '../../../test.mocks.dart';
import '../../../utils.dart';

void main() {
  group('cryptocurrencyRepository', () {
    test('should return ReitRepository when a call is made', () {
      // Arrange
      final repository = MockSavingsBookRepository();
      final container = createContainer(
        overrides: [
          savingsBookRepositoryProvider.overrideWithValue(repository),
        ],
      );

      // Act
      final controller = container.read(savingsBookRepositoryProvider);

      // Assert
      expect(controller, isA<SavingsBookRepository>());
    });
  });

  group('watchSavingsBooks', () {
    test('should return empty list when no data is found', () async {
      // Arrange
      const savingsBooks = <SavingsBookEntry>[];

      final repository = MockSavingsBookRepository();
      final container = createContainer(
        overrides: [
          savingsBookRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.watchSavingsBooks()).thenAnswer(
        (_) => Stream.value(savingsBooks),
      );

      // Act
      final listener = MockListener<AsyncValue<List<SavingsBookEntry>>>();
      container.listen(
        watchSavingsBooksProvider,
        listener.call,
        fireImmediately: true,
      );

      final results = await container.read(watchSavingsBooksProvider.future);

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
      final savingsBooks = [
        const SavingsBookEntry(
          id: 1,
          name: 'Livret 1',
          interests: 800,
          withdrawal: 100,
          startAmount: 1000,
        ),
        const SavingsBookEntry(
          id: 2,
          name: 'Livret 2',
          interests: 100,
          withdrawal: 200,
          startAmount: 2000,
        ),
      ];

      final repository = MockSavingsBookRepository();
      final container = createContainer(
        overrides: [
          savingsBookRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.watchSavingsBooks()).thenAnswer(
        (_) => Stream.value(savingsBooks),
      );

      // Act
      final listener = MockListener<AsyncValue<List<SavingsBookEntry>>>();
      container.listen(
        watchSavingsBooksProvider,
        listener.call,
        fireImmediately: true,
      );

      final results = await container.read(watchSavingsBooksProvider.future);

      // Assert
      verifyInOrder([
        listener(null, const AsyncLoading()),
        listener(const AsyncLoading(), AsyncData(results)),
      ]);
      verifyNoMoreInteractions(listener);
      expect(results, savingsBooks);
    });
  });

  group('watchPayoutReportSavingsBook', () {
    test('should return the total amount invested', () async {
      // Arrange
      const finalAmount = 3600;
      final savingsBooks = [
        const SavingsBookEntry(
          id: 1,
          name: 'Livret 1',
          interests: 800,
          withdrawal: 100,
          startAmount: 1000,
        ),
        const SavingsBookEntry(
          id: 2,
          name: 'Livret 2',
          interests: 100,
          withdrawal: 200,
          startAmount: 2000,
        ),
      ];

      const savings = SavingsEntry(
        id: 1,
        type: 'savingsBook',
        startAmount: 3000,
      );

      final repository = MockSavingsBookRepository();
      final savingRepository = MockSavingsRepository();
      final container = createContainer(
        overrides: [
          savingsBookRepositoryProvider.overrideWithValue(repository),
          savingsRepositoryProvider.overrideWithValue(savingRepository),
        ],
      );

      when(repository.watchSavingsBooks()).thenAnswer(
        (_) => Stream.value(savingsBooks),
      );

      when(savingRepository.getSavings(any)).thenAnswer(
        (_) => Future.value(savings),
      );

      // Act
      final listener = MockListener<AsyncValue<PayoutReportData>>();
      container.listen(
        watchPayoutReportSavingsBookProvider,
        listener.call,
        fireImmediately: true,
      );

      final results = await container.read(
        watchPayoutReportSavingsBookProvider.future,
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
