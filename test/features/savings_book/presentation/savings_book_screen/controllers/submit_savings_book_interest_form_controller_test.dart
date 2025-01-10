// ignore_for_file: lines_longer_than_80_chars .

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/savings_book/data/savings_book_repository.dart';
import 'package:monn/features/savings_book/domain/savings_book.dart';
import 'package:monn/features/savings_book/presentation/savings_book_screen/controllers/submit_savings_book_interest_form_controller.dart';

import '../../../../../test.mocks.dart';
import '../../../../../utils.dart';

void main() {
  group('submitSavingsBookInterestFormController', () {
    test(
      'should submit data and adds up the total number of interests when positive',
      () async {
        // Arrange
        final savingsBook = SavingsBook()
          ..name = 'Livret 1'
          ..interests = 100
          ..startAmount = 200;

        final repository = MockSavingsBookRepository();
        final container = createContainer(
          overrides: [
            savingsBookRepositoryProvider.overrideWithValue(repository),
          ],
        );

        // Act
        final controller = container.read(
          submitSavingsBookInterestFormControllerProvider.notifier,
        );
        final result = await controller.submit(
          savingsBook: savingsBook,
          amount: 200,
        );

        // Assert
        expect(result, true);
        verify(
          repository.editSavingsBook(
            argThat(
              predicate<SavingsBook>((predic) => predic.interests == 300),
            ),
          ),
        );
      },
    );

    test(
      'should submit data and adds up the total number of withdrawal when negative',
      () async {
        // Arrange
        final savingsBook = SavingsBook()
          ..name = 'Livret 1'
          ..interests = 100
          ..startAmount = 200;

        final repository = MockSavingsBookRepository();
        final container = createContainer(
          overrides: [
            savingsBookRepositoryProvider.overrideWithValue(repository),
          ],
        );

        // Act
        final controller = container.read(
          submitSavingsBookInterestFormControllerProvider.notifier,
        );
        final result = await controller.submit(
          savingsBook: savingsBook,
          amount: -60,
        );

        // Assert
        expect(result, true);
        verify(
          repository.editSavingsBook(
            argThat(
              predicate<SavingsBook>((predic) => predic.withdrawal == 60),
            ),
          ),
        );
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
        submitSavingsBookInterestFormControllerProvider.notifier,
      );
      final result = await submitController.submit(
        savingsBook: SavingsBook(),
        amount: 0,
      );

      // Assert
      expect(result, false);
    });
  });
}
