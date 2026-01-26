import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crypto_form_controller.g.dart';

typedef CryptoForm = ({
  String amount,
  String fiatAmount,
  DateTime date,
  Cryptocurrency? crypto,
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
    Cryptocurrency? crypto,
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
    final savingsRepository = ref.read(savingsRepositoryProvider);

    final cryptoAmount = double.parse(state.amount);
    final isPurchase = cryptoAmount > 0;

    final result = await AsyncValue.guard(
      () => cryptoRepository.editCryptocurrency(
        crypto: state.crypto!..totalCrypto += cryptoAmount,
        transaction: CryptocurrencyTransaction()
          ..amount = cryptoAmount
          ..date = state.date,
      ),
    );

    if (!ref.mounted || result.hasError) return false;

    // Update startAmount only for purchases
    if (isPurchase && state.fiatAmount.isNotEmpty) {
      final fiatAmount = double.parse(state.fiatAmount);
      final savings =
          await savingsRepository.getSavings(SavingsType.cryptocurrency);
      final newSavings =
          (savings ?? (Savings()..type = SavingsType.cryptocurrency))
            ..startAmount = (savings?.startAmount ?? 0) + fiatAmount;

      final savingsResult = await AsyncValue.guard(
        () => savingsRepository.editSaving(newSavings),
      );

      if (!ref.mounted) return false;

      return !savingsResult.hasError;
    }

    return true;
  }
}
