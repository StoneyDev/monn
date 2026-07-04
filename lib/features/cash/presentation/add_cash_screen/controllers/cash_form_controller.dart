import 'package:drift/drift.dart';
import 'package:monn/features/cash/data/cash_repository.dart';
import 'package:monn/shared/local/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cash_form_controller.g.dart';

typedef CashForm = ({String label, String value, int? id});

@Riverpod(keepAlive: true)
class CashFormController extends _$CashFormController {
  @override
  CashForm build() => (label: '', value: '', id: null);

  void set({String? label, String? value, int? id}) {
    state = (
      label: label ?? state.label,
      value: value ?? state.value,
      id: id ?? state.id,
    );
  }

  Future<bool> submit() async {
    final repository = ref.read(cashRepositoryProvider);

    final result = await AsyncValue.guard(
      () => repository.editCash(
        CashEntriesCompanion(
          id: state.id != null ? Value(state.id!) : const Value.absent(),
          label: Value(state.label),
          value: Value(double.parse(state.value)),
        ),
      ),
    );

    if (!ref.mounted) return false;

    return !result.hasError;
  }
}
