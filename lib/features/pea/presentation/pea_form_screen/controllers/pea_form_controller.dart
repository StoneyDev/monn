import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/features/pea/domain/pea_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pea_form_controller.g.dart';

@riverpod
class PeaFormController extends _$PeaFormController {
  @override
  PeaForm build() {
    final pea = ref.watch(getPeaProvider);

    return pea.maybeWhen(
      data: (value) => PeaForm(
        equity: (value?.equity ?? '').toString(),
        costAverage: (value?.costAverage ?? '').toString(),
      ),
      orElse: () => const PeaForm(equity: '', costAverage: ''),
    );
  }

  void equity({required String equity, int? initial}) {
    state = state.copyWith(
      equity: equity,
      isDirty: equity.isNotEmpty && int.parse(equity) != initial,
    );
  }

  void costAverage({required String costAverage, double? initial}) {
    state = state.copyWith(
      costAverage: costAverage,
      isDirty: costAverage.isNotEmpty && double.parse(costAverage) != initial,
    );
  }
}
