import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/reit/domain/reit.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/controllers/reit_dividend_form_controller.dart';

import '../../../../../test.mocks.dart';
import '../../../../../utils.dart';

void main() {
  group('reitDividendFormController', () {
    test('should initialize with empty form', () {
      // Arrange
      final container = createContainer();

      // Act
      final controller = container.read(
        reitDividendFormControllerProvider.notifier,
      );

      // Assert
      expect(controller.state, isA<ReitDividendForm>());
      expect(controller.state.amount, '');
      expect(controller.state.reit, isNull);
    });

    test('should update amount when set() is called', () {
      // Arrange
      const amount = '500.50';
      final container = createContainer();

      // Act
      final controller = container.read(
        reitDividendFormControllerProvider.notifier,
      )..set(amount: amount);

      // Assert
      expect(controller.state.amount, amount);
    });

    test('should update receivedAt when set() is called', () {
      // Arrange
      final receivedAt = DateTime(2024, 6, 15);
      final container = createContainer();

      // Act
      final controller = container.read(
        reitDividendFormControllerProvider.notifier,
      )..set(receivedAt: receivedAt);

      // Assert
      expect(controller.state.receivedAt, receivedAt);
    });

    test('should update reit when set() is called', () {
      // Arrange
      final reit = Reit()
        ..name = 'Test REIT'
        ..price = 100
        ..shares = 10
        ..boughtOn = DateTime.now();
      final container = createContainer();

      // Act
      final controller = container.read(
        reitDividendFormControllerProvider.notifier,
      )..set(reit: reit);

      // Assert
      expect(controller.state.reit, reit);
    });

    test('should update all fields when set() is called with all', () {
      // Arrange
      const amount = '750';
      final receivedAt = DateTime(2024, 3, 1);
      final reit = Reit()
        ..name = 'My REIT'
        ..price = 200
        ..shares = 5
        ..boughtOn = DateTime(2024, 1, 1);
      final container = createContainer();

      // Act
      final controller = container.read(
        reitDividendFormControllerProvider.notifier,
      )..set(amount: amount, receivedAt: receivedAt, reit: reit);

      // Assert
      expect(controller.state.amount, amount);
      expect(controller.state.receivedAt, receivedAt);
      expect(controller.state.reit, reit);
    });

    test('should preserve other fields when only one is updated', () {
      // Arrange
      final reit = Reit()
        ..name = 'Test'
        ..price = 100
        ..shares = 10
        ..boughtOn = DateTime.now();
      final container = createContainer();

      // Act
      final controller =
          container.read(
              reitDividendFormControllerProvider.notifier,
            )
            ..set(amount: '100', reit: reit)
            ..set(amount: '200');

      // Assert
      expect(controller.state.amount, '200');
      expect(controller.state.reit, reit);
    });
  });

  group('reitDividendFormController submit', () {
    test('should return true when submit succeeds', () async {
      // Arrange
      final mockRepository = MockReitRepository();
      when(
        mockRepository.editReit(
          reit: anyNamed('reit'),
          dividend: anyNamed('dividend'),
        ),
      ).thenAnswer((_) async {});

      final container = createContainer(
        overrides: [reitRepositoryProvider.overrideWithValue(mockRepository)],
      );

      final reit = Reit()
        ..name = 'Test REIT'
        ..price = 100
        ..shares = 10
        ..boughtOn = DateTime.now();

      final controller = container.read(
        reitDividendFormControllerProvider.notifier,
      )..set(amount: '500', reit: reit);

      // Act
      final result = await controller.submit();

      // Assert
      expect(result, isTrue);
      verify(
        mockRepository.editReit(
          reit: anyNamed('reit'),
          dividend: anyNamed('dividend'),
        ),
      ).called(1);
    });

    test('should return false when submit fails', () async {
      // Arrange
      final mockRepository = MockReitRepository();
      when(
        mockRepository.editReit(
          reit: anyNamed('reit'),
          dividend: anyNamed('dividend'),
        ),
      ).thenThrow(Exception('Error'));

      final container = createContainer(
        overrides: [reitRepositoryProvider.overrideWithValue(mockRepository)],
      );

      final reit = Reit()
        ..name = 'Test REIT'
        ..price = 100
        ..shares = 10
        ..boughtOn = DateTime.now();

      final controller = container.read(
        reitDividendFormControllerProvider.notifier,
      )..set(amount: '500', reit: reit);

      // Act
      final result = await controller.submit();

      // Assert
      expect(result, isFalse);
    });

    test('should call repository with correct values', () async {
      // Arrange
      final mockRepository = MockReitRepository();
      when(
        mockRepository.editReit(
          reit: anyNamed('reit'),
          dividend: anyNamed('dividend'),
        ),
      ).thenAnswer((_) async {});

      final container = createContainer(
        overrides: [reitRepositoryProvider.overrideWithValue(mockRepository)],
      );

      final reit = Reit()
        ..name = 'My REIT'
        ..price = 150
        ..shares = 8
        ..boughtOn = DateTime(2024, 1, 1);

      final receivedAt = DateTime(2024, 6, 15);
      final controller = container.read(
        reitDividendFormControllerProvider.notifier,
      )..set(amount: '750.25', receivedAt: receivedAt, reit: reit);

      // Act
      await controller.submit();

      // Assert
      verify(
        mockRepository.editReit(
          reit: argThat(equals(reit), named: 'reit'),
          dividend: argThat(
            isA<ReitDividend>()
                .having((d) => d.amount, 'amount', 750.25)
                .having((d) => d.receivedAt, 'receivedAt', receivedAt),
            named: 'dividend',
          ),
        ),
      ).called(1);
    });
  });
}
