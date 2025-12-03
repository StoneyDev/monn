import 'package:flutter_test/flutter_test.dart';
import 'package:isar_community/isar.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/savings_book/data/savings_book_repository.dart';
import 'package:monn/features/savings_book/domain/savings_book.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../test.dart';
import '../../../test.mocks.dart';
import '../../../utils.dart';

void main() {
  late Isar isar;

  setUpAll(() async {
    await Isar.initializeIsarCore(download: true);

    isar = await Isar.open(
      [SavingsBookSchema],
      directory: '.',
    );

    await isar.writeTxn(() async {
      await isar.savingsBooks.clear();
    });

    final data = [
      SavingsBook()
        ..name = 'Livret 1'
        ..interests = 800
        ..withdrawal = 100
        ..startAmount = 1000,
      SavingsBook()
        ..name = 'Livret 2'
        ..interests = 100
        ..withdrawal = 200
        ..startAmount = 2000,
    ];

    await isar.writeTxn(() async {
      await isar.savingsBooks.putAll(data);
    });
  });

  tearDownAll(() async {
    await isar.close(deleteFromDisk: true);
  });

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
      const savingsBooks = <SavingsBook>[];

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
      final listener = MockListener<AsyncValue<List<SavingsBook>>>();
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
      final savingsBooks = await isar.savingsBooks.where().findAll();

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
      final listener = MockListener<AsyncValue<List<SavingsBook>>>();
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

    test('should return error when repository throws exception', () async {
      // Arrange
      final error = Exception();

      final repository = MockSavingsBookRepository();
      final container = createContainer(
        overrides: [
          savingsBookRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.watchSavingsBooks()).thenThrow(error);

      // Act
      final controller = container.read(watchSavingsBooksProvider.future);

      // Assert
      await expectLater(controller, throwsA(error));
    });
  });

  group('watchPayoutReportSavingsBook', () {
    test('should return the total amount invested', () async {
      // Arrange
      const finalAmount = 3600;
      final savingsBooks = await isar.savingsBooks.where().findAll();

      final savings = Savings()
        ..type = SavingsType.savingsBook
        ..startAmount = 3000;

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

    test('should return error when repository throws exception', () async {
      // Arrange
      final error = Exception();

      final repository = MockSavingsBookRepository();
      final savingRepository = MockSavingsRepository();
      final container = createContainer(
        overrides: [
          savingsBookRepositoryProvider.overrideWithValue(repository),
          savingsRepositoryProvider.overrideWithValue(savingRepository),
        ],
      );

      when(repository.watchSavingsBooks()).thenThrow(error);

      when(savingRepository.getSavings(any)).thenThrow(error);

      // Act
      final controller =
          container.read(watchPayoutReportSavingsBookProvider.future);

      // Assert
      await expectLater(controller, throwsA(error));
    });
  });
}
