import 'package:isar/isar.dart';
import 'package:monn/features/cash/data/cash_repository.dart';
import 'package:monn/features/cash/domain/cash.dart';
import 'package:monn/features/cash/presentation/add_cash_screen/controllers/cash_form_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submit_cash_form_controller.g.dart';

@riverpod
class SubmitCashFormController extends _$SubmitCashFormController {
  @override
  Future<void> build() async {}

  Future<bool> submit() async {
    final repository = ref.read(cashRepositoryProvider);
    final formData = ref.read(cashFormControllerProvider);

    state = await AsyncValue.guard(
      () => repository.editCash(
        Cash(
          id: formData.id ?? Isar.autoIncrement,
          label: formData.label,
          value: double.parse(formData.value),
        ),
      ),
    );

    return !state.hasError;
  }
}
