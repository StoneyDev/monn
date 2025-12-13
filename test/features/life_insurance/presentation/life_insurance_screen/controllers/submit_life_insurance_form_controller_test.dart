import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/life_insurance/data/life_insurance_repository.dart';
import 'package:monn/features/life_insurance/domain/life_insurance.dart';
import 'package:monn/features/life_insurance/domain/life_insurance_form.dart';
import 'package:monn/features/life_insurance/presentation/life_insurance_screen/controllers/life_insurance_form_controller.dart';
import 'package:monn/features/life_insurance/presentation/life_insurance_screen/controllers/submit_life_insurance_form_controller.dart';

import '../../../../../test.mocks.dart';
import '../../../../../utils.dart';

void main() {
  group('submitLifeInsuranceFormController', () {
    test(
      'should return true when submit is successful',
      () async {
        // Arrange
        const formData = LifeInsuranceForm(
          invested: '10000',
          interests: '500',
        );

        final repository = MockLifeInsuranceRepository();
        final container = createContainer(
          overrides: [
            lifeInsuranceRepositoryProvider.overrideWithValue(repository),
          ],
        );

        when(repository.editLifeInsurance(any)).thenAnswer(
          (_) => Future<void>.value(),
        );

        // Act
        container.read(lifeInsuranceFormControllerProvider.notifier).state =
            formData;

        final submitController = container.read(
          submitLifeInsuranceFormControllerProvider.notifier,
        );
        final result = await submitController.submit();

        // Assert
        expect(result, true);
        verify(
          repository.editLifeInsurance(
            argThat(
              predicate<LifeInsurance>(
                (lifeInsurance) =>
                    lifeInsurance.invested == 10000 &&
                    lifeInsurance.interests == 500,
              ),
            ),
          ),
        );
      },
    );

    test(
      'should handle zero values correctly',
      () async {
        // Arrange
        const formData = LifeInsuranceForm(
          invested: '0',
          interests: '0',
        );

        final repository = MockLifeInsuranceRepository();
        final container = createContainer(
          overrides: [
            lifeInsuranceRepositoryProvider.overrideWithValue(repository),
          ],
        );

        when(repository.editLifeInsurance(any)).thenAnswer(
          (_) => Future<void>.value(),
        );

        // Act
        container.read(lifeInsuranceFormControllerProvider.notifier).state =
            formData;

        final submitController = container.read(
          submitLifeInsuranceFormControllerProvider.notifier,
        );
        final result = await submitController.submit();

        // Assert
        expect(result, true);
        verify(
          repository.editLifeInsurance(
            argThat(
              predicate<LifeInsurance>(
                (lifeInsurance) =>
                    lifeInsurance.invested == 0 && lifeInsurance.interests == 0,
              ),
            ),
          ),
        );
      },
    );

    test('should return false when editLifeInsurance throws error', () async {
      // Arrange
      final error = Exception('Save error');
      const formData = LifeInsuranceForm(
        invested: '10000',
        interests: '500',
      );

      final repository = MockLifeInsuranceRepository();
      final container = createContainer(
        overrides: [
          lifeInsuranceRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.editLifeInsurance(any)).thenThrow(error);

      // Act
      container.read(lifeInsuranceFormControllerProvider.notifier).state =
          formData;

      final submitController = container.read(
        submitLifeInsuranceFormControllerProvider.notifier,
      );
      final result = await submitController.submit();

      // Assert
      expect(result, false);
    });

    test(
      'should handle decimal values with high precision',
      () async {
        // Arrange
        const formData = LifeInsuranceForm(
          invested: '12345.67',
          interests: '987.65',
        );

        final repository = MockLifeInsuranceRepository();
        final container = createContainer(
          overrides: [
            lifeInsuranceRepositoryProvider.overrideWithValue(repository),
          ],
        );

        when(repository.editLifeInsurance(any)).thenAnswer(
          (_) => Future<void>.value(),
        );

        // Act
        container.read(lifeInsuranceFormControllerProvider.notifier).state =
            formData;

        final submitController = container.read(
          submitLifeInsuranceFormControllerProvider.notifier,
        );
        final result = await submitController.submit();

        // Assert
        expect(result, true);
        verify(
          repository.editLifeInsurance(
            argThat(
              predicate<LifeInsurance>(
                (lifeInsurance) =>
                    lifeInsurance.invested == 12345.67 &&
                    lifeInsurance.interests == 987.65,
              ),
            ),
          ),
        );
      },
    );
  });
}
