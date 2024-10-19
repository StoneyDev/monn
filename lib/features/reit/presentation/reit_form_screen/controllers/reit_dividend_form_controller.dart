import 'package:monn/features/reit/domain/reit.dart';
import 'package:monn/features/reit/domain/reit_dividend_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reit_dividend_form_controller.g.dart';

@Riverpod(keepAlive: true)
class ReitDividendFormController extends _$ReitDividendFormController {
  @override
  ReitDividendForm build() => const ReitDividendForm();

  void edit({
    Reit? reit,
    String? amount,
    DateTime? receivedAt,
  }) {
    state = state.copyWith(
      reit: reit ?? state.reit,
      amount: double.tryParse(amount ?? '') ?? state.amount,
      receivedAt: receivedAt ?? state.receivedAt,
    );
  }
}
