import 'package:monn/features/cryptocurrency/domain/crypto_form.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crypto_form_controller.g.dart';

@Riverpod(keepAlive: true)
class CryptoFormController extends _$CryptoFormController {
  @override
  CryptoForm build() => const CryptoForm();

  void edit({
    Cryptocurrency? crypto,
    String? fiat,
    String? amount,
    DateTime? boughtOn,
  }) {
    state = state.copyWith(
      crypto: crypto ?? state.crypto,
      fiat: double.tryParse(fiat ?? '') ?? state.fiat,
      amount: double.tryParse(amount ?? '') ?? state.amount,
      boughtOn: boughtOn ?? state.boughtOn,
    );
  }
}
