import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';

import '../../../test.dart';
import '../../../test.mocks.dart';
import '../../../utils.dart';

void main() {
  group('savingsRepository', () {
    test('should return SavingsRepository when a call is made', () {
      // Arrange
      final repository = MockSavingsRepository();
      final container = createContainer(
        overrides: [
          savingsRepositoryProvider.overrideWithValue(repository),
        ],
      );

      // Act
      final controller = container.read(savingsRepositoryProvider);

      // Assert
      expect(controller, isA<SavingsRepository>());
    });
  });

  group('watchSavings', () {
    test('should return empty list when no data is found', () async {
      // Arrange
      final savings = <Savings>[];
      final repository = MockSavingsRepository();

      final container = createContainer(
        overrides: [
          savingsRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.watchSavings()).thenAnswer(
        (_) => Stream.value(savings),
      );

      // Act
      final listener = MockListener<AsyncValue<List<Savings>>>();
      container.listen(
        watchSavingsProvider,
        listener.call,
        fireImmediately: true,
      );

      await container.read(watchSavingsProvider.future);

      // Assert
      verifyInOrder([
        listener(null, const AsyncLoading()),
        listener(const AsyncLoading(), AsyncData(savings)),
      ]);
      verifyNoMoreInteractions(listener);
    });

    test('should return error when repository throws exception', () async {
      // Arrange
      final error = Exception();
      final repository = MockSavingsRepository();
      final container = createContainer(
        overrides: [
          savingsRepositoryProvider.overrideWithValue(repository),
        ],
      );
      when(repository.watchSavings()).thenThrow(error);

      // Act
      final controller = container.read(watchSavingsProvider.future);

      // Assert
      await expectLater(controller, throwsA(error));
    });
  });

  group('watchSaving', () {
    test(
      'should return Savings with the identical type passed in parameter',
      () async {
        // Arrange
        const savingType = SavingsType.pea;
        const saving = Savings(type: savingType);

        final repository = MockSavingsRepository();
        final container = createContainer(
          overrides: [
            savingsRepositoryProvider.overrideWithValue(repository),
          ],
        );

        when(repository.watchSaving(any)).thenAnswer(
          (_) => Stream.value(saving),
        );

        // Act
        final listener = MockListener<AsyncValue<Savings>>();
        container.listen(
          watchSavingProvider(type: savingType),
          listener.call,
          fireImmediately: true,
        );

        final result = await container.read(
          watchSavingProvider(type: savingType).future,
        );

        // Assert
        verifyInOrder([
          listener(null, const AsyncLoading()),
          listener(const AsyncLoading(), const AsyncData(saving)),
        ]);
        verifyNoMoreInteractions(listener);
        expect(result, saving);
      },
    );

    test('should return error when repository throws exception', () async {
      // Arrange
      const savingType = SavingsType.pea;
      final error = Exception();

      final repository = MockSavingsRepository();
      final container = createContainer(
        overrides: [
          savingsRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.watchSaving(savingType)).thenThrow(error);

      // Act
      final controller = container.read(
        watchSavingProvider(type: savingType).future,
      );

      // Assert
      await expectLater(controller, throwsA(error));
    });
  });
}
