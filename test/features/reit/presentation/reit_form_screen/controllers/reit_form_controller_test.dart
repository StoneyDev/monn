// ignore_for_file: cascade_invocations, lines_longer_than_80_chars .

import 'package:flutter_test/flutter_test.dart';
import 'package:monn/features/reit/domain/reit_form.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/controllers/reit_form_controller.dart';

import '../../../../../utils.dart';

void main() {
  group('reitFormController', () {
    test('should initialize with empty form', () {
      // Arrange
      final container = createContainer();

      // Act
      final controller = container.read(
        reitFormControllerProvider.notifier,
      );

      // Assert
      expect(controller.state, isA<ReitForm>());
      expect(controller.state.reitName, isNull);
      expect(controller.state.shares, isNull);
      expect(controller.state.price, isNull);
      expect(controller.state.boughtOn, isNull);
    });

    test('should update reitName when edit is called with new name', () {
      // Arrange
      const reitName = 'Random SCPI';
      final container = createContainer();

      // Act
      final controller = container.read(
        reitFormControllerProvider.notifier,
      );
      controller.edit(reitName: reitName);

      // Assert
      expect(controller.state.reitName, reitName);
    });

    test('should update shares when edit is called with new shares', () {
      // Arrange
      const shares = '12';
      const expectedShares = 12;
      final container = createContainer();

      // Act
      final controller = container.read(
        reitFormControllerProvider.notifier,
      );
      controller.edit(shares: shares);

      // Assert
      expect(controller.state.shares, expectedShares);
    });

    test('should update price when edit is called with new price', () {
      // Arrange
      const price = '77.8';
      const expectedPrice = 77.8;
      final container = createContainer();

      // Act
      final controller = container.read(
        reitFormControllerProvider.notifier,
      );
      controller.edit(price: price);

      // Assert
      expect(controller.state.price, expectedPrice);
    });

    test('should update boughtOn when edit is called with new date', () {
      // Arrange
      final boughtOn = DateTime(2024, 04, 24);
      final container = createContainer();

      // Act
      final controller = container.read(
        reitFormControllerProvider.notifier,
      );
      controller.edit(boughtOn: boughtOn);

      // Assert
      expect(controller.state.boughtOn, boughtOn);
    });

    test(
      'should update multiple fields when edit is called with multiple parameters',
      () {
        // Arrange
        const reitName = 'Random SCPI';
        const shares = '23';
        const expectedShares = 23;
        const price = '345';
        const expectedPrice = 345;
        final boughtOn = DateTime.now();
        final container = createContainer();

        // Act
        final controller = container.read(
          reitFormControllerProvider.notifier,
        );
        controller.edit(
          reitName: reitName,
          shares: shares,
          price: price,
          boughtOn: boughtOn,
        );

        // Assert
        expect(controller.state.reitName, reitName);
        expect(controller.state.shares, expectedShares);
        expect(controller.state.price, expectedPrice);
        expect(controller.state.boughtOn, boughtOn);
      },
    );
  });
}
