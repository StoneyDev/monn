// ignore_for_file: lines_longer_than_80_chars .

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/reit/domain/reit_form.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/controllers/reit_form_controller.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/controllers/submit_reit_form_controller.dart';

import '../../../../../test.mocks.dart';
import '../../../../../utils.dart';

void main() {
  group('submitReitFormController', () {
    test(
      'should build submit data with information from formData',
      () async {
        // Arrange
        final formData = ReitForm(
          reitName: 'Random SCPI',
          price: '200',
          boughtOn: DateTime.now(),
          shares: '10',
        );

        final repository = MockReitRepository();
        final container = createContainer(
          overrides: [
            reitRepositoryProvider.overrideWithValue(repository),
          ],
        );

        // Act
        container.read(reitFormControllerProvider.notifier).state = formData;

        final submitController = container.read(
          submitReitFormControllerProvider.notifier,
        );
        final result = await submitController.submit();

        // Assert
        expect(result, true);
      },
    );

    test('should return false when repository throws error', () async {
      // Arrange
      final error = Exception();

      final repository = MockReitRepository();
      final container = createContainer(
        overrides: [
          reitRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.addReit(any)).thenThrow(error);

      // Act
      final submitController = container.read(
        submitReitFormControllerProvider.notifier,
      );
      final result = await submitController.submit();

      // Assert
      expect(result, false);
    });
  });
}
