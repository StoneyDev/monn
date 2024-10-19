// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/reit/domain/reit.dart';
import 'package:monn/features/reit/domain/reit_dividend_form.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/controllers/reit_dividend_form_controller.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/controllers/submit_reit_dividend_form_controller.dart';

import '../../../../../test.mocks.dart';
import '../../../../../utils.dart';

void main() {
  group('submitReitDividendFormController', () {
    test(
      'should build submit data with information from formData',
      () async {
        // Arrange
        final formData = ReitDividendForm(
          reit: Reit(),
          amount: 200,
          receivedAt: DateTime.now(),
        );

        final repository = MockReitRepository();
        final container = createContainer(
          overrides: [
            reitRepositoryProvider.overrideWithValue(repository),
          ],
        );

        // Act
        container.read(reitDividendFormControllerProvider.notifier).state =
            formData;

        final submitController = container.read(
          submitReitDividendFormControllerProvider.notifier,
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

      when(
        repository.editReit(
          reit: anyNamed('reit'),
          dividend: anyNamed('dividend'),
        ),
      ).thenThrow(error);

      // Act
      final submitController = container.read(
        submitReitDividendFormControllerProvider.notifier,
      );
      final result = await submitController.submit();

      // Assert
      expect(result, false);
    });
  });
}
