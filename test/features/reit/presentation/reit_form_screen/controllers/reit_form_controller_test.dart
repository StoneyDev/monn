import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/reit/domain/reit.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/controllers/reit_form_controller.dart';

import '../../../../../test.mocks.dart';
import '../../../../../utils.dart';

void main() {
  group('reitFormController', () {
    test('should initialize with empty form', () {
      // Arrange
      final container = createContainer();

      // Act
      final controller = container.read(reitFormControllerProvider.notifier);

      // Assert
      expect(controller.state, isA<ReitForm>());
      expect(controller.state.reitName, '');
      expect(controller.state.shares, '');
      expect(controller.state.price, '');
      expect(controller.state.boughtOn, isA<DateTime>());
    });

    test('should update reitName when set is called with new name', () {
      // Arrange
      const reitName = 'Random SCPI';
      final container = createContainer();

      // Act
      final controller = container.read(reitFormControllerProvider.notifier)
        ..set(reitName: reitName);

      // Assert
      expect(controller.state.reitName, reitName);
    });

    test('should update shares when set is called with new shares', () {
      // Arrange
      const shares = '12';
      const expectedShares = '12';
      final container = createContainer();

      // Act
      final controller = container.read(reitFormControllerProvider.notifier)
        ..set(shares: shares);

      // Assert
      expect(controller.state.shares, expectedShares);
    });

    test('should update price when set is called with new price', () {
      // Arrange
      const price = '77.8';
      const expectedPrice = '77.8';
      final container = createContainer();

      // Act
      final controller = container.read(reitFormControllerProvider.notifier)
        ..set(price: price);

      // Assert
      expect(controller.state.price, expectedPrice);
    });

    test('should update boughtOn when set is called with new date', () {
      // Arrange
      final boughtOn = DateTime(2024, 04, 24);
      final container = createContainer();

      // Act
      final controller = container.read(reitFormControllerProvider.notifier)
        ..set(boughtOn: boughtOn);

      // Assert
      expect(controller.state.boughtOn, boughtOn);
    });

    test(
      // ignore: lines_longer_than_80_chars
      'should update multiple fields when set is called with multiple parameters',
      () {
        // Arrange
        const reitName = 'Random SCPI';
        const shares = '23';
        const expectedShares = '23';
        const price = '345';
        const expectedPrice = '345';
        final boughtOn = DateTime.now();
        final container = createContainer();

        // Act
        final controller = container.read(reitFormControllerProvider.notifier)
          ..set(
            boughtOn: boughtOn,
            reitName: reitName,
            shares: shares,
            price: price,
          );

        // Assert
        expect(controller.state.reitName, reitName);
        expect(controller.state.shares, expectedShares);
        expect(controller.state.price, expectedPrice);
        expect(controller.state.boughtOn, boughtOn);
      },
    );
  });

  group('reitFormController submit', () {
    test('should return true when submit succeeds', () async {
      // Arrange
      final mockRepository = MockReitRepository();
      when(mockRepository.addReit(any)).thenAnswer((_) async {});

      final container = createContainer(
        overrides: [reitRepositoryProvider.overrideWithValue(mockRepository)],
      );

      final controller = container.read(reitFormControllerProvider.notifier)
        ..set(reitName: 'Random SCPI', price: '77.8', shares: '12');

      // Act
      final result = await controller.submit();

      // Assert
      expect(result, isTrue);
      verify(mockRepository.addReit(any)).called(1);
    });

    test('should return false when submit fails', () async {
      // Arrange
      final mockRepository = MockReitRepository();
      when(mockRepository.addReit(any)).thenThrow(Exception('Error'));

      final container = createContainer(
        overrides: [reitRepositoryProvider.overrideWithValue(mockRepository)],
      );

      final controller = container.read(reitFormControllerProvider.notifier)
        ..set(reitName: 'Random SCPI', price: '77.8', shares: '12');

      // Act
      final result = await controller.submit();

      // Assert
      expect(result, isFalse);
    });

    test('should call repository with correct values', () async {
      // Arrange
      final mockRepository = MockReitRepository();
      when(mockRepository.addReit(any)).thenAnswer((_) async {});

      final container = createContainer(
        overrides: [reitRepositoryProvider.overrideWithValue(mockRepository)],
      );

      final boughtOn = DateTime(2024, 04, 24);
      final controller = container.read(reitFormControllerProvider.notifier)
        ..set(
          reitName: 'Random SCPI',
          price: '345',
          shares: '23',
          boughtOn: boughtOn,
        );

      // Act
      await controller.submit();

      // Assert
      verify(
        mockRepository.addReit(
          argThat(
            isA<Reit>()
                .having((r) => r.name, 'name', 'Random SCPI')
                .having((r) => r.price, 'price', 345)
                .having((r) => r.shares, 'shares', 23)
                .having((r) => r.boughtOn, 'boughtOn', boughtOn),
          ),
        ),
      ).called(1);
    });
  });
}
