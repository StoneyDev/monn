import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/savings_book/data/savings_book_repository.dart';
import 'package:monn/features/savings_book/domain/savings_book_form.dart';
import 'package:monn/features/savings_book/presentation/savings_book_form_screen/controllers/savings_book_form_controller.dart';
import 'package:monn/features/savings_book/presentation/savings_book_form_screen/controllers/submit_savings_book_form_controller.dart';

import '../../../../../test.mocks.dart';
import '../../../../../utils.dart';

void main() {
  group('submitSavingsBookFormController', () {
    test(
      'should build data with information from formData',
      () async {
        // Arrange
        const formData = SavingsBookForm(
          name: 'Livret 1',
          startAmount: 100,
        );

        final repository = MockSavingsBookRepository();
        final container = createContainer(
          overrides: [
            savingsBookRepositoryProvider.overrideWithValue(repository),
          ],
        );

        // Act
        container.read(savingsBookFormControllerProvider.notifier).state =
            formData;

        final submitController = container.read(
          submitSavingsBookFormControllerProvider.notifier,
        );
        final result = await submitController.submit();

        // Assert
        expect(result, true);
      },
    );

    test('should return false when repository throws error', () async {
      // Arrange
      final error = Exception();

      final repository = MockSavingsBookRepository();
      final container = createContainer(
        overrides: [
          savingsBookRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.editSavingsBook(any)).thenThrow(error);

      // Act
      final submitController = container.read(
        submitSavingsBookFormControllerProvider.notifier,
      );
      final result = await submitController.submit();

      // Assert
      expect(result, false);
    });
  });
}
