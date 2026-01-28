import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/features/pea/domain/pea.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pea_form_controller.g.dart';

typedef PeaForm = ({String equity, String costAverage, bool isDirty});

@Riverpod(keepAlive: true)
class PeaFormController extends _$PeaFormController {
  @override
  PeaForm build() {
    final pea = ref.watch(getPeaProvider);

    return pea.maybeWhen(
      data: (value) => (
        equity: (value?.equity ?? '').toString(),
        costAverage: (value?.costAverage ?? '').toString(),
        isDirty: false,
      ),
      orElse: () => (equity: '', costAverage: '', isDirty: false),
    );
  }

  void set({
    String? equity,
    int? initialEquity,
    String? costAverage,
    double? initialCostAverage,
  }) {
    final newEquity = equity ?? state.equity;
    final newCostAverage = costAverage ?? state.costAverage;

    final equityDirty =
        equity != null &&
        equity.isNotEmpty &&
        int.tryParse(equity) != initialEquity;
    final costDirty =
        costAverage != null &&
        costAverage.isNotEmpty &&
        double.tryParse(costAverage) != initialCostAverage;

    state = (
      equity: newEquity,
      costAverage: newCostAverage,
      isDirty: state.isDirty || equityDirty || costDirty,
    );
  }

  Future<bool> submit() async {
    final repository = ref.read(peaRepositoryProvider);

    final newEquity = int.parse(state.equity);
    final newCostAverage = double.parse(state.costAverage);

    final pea = await ref.read(getPeaProvider.future);

    if (!ref.mounted) return false;

    final result = await AsyncValue.guard(
      () => repository.editPea(
        (pea ?? Pea())
          ..id = 1
          ..equity = newEquity
          ..costAverage = newCostAverage,
      ),
    );

    if (!ref.mounted) return false;

    return !result.hasError;
  }
}
