import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/reit/domain/reit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reit_dividend_form_controller.g.dart';

typedef ReitDividendForm = ({
  String amount,
  DateTime receivedAt,
  Reit? reit,
});

@Riverpod(keepAlive: true)
class ReitDividendFormController extends _$ReitDividendFormController {
  @override
  ReitDividendForm build() => (
    amount: '',
    receivedAt: DateTime.now(),
    reit: null,
  );

  void set({String? amount, DateTime? receivedAt, Reit? reit}) {
    state = (
      amount: amount ?? state.amount,
      receivedAt: receivedAt ?? state.receivedAt,
      reit: reit ?? state.reit,
    );
  }

  Future<bool> submit() async {
    final repository = ref.read(reitRepositoryProvider);

    final result = await AsyncValue.guard(
      () => repository.editReit(
        reit: state.reit!,
        dividend: ReitDividend()
          ..amount = double.parse(state.amount)
          ..receivedAt = state.receivedAt,
      ),
    );

    if (!ref.mounted) return false;

    return !result.hasError;
  }
}
