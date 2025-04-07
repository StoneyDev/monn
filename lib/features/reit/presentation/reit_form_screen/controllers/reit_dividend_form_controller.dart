import 'package:monn/features/reit/domain/reit.dart';
import 'package:monn/features/reit/domain/reit_dividend_form.dart';
import 'package:monn/shared/extensions/ref_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reit_dividend_form_controller.g.dart';

@riverpod
class ReitDividendFormController extends _$ReitDividendFormController {
  @override
  ReitDividendForm build() => ReitDividendForm(
        amount: '',
        receivedAt: DateTime.now(),
      );

  void reit({required Reit reit}) {
    // Maintains the value until next page is loaded
    ref.cacheFor(const Duration(seconds: 2));
    state = state.copyWith(reit: reit);
  }

  void amount({required String amount}) {
    state = state.copyWith(amount: amount);
  }

  void receivedAt({required DateTime receivedAt}) {
    state = state.copyWith(receivedAt: receivedAt);
  }
}
