// ignore_for_file: cascade_invocations, lines_longer_than_80_chars .

import 'package:flutter_test/flutter_test.dart';
import 'package:monn/features/reit/domain/reit.dart';
import 'package:monn/features/reit/domain/reit_dividend_form.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/controllers/reit_dividend_form_controller.dart';

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

    test('should update reit when edit is called with Reit', () {
      // Arrange
      final reit = Reit();
      final container = createContainer();

      // Act
      final controller = container.read(
        reitDividendFormControllerProvider.notifier,
      );
      controller.reit(reit: reit);

      // Assert
      expect(controller.state.reit, reit);
    });

    test('should update amount when edit is called with new amount', () {
      // Arrange
      const amount = '50.7';
      const expectedAmount = '50.7';
      final container = createContainer();

      // Act
      final controller = container.read(
        reitDividendFormControllerProvider.notifier,
      );
      controller.amount(amount: amount);

      // Assert
      expect(controller.state.amount, expectedAmount);
    });

    test('should update receivedAt when edit is called', () {
      // Arrange
      final receivedAt = DateTime(2024, 04, 24);
      final container = createContainer();

      // Act
      final controller = container.read(
        reitDividendFormControllerProvider.notifier,
      );
      controller.receivedAt(receivedAt: receivedAt);

      // Assert
      expect(controller.state.receivedAt, receivedAt);
    });

    test(
      'should update multiple fields when edit is called with multiple parameters',
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
        );
        controller
          ..reit(reit: reit)
          ..amount(amount: amount)
          ..receivedAt(receivedAt: receivedAt);

        // Assert
        expect(controller.state.reit, reit);
        expect(controller.state.amount, expectedAmount);
        expect(controller.state.receivedAt, receivedAt);
      },
    );
  });
}
