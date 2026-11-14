import 'package:drift/drift.dart';
import 'package:monn/features/cto/data/cto_repository.dart';
import 'package:monn/shared/local/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cto_form_controller.g.dart';

typedef CtoForm = ({
  int? id,
  String name,
  String symbol,
  String quantity,
  String costAverage,
});

@Riverpod(keepAlive: true)
class CtoFormController extends _$CtoFormController {
  @override
  CtoForm build() =>
      (id: null, name: '', symbol: '', quantity: '', costAverage: '');

  void set({
    int? id,
    String? name,
    String? symbol,
    String? quantity,
    String? costAverage,
  }) {
    state = (
      id: id ?? state.id,
      name: name ?? state.name,
      symbol: symbol ?? state.symbol,
      quantity: quantity ?? state.quantity,
      costAverage: costAverage ?? state.costAverage,
    );
  }

  Future<bool> submit() async {
    final repository = ref.read(ctoRepositoryProvider);

    final result = await AsyncValue.guard(
      () => repository.editCto(
        CtoEntriesCompanion(
          id: .absentIfNull(state.id),
          name: Value(state.name.trim()),
          symbol: Value(state.symbol.trim().toUpperCase()),
          quantity: Value(.parse(state.quantity)),
          costAverage: Value(.parse(state.costAverage)),
        ),
      ),
    );

    if (!ref.mounted) return false;

    return !result.hasError;
  }
}
