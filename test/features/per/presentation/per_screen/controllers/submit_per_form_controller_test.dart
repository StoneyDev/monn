import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/per/data/per_repository.dart';
import 'package:monn/features/per/domain/per.dart';
import 'package:monn/features/per/domain/per_form.dart';
import 'package:monn/features/per/presentation/per_screen/controllers/per_form_controller.dart';
import 'package:monn/features/per/presentation/per_screen/controllers/submit_per_form_controller.dart';

import '../../../../../test.mocks.dart';
import '../../../../../utils.dart';

void main() {
  group('submitPerFormController', () {
    test(
      'should return true when submit is successful',
      () async {
        // Arrange
        const formData = PerForm(
          invested: '10000',
          interests: '500',
        );

        final repository = MockPerRepository();
        final container = createContainer(
          overrides: [
            perRepositoryProvider.overrideWithValue(repository),
          ],
        );

        when(repository.editPer(any)).thenAnswer(
          (_) => Future<void>.value(),
        );

        // Act
        container.read(perFormControllerProvider.notifier).state = formData;

        final submitController = container.read(
          submitPerFormControllerProvider.notifier,
        );
        final result = await submitController.submit();

        // Assert
        expect(result, true);
        verify(
          repository.editPer(
            argThat(
              predicate<Per>(
                (per) => per.invested == 10000 && per.interests == 500,
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
        const formData = PerForm(
          invested: '0',
          interests: '0',
        );

        final repository = MockPerRepository();
        final container = createContainer(
          overrides: [
            perRepositoryProvider.overrideWithValue(repository),
          ],
        );

        when(repository.editPer(any)).thenAnswer(
          (_) => Future<void>.value(),
        );

        // Act
        container.read(perFormControllerProvider.notifier).state = formData;

        final submitController = container.read(
          submitPerFormControllerProvider.notifier,
        );
        final result = await submitController.submit();

        // Assert
        expect(result, true);
        verify(
          repository.editPer(
            argThat(
              predicate<Per>(
                (per) => per.invested == 0 && per.interests == 0,
              ),
            ),
          ),
        );
      },
    );

    test('should return false when editPer throws error', () async {
      // Arrange
      final error = Exception('Save error');
      const formData = PerForm(
        invested: '10000',
        interests: '500',
      );

      final repository = MockPerRepository();
      final container = createContainer(
        overrides: [
          perRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.editPer(any)).thenThrow(error);

      // Act
      container.read(perFormControllerProvider.notifier).state = formData;

      final submitController = container.read(
        submitPerFormControllerProvider.notifier,
      );
      final result = await submitController.submit();

      // Assert
      expect(result, false);
    });

    test(
      'should handle decimal values with high precision',
      () async {
        // Arrange
        const formData = PerForm(
          invested: '12345.67',
          interests: '987.65',
        );

        final repository = MockPerRepository();
        final container = createContainer(
          overrides: [
            perRepositoryProvider.overrideWithValue(repository),
          ],
        );

        when(repository.editPer(any)).thenAnswer(
          (_) => Future<void>.value(),
        );

        // Act
        container.read(perFormControllerProvider.notifier).state = formData;

        final submitController = container.read(
          submitPerFormControllerProvider.notifier,
        );
        final result = await submitController.submit();

        // Assert
        expect(result, true);
        verify(
          repository.editPer(
            argThat(
              predicate<Per>(
                (per) => per.invested == 12345.67 && per.interests == 987.65,
              ),
            ),
          ),
        );
      },
    );
  });
}
