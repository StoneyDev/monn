import 'package:monn/features/pea/domain/pea_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pea_form_controller.g.dart';

@Riverpod(keepAlive: true)
class PeaFormController extends _$PeaFormController {
  @override
  PeaForm build() => const PeaForm();

  void equity(String equity) {
    state = state.copyWith(equity: int.tryParse(equity) ?? state.equity);
  }

  void costAverage(String costAverage) {
    state = state.copyWith(
      costAverage: double.tryParse(costAverage) ?? state.costAverage,
    );
  }

  void update(PeaForm Function(PeaForm) form) {
    state = form(state);
  }
}
