import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/cryptocurrency/presentation/crypto_form_screen/controllers/crypto_form_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submit_crypto_form_controller.g.dart';

@riverpod
class SubmitCryptoFormController extends _$SubmitCryptoFormController {
  @override
  FutureOr<void> build() async {}

  Future<bool> submit() async {
    state = const AsyncLoading();

    final repository = ref.read(cryptocurrencyRepositoryProvider);
    final formData = ref.read(cryptoFormControllerProvider);

    state = await AsyncValue.guard(
      () => repository.editCryptocurrency(
        crypto: formData.crypto!
          ..totalFiat += formData.fiat!
          ..totalCrypto += formData.amount!,
        transaction: CryptocurrencyTransaction()
          ..amount = formData.amount!
          ..fiat = formData.fiat!
          ..boughtOn = formData.boughtOn!,
      ),
    );

    return !state.hasError;
  }
}
