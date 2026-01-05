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
      expect(controller.state.price, '');
      expect(controller.state.shares, '');
    });

    test('should update reitName when set() is called', () {
      // Arrange
      const reitName = 'My REIT';
      final container = createContainer();

      // Act
      final controller = container.read(reitFormControllerProvider.notifier)
        ..set(reitName: reitName);

      // Assert
      expect(controller.state.reitName, reitName);
    });

    test('should update price when set() is called', () {
      // Arrange
      const price = '150.50';
      final container = createContainer();

      // Act
      final controller = container.read(reitFormControllerProvider.notifier)
        ..set(price: price);

      // Assert
      expect(controller.state.price, price);
    });

    test('should update shares when set() is called', () {
      // Arrange
      const shares = '10';
      final container = createContainer();

      // Act
      final controller = container.read(reitFormControllerProvider.notifier)
        ..set(shares: shares);

      // Assert
      expect(controller.state.shares, shares);
    });

    test('should update boughtOn when set() is called', () {
      // Arrange
      final boughtOn = DateTime(2024, 6, 15);
      final container = createContainer();

      // Act
      final controller = container.read(reitFormControllerProvider.notifier)
        ..set(boughtOn: boughtOn);

      // Assert
      expect(controller.state.boughtOn, boughtOn);
    });

    test('should update all fields when set() is called with all', () {
      // Arrange
      const reitName = 'Test REIT';
      const price = '200';
      const shares = '5';
      final boughtOn = DateTime(2024);
      final container = createContainer();

      // Act
      final controller = container.read(reitFormControllerProvider.notifier)
        ..set(
          reitName: reitName,
          price: price,
          shares: shares,
          boughtOn: boughtOn,
        );

      // Assert
      expect(controller.state.reitName, reitName);
      expect(controller.state.price, price);
      expect(controller.state.shares, shares);
      expect(controller.state.boughtOn, boughtOn);
    });

    test('should preserve other fields when only one is updated', () {
      // Arrange
      final container = createContainer();

      // Act
      final controller = container.read(reitFormControllerProvider.notifier)
        ..set(reitName: 'Initial', price: '100')
        ..set(reitName: 'Updated');

      // Assert
      expect(controller.state.reitName, 'Updated');
      expect(controller.state.price, '100');
    });
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
        ..set(reitName: 'Test REIT', price: '150', shares: '10');

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
        ..set(reitName: 'Test REIT', price: '150', shares: '10');

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

      final boughtOn = DateTime(2024, 3, 15);
      final controller = container.read(reitFormControllerProvider.notifier)
        ..set(
          reitName: 'My REIT',
          price: '250.50',
          shares: '15',
          boughtOn: boughtOn,
        );

      // Act
      await controller.submit();

      // Assert
      verify(
        mockRepository.addReit(
          argThat(
            isA<Reit>()
                .having((r) => r.name, 'name', 'My REIT')
                .having((r) => r.price, 'price', 250.50)
                .having((r) => r.shares, 'shares', 15)
                .having((r) => r.boughtOn, 'boughtOn', boughtOn),
          ),
        ),
      ).called(1);
    });
  });
}
