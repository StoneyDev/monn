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
      expect(controller.state.receivedAt, isA<DateTime>());
      expect(controller.state.reit, isNull);
    });

    test('should update reit when set is called with Reit', () {
      // Arrange
      final reit = Reit();
      final container = createContainer();

      // Act
      final controller = container.read(
        reitDividendFormControllerProvider.notifier,
      )..set(reit: reit);

      // Assert
      expect(controller.state.reit, reit);
    });

    test('should update amount when set is called with new amount', () {
      // Arrange
      const amount = '50.7';
      const expectedAmount = '50.7';
      final container = createContainer();

      // Act
      final controller = container.read(
        reitDividendFormControllerProvider.notifier,
      )..set(amount: amount);

      // Assert
      expect(controller.state.amount, expectedAmount);
    });

    test('should update receivedAt when set is called', () {
      // Arrange
      final receivedAt = DateTime(2024, 04, 24);
      final container = createContainer();

      // Act
      final controller = container.read(
        reitDividendFormControllerProvider.notifier,
      )..set(receivedAt: receivedAt);

      // Assert
      expect(controller.state.receivedAt, receivedAt);
    });

    test(
      'should update multiple fields when set is called with multiple parameters',
      () {
        // Arrange
        final reit = Reit()..name = 'Random SCPI';
        const amount = '2.15455';
        const expectedAmount = '2.15455';
        final receivedAt = DateTime.now();
        final container = createContainer();

        // Act
        final controller = container.read(
          reitDividendFormControllerProvider.notifier,
        )..set(reit: reit, amount: amount, receivedAt: receivedAt);

        // Assert
        expect(controller.state.reit, reit);
        expect(controller.state.amount, expectedAmount);
        expect(controller.state.receivedAt, receivedAt);
      },
    );
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

      final reit = Reit()..name = 'Random SCPI';
      final controller = container.read(
        reitDividendFormControllerProvider.notifier,
      )..set(amount: '50.7', reit: reit);

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

      final reit = Reit()..name = 'Random SCPI';
      final controller = container.read(
        reitDividendFormControllerProvider.notifier,
      )..set(amount: '50.7', reit: reit);

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

      final reit = Reit()..name = 'Random SCPI';
      final receivedAt = DateTime(2024, 04, 24);
      final controller = container.read(
        reitDividendFormControllerProvider.notifier,
      )..set(amount: '2.15455', receivedAt: receivedAt, reit: reit);

      // Act
      await controller.submit();

      // Assert
      verify(
        mockRepository.editReit(
          reit: argThat(equals(reit), named: 'reit'),
          dividend: argThat(
            isA<ReitDividend>()
                .having((d) => d.amount, 'amount', 2.15455)
                .having((d) => d.receivedAt, 'receivedAt', receivedAt),
            named: 'dividend',
          ),
        ),
      ).called(1);
    });
  });
}
