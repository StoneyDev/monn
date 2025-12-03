import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/cryptocurrency/presentation/add_crypto_screen/controllers/crypto_form_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submit_crypto_form_controller.g.dart';

@Riverpod(keepAlive: true)
class SubmitCryptoFormController extends _$SubmitCryptoFormController {
  @override
  FutureOr<void> build() async {}

  Future<bool> submit() async {
    final repository = ref.read(cryptocurrencyRepositoryProvider);
    final formData = ref.read(cryptoFormControllerProvider);

    state = await AsyncValue.guard(
      () => repository.editCryptocurrency(
        crypto: formData.crypto!..totalCrypto += double.parse(formData.amount),
        transaction: CryptocurrencyTransaction()
          ..amount = double.parse(formData.amount)
          ..date = formData.date,
      ),
    );

    return !state.hasError;
  }
}
