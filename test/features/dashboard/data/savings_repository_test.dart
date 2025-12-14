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
        watchSavingsProvider(),
        listener.call,
        fireImmediately: true,
      );

      await container.read(watchSavingsProvider().future);

      // Assert
      verifyInOrder([
        listener(null, const AsyncLoading()),
        listener(const AsyncLoading(), AsyncData(savings)),
      ]);
      verifyNoMoreInteractions(listener);
    });
  });

  group('getSaving', () {
    test(
      'should return Savings with the identical type passed in parameter',
      () async {
        // Arrange
        const savingType = SavingsType.pea;
        final saving = Savings()..type = savingType;

        final repository = MockSavingsRepository();
        final container = createContainer(
          overrides: [
            savingsRepositoryProvider.overrideWithValue(repository),
          ],
        );

        when(repository.getSavings(any)).thenAnswer(
          (_) => Future.value(saving),
        );

        // Act
        final listener = MockListener<AsyncValue<Savings?>>();
        container.listen(
          getSavingsProvider(type: savingType),
          listener.call,
          fireImmediately: true,
        );

        final result = await container.read(
          getSavingsProvider(type: savingType).future,
        );

        // Assert
        verifyInOrder([
          listener(null, const AsyncLoading()),
          listener(const AsyncLoading(), AsyncData(saving)),
        ]);
        verifyNoMoreInteractions(listener);
        expect(result, saving);
      },
    );
  });
}
