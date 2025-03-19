import 'package:monn/features/cryptocurrency/domain/crypto_form.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/shared/extensions/ref_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crypto_form_controller.g.dart';

@riverpod
class CryptoFormController extends _$CryptoFormController {
  @override
  CryptoForm build() => CryptoForm(amount: '', date: DateTime.now());

  void crypto({required Cryptocurrency crypto}) {
    // Maintains the value until next page is loaded
    ref.cacheFor(const Duration(seconds: 2));
    state = state.copyWith(crypto: crypto);
  }

  void amount({required String amount}) {
    state = state.copyWith(amount: amount);
  }

  // withdrawalOn or boughtOn
  void date({required DateTime date}) {
    state = state.copyWith(date: date);
  }
}
