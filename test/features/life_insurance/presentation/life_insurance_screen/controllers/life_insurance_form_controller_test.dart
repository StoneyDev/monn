import 'package:flutter_test/flutter_test.dart';
import 'package:monn/features/life_insurance/domain/life_insurance_form.dart';
import 'package:monn/features/life_insurance/presentation/life_insurance_screen/controllers/life_insurance_form_controller.dart';

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

    test('should update invested when invested() is called', () {
      // Arrange
      const invested = '10000';
      final container = createContainer();

      // Act
      final controller = container.read(
        lifeInsuranceFormControllerProvider.notifier,
      )..invested(invested: invested);

      // Assert
      expect(controller.state.invested, invested);
    });

    test('should update interests when interests() is called', () {
      // Arrange
      const interests = '500.50';
      final container = createContainer();

      // Act
      final controller = container.read(
        lifeInsuranceFormControllerProvider.notifier,
      )..interests(interests: interests);

      // Assert
      expect(controller.state.interests, interests);
    });

    test('should update both fields when multiple methods are called', () {
      // Arrange
      const invested = '25000';
      const interests = '1250.75';
      final container = createContainer();

      // Act
      final controller =
          container.read(
              lifeInsuranceFormControllerProvider.notifier,
            )
            ..invested(invested: invested)
            ..interests(interests: interests);

      // Assert
      expect(controller.state.invested, invested);
      expect(controller.state.interests, interests);
    });

    test(
      'should overwrite previous values when invested() is called again',
      () {
        // Arrange
        final container = createContainer();

        // Act
        final controller =
            container.read(
                lifeInsuranceFormControllerProvider.notifier,
              )
              ..invested(invested: '5000')
              ..invested(invested: '10000');

        // Assert
        expect(controller.state.invested, '10000');
      },
    );

    test(
      'should overwrite previous values when interests() is called again',
      () {
        // Arrange
        final container = createContainer();

        // Act
        final controller =
            container.read(
                lifeInsuranceFormControllerProvider.notifier,
              )
              ..interests(interests: '250')
              ..interests(interests: '500');

        // Assert
        expect(controller.state.interests, '500');
      },
    );

    test('should preserve other field when only one is updated', () {
      // Arrange
      final container = createContainer();

      // Act
      final controller =
          container.read(
              lifeInsuranceFormControllerProvider.notifier,
            )
            ..invested(invested: '10000')
            ..interests(interests: '500')
            ..invested(invested: '20000');

      // Assert
      expect(controller.state.invested, '20000');
      expect(controller.state.interests, '500');
    });
  });
}
