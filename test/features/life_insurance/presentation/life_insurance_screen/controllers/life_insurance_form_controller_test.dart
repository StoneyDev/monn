import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/life_insurance/data/life_insurance_repository.dart';
import 'package:monn/features/life_insurance/domain/life_insurance.dart';
import 'package:monn/features/life_insurance/presentation/life_insurance_screen/controllers/life_insurance_form_controller.dart';

import '../../../../../test.mocks.dart';
import '../../../../../utils.dart';

void main() {
  group('lifeInsuranceFormController', () {
    test('should initialize with empty form', () {
      // Arrange
      final container = createContainer();

      // Act
      final controller = container.read(
        lifeInsuranceFormControllerProvider.notifier,
      );

      // Assert
      expect(controller.state, isA<LifeInsuranceForm>());
      expect(controller.state.invested, '');
      expect(controller.state.interests, '');
    });

    test('should update invested when set() is called', () {
      // Arrange
      const invested = '10000';
      final container = createContainer();

      // Act
      final controller = container.read(
        lifeInsuranceFormControllerProvider.notifier,
      )..set(invested: invested);

      // Assert
      expect(controller.state.invested, invested);
    });

    test('should update interests when set() is called', () {
      // Arrange
      const interests = '500.50';
      final container = createContainer();

      // Act
      final controller = container.read(
        lifeInsuranceFormControllerProvider.notifier,
      )..set(interests: interests);

      // Assert
      expect(controller.state.interests, interests);
    });

    test('should update both fields when set() is called with both', () {
      // Arrange
      const invested = '25000';
      const interests = '1250.75';
      final container = createContainer();

      // Act
      final controller = container.read(
        lifeInsuranceFormControllerProvider.notifier,
      )..set(invested: invested, interests: interests);

      // Assert
      expect(controller.state.invested, invested);
      expect(controller.state.interests, interests);
    });

    test('should overwrite previous values when set() is called again', () {
      // Arrange
      final container = createContainer();

      // Act
      final controller =
          container.read(
              lifeInsuranceFormControllerProvider.notifier,
            )
            ..set(invested: '5000')
            ..set(invested: '10000');

      // Assert
      expect(controller.state.invested, '10000');
    });

    test('should preserve other field when only one is updated', () {
      // Arrange
      final container = createContainer();

      // Act
      final controller =
          container.read(
              lifeInsuranceFormControllerProvider.notifier,
            )
            ..set(invested: '10000', interests: '500')
            ..set(invested: '20000');

      // Assert
      expect(controller.state.invested, '20000');
      expect(controller.state.interests, '500');
    });
  });

  group('lifeInsuranceFormController submit', () {
    test('should return true when submit succeeds', () async {
      // Arrange
      final mockRepository = MockLifeInsuranceRepository();
      when(mockRepository.editLifeInsurance(any)).thenAnswer((_) async {});

      final container = createContainer(
        overrides: [
          lifeInsuranceRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      final controller = container.read(
        lifeInsuranceFormControllerProvider.notifier,
      )..set(invested: '10000', interests: '500');

      // Act
      final result = await controller.submit();

      // Assert
      expect(result, isTrue);
      verify(mockRepository.editLifeInsurance(any)).called(1);
    });

    test('should return false when submit fails', () async {
      // Arrange
      final mockRepository = MockLifeInsuranceRepository();
      when(mockRepository.editLifeInsurance(any)).thenThrow(Exception('Error'));

      final container = createContainer(
        overrides: [
          lifeInsuranceRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      final controller = container.read(
        lifeInsuranceFormControllerProvider.notifier,
      )..set(invested: '10000', interests: '500');

      // Act
      final result = await controller.submit();

      // Assert
      expect(result, isFalse);
    });

    test('should call repository with correct values', () async {
      // Arrange
      final mockRepository = MockLifeInsuranceRepository();
      when(mockRepository.editLifeInsurance(any)).thenAnswer((_) async {});

      final container = createContainer(
        overrides: [
          lifeInsuranceRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      final controller = container.read(
        lifeInsuranceFormControllerProvider.notifier,
      )..set(invested: '15000', interests: '750.50');

      // Act
      await controller.submit();

      // Assert
      verify(
        mockRepository.editLifeInsurance(
          argThat(
            isA<LifeInsurance>()
                .having((l) => l.invested, 'invested', 15000)
                .having((l) => l.interests, 'interests', 750.50),
          ),
        ),
      ).called(1);
    });
  });
}
