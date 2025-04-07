import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/reit/domain/reit.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/controllers/reit_dividend_form_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submit_reit_dividend_form_controller.g.dart';

@riverpod
class SubmitReitDividendFormController
    extends _$SubmitReitDividendFormController {
  @override
  FutureOr<void> build() async {}

  Future<bool> submit() async {
    state = const AsyncLoading();

    final repository = ref.read(reitRepositoryProvider);
    final formData = ref.read(reitDividendFormControllerProvider);

    state = await AsyncValue.guard(
      () => repository.editReit(
        reit: formData.reit!,
        dividend: ReitDividend()
          ..amount = double.parse(formData.amount)
          ..receivedAt = formData.receivedAt,
      ),
    );

    return !state.hasError;
  }
}
