import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crypto_form_controller.g.dart';

typedef CryptoForm = ({
  String amount,
  DateTime date,
  Cryptocurrency? crypto,
});

@Riverpod(keepAlive: true)
class CryptoFormController extends _$CryptoFormController {
  @override
  CryptoForm build() => (amount: '', date: DateTime.now(), crypto: null);

  void set({String? amount, DateTime? date, Cryptocurrency? crypto}) {
    state = (
      amount: amount ?? state.amount,
      date: date ?? state.date,
      crypto: crypto ?? state.crypto,
    );
  }

  Future<bool> submit() async {
    final repository = ref.read(cryptocurrencyRepositoryProvider);

    final result = await AsyncValue.guard(
      () => repository.editCryptocurrency(
        crypto: state.crypto!..totalCrypto += double.parse(state.amount),
        transaction: CryptocurrencyTransaction()
          ..amount = double.parse(state.amount)
          ..date = state.date,
      ),
    );

    if (!ref.mounted) return false;

    return !result.hasError;
  }
}
