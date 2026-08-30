import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/shared/local/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crypto_form_controller.g.dart';

typedef CryptoForm = ({
  String amount,
  String fiatAmount,
  DateTime date,
  CryptocurrencyEntry? crypto,
});

@Riverpod(keepAlive: true)
class CryptoFormController extends _$CryptoFormController {
  @override
  CryptoForm build() =>
      (amount: '', fiatAmount: '', date: DateTime.now(), crypto: null);

  void set({
    String? amount,
    String? fiatAmount,
    DateTime? date,
    CryptocurrencyEntry? crypto,
  }) {
    state = (
      amount: amount ?? state.amount,
      fiatAmount: fiatAmount ?? state.fiatAmount,
      date: date ?? state.date,
      crypto: crypto ?? state.crypto,
    );
  }

  Future<bool> submit() async {
    final cryptoRepository = ref.read(cryptocurrencyRepositoryProvider);

    final cryptoAmount = double.parse(state.amount);
    final isPurchase = cryptoAmount > 0;
    final investedFiatAmount = isPurchase && state.fiatAmount.isNotEmpty
        ? double.parse(state.fiatAmount)
        : null;

    final result = await AsyncValue.guard(
      () => cryptoRepository.recordTransaction(
        type: state.crypto!.cryptoType,
        cryptoAmount: cryptoAmount,
        date: state.date,
        investedFiatAmount: investedFiatAmount,
      ),
    );

    if (!ref.mounted) return false;

    return !result.hasError;
  }
}
