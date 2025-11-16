import 'package:monn/features/reit/domain/reit.dart';
import 'package:monn/features/reit/domain/reit_dividend_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reit_dividend_form_controller.g.dart';

@Riverpod(keepAlive: true)
class ReitDividendFormController extends _$ReitDividendFormController {
  @override
  ReitDividendForm build() => ReitDividendForm(
    amount: '',
    receivedAt: DateTime.now(),
  );

  void reit({required Reit reit}) {
    state = state.copyWith(reit: reit);
  }

  void amount({required String amount}) {
    state = state.copyWith(amount: amount);
  }

  void receivedAt({required DateTime receivedAt}) {
    state = state.copyWith(receivedAt: receivedAt);
  }
}
