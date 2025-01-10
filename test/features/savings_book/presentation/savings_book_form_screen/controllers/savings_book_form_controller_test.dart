// ignore_for_file: cascade_invocations, lines_longer_than_80_chars .

import 'package:flutter_test/flutter_test.dart';
import 'package:monn/features/savings_book/domain/savings_book_form.dart';
import 'package:monn/features/savings_book/presentation/savings_book_form_screen/controllers/savings_book_form_controller.dart';

import '../../../../../utils.dart';

void main() {
  group('savingsBookFormController', () {
    test('should initialize with empty form', () {
      // Arrange
      final container = createContainer();

      // Act
      final controller = container.read(
        savingsBookFormControllerProvider.notifier,
      );

      // Assert
      expect(controller.state, isA<SavingsBookForm>());
      expect(controller.state.name, isNull);
      expect(controller.state.startAmount, isNull);
    });

    test('should update name when edit is called with new name', () {
      // Arrange
      const name = 'Livret 1';
      final container = createContainer();

      // Act
      final controller = container.read(
        savingsBookFormControllerProvider.notifier,
      );
      controller.edit(name: name);

      // Assert
      expect(controller.state.name, name);
    });

    test('should update name when edit is called with new name', () {
      // Arrange
      const amount = '9200.50';
      const expectedAmount = 9200.50;
      final container = createContainer();

      // Act
      final controller = container.read(
        savingsBookFormControllerProvider.notifier,
      );
      controller.edit(startAmount: amount);

      // Assert
      expect(controller.state.startAmount, expectedAmount);
    });

    test(
      'should not update startAmount when edit is called with invalid type',
      () {
        // Arrange
        final container = createContainer();

        // Act
        final controller = container.read(
          savingsBookFormControllerProvider.notifier,
        );
        controller.edit(startAmount: 'number0');

        // Assert
        expect(controller.state.startAmount, isNull);
      },
    );

    test(
      'should update multiple fields when edit is called with multiple parameters',
      () {
        // Arrange
        const name = 'Livret 1';
        const amount = '102.3';
        const expectedAmount = 102.3;
        final container = createContainer();

        // Act
        final controller = container.read(
          savingsBookFormControllerProvider.notifier,
        );
        controller.edit(startAmount: amount, name: name);

        // Assert
        expect(controller.state.name, name);
        expect(controller.state.startAmount, expectedAmount);
      },
    );
  });
}
