// ignore_for_file: cascade_invocations, lines_longer_than_80_chars

import 'package:flutter_test/flutter_test.dart';
import 'package:monn/features/cryptocurrency/domain/crypto_form.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/cryptocurrency/presentation/crypto_form_screen/controllers/crypto_form_controller.dart';

import '../../../../../utils.dart';

void main() {
  group('cryptoFormController', () {
    test('should initialize with empty form', () {
      // Arrange
      final container = createContainer();

      // Act
      final controller = container.read(
        cryptoFormControllerProvider.notifier,
      );

      // Assert
      expect(controller.state, isA<CryptoForm>());
      expect(controller.state.crypto, isNull);
      expect(controller.state.fiat, isNull);
      expect(controller.state.amount, isNull);
      expect(controller.state.boughtOn, isNull);
    });

    test('should update crypto when edit is called with Cryptocurrency', () {
      // Arrange
      final crypto = Cryptocurrency();
      final container = createContainer();

      // Act
      final controller = container.read(
        cryptoFormControllerProvider.notifier,
      );
      controller.edit(crypto: crypto);

      // Assert
      expect(controller.state.crypto, crypto);
    });

    test('should update fiat when edit is called with new amount', () {
      // Arrange
      const fiat = '50';
      const expectedFiat = 50;
      final container = createContainer();

      // Act
      final controller = container.read(
        cryptoFormControllerProvider.notifier,
      );
      controller.edit(fiat: fiat);

      // Assert
      expect(controller.state.fiat, expectedFiat);
    });

    test('should update amount when edit is called', () {
      // Arrange
      const amount = '77.8';
      const expectedAmount = 77.8;
      final container = createContainer();

      // Act
      final controller = container.read(
        cryptoFormControllerProvider.notifier,
      );
      controller.edit(amount: amount);

      // Assert
      expect(controller.state.amount, expectedAmount);
    });

    test('should update boughtOn when edit is called', () {
      // Arrange
      final boughtOn = DateTime(2024, 04, 24);
      final container = createContainer();

      // Act
      final controller = container.read(
        cryptoFormControllerProvider.notifier,
      );
      controller.edit(boughtOn: boughtOn);

      // Assert
      expect(controller.state.boughtOn, boughtOn);
    });

    test(
      'should update multiple fields when edit is called with multiple parameters',
      () {
        // Arrange
        final crypto = Cryptocurrency()..type = CryptoType.bitcoin;
        const fiat = '2000';
        const expectedFiat = 2000;
        const amount = '2.15455';
        const expectedAmount = 2.15455;
        final boughtOn = DateTime.now();
        final container = createContainer();

        // Act
        final controller = container.read(
          cryptoFormControllerProvider.notifier,
        );
        controller.edit(
          crypto: crypto,
          fiat: fiat,
          amount: amount,
          boughtOn: boughtOn,
        );

        // Assert
        expect(controller.state.crypto, crypto);
        expect(controller.state.fiat, expectedFiat);
        expect(controller.state.amount, expectedAmount);
        expect(controller.state.boughtOn, boughtOn);
      },
    );
  });
}
