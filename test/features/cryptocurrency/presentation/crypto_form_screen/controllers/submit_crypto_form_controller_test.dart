// ignore_for_file: lines_longer_than_80_chars .

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/domain/crypto_form.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/cryptocurrency/presentation/add_crypto_screen/controllers/crypto_form_controller.dart';
import 'package:monn/features/cryptocurrency/presentation/add_crypto_screen/controllers/submit_crypto_form_controller.dart';

import '../../../../../test.mocks.dart';
import '../../../../../utils.dart';

void main() {
  group('submitCryptoFormController', () {
    test(
      'should build Cryptocurrency & CryptocurrencyTransaction with information from formData',
      () async {
        // Arrange
        final crypto = Cryptocurrency()..type = CryptoType.bitcoin;

        final formData = CryptoForm(
          crypto: crypto,
          amount: 20,
          date: DateTime.now(),
        );

        final repository = MockCryptocurrencyRepository();
        final container = createContainer(
          overrides: [
            cryptocurrencyRepositoryProvider.overrideWithValue(repository),
          ],
        );

        // Act
        container.read(cryptoFormControllerProvider.notifier).state = formData;

        final submitController = container.read(
          submitCryptoFormControllerProvider.notifier,
        );
        final result = await submitController.submit();

        // Assert
        expect(result, true);
      },
    );

    test(
      'should add up the total number (totalFiat & totalCrypto) with information from formData',
      () async {
        // Arrange
        final crypto = Cryptocurrency()
          ..type = CryptoType.bitcoin
          ..totalCrypto = 22;

        final formData = CryptoForm(
          crypto: crypto,
          amount: 20,
          date: DateTime.now(),
        );

        final cryptoTransaction = CryptocurrencyTransaction()
          ..amount = formData.amount!
          ..date = formData.date!;

        const expectedAmount = 20;
        const expectedTotalCrypto = 42;

        final repository = MockCryptocurrencyRepository();
        final container = createContainer(
          overrides: [
            cryptocurrencyRepositoryProvider.overrideWithValue(repository),
          ],
        );

        when(
          repository.editCryptocurrency(
            crypto: crypto,
            transaction: cryptoTransaction,
          ),
        ).thenAnswer((_) => Future<void>.value());

        // Act
        container.read(cryptoFormControllerProvider.notifier).state = formData;

        final submitController = container.read(
          submitCryptoFormControllerProvider.notifier,
        );
        await submitController.submit();

        // Assert
        verify(
          repository.editCryptocurrency(
            crypto: argThat(
              predicate<Cryptocurrency>(
                (predic) => predic.totalCrypto == expectedTotalCrypto,
              ),
              named: 'crypto',
            ),
            transaction: argThat(
              predicate<CryptocurrencyTransaction>(
                (predic) => predic.amount == expectedAmount,
              ),
              named: 'transaction',
            ),
          ),
        );
      },
    );

    test('should return false when repository throws error', () async {
      // Arrange
      final error = Exception();

      final repository = MockCryptocurrencyRepository();
      final container = createContainer(
        overrides: [
          cryptocurrencyRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(
        repository.editCryptocurrency(
          crypto: anyNamed('crypto'),
          transaction: anyNamed('transaction'),
        ),
      ).thenThrow(error);

      // Act
      final submitController = container.read(
        submitCryptoFormControllerProvider.notifier,
      );
      final result = await submitController.submit();

      // Assert
      expect(result, false);
    });
  });
}
