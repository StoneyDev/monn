// ignore_for_file: cascade_invocations, lines_longer_than_80_chars .

import 'package:flutter_test/flutter_test.dart';
import 'package:monn/features/cryptocurrency/domain/crypto_form.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/cryptocurrency/presentation/add_crypto_screen/controllers/crypto_form_controller.dart';

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
      expect(controller.state.amount, isNull);
      expect(controller.state.date, isNull);
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

    test('should update date when edit is called', () {
      // Arrange
      final date = DateTime(2024, 04, 24);
      final container = createContainer();

      // Act
      final controller = container.read(
        cryptoFormControllerProvider.notifier,
      );
      controller.edit(date: date);

      // Assert
      expect(controller.state.date, date);
    });

    test(
      'should update multiple fields when edit is called with multiple parameters',
      () {
        // Arrange
        final crypto = Cryptocurrency()..type = CryptoType.bitcoin;
        const amount = '2.15455';
        const expectedAmount = 2.15455;
        final now = DateTime.now();
        final container = createContainer();

        // Act
        final controller = container.read(
          cryptoFormControllerProvider.notifier,
        );
        controller.edit(
          crypto: crypto,
          amount: amount,
          date: now,
        );

        // Assert
        expect(controller.state.crypto, crypto);
        expect(controller.state.amount, expectedAmount);
        expect(controller.state.date, now);
      },
    );
  });
}
