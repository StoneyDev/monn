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
    String? amount,
    DateTime? date,
  }) {
    state = state.copyWith(
      crypto: crypto ?? state.crypto,
      amount: double.tryParse(amount ?? '') ?? state.amount,
      date: date ?? state.date,
    );
  }
}
