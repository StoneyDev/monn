import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/features/pea/presentation/pea_form_screen/controllers/pea_form_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submit_pea_form_controller.g.dart';

@Riverpod(keepAlive: true)
class SubmitPeaFormController extends _$SubmitPeaFormController {
  @override
  Future<void> build() async {}

  Future<bool> submit() async {
    final repository = ref.watch(peaRepositoryProvider);
    final formData = ref.watch(peaFormControllerProvider);
    final pea = await ref.refresh(getPeaProvider.future);

    state = await AsyncValue.guard(
      () => repository.editPea(
        pea!
          ..equity = int.parse(formData.equity)
          ..costAverage = double.parse(formData.costAverage),
      ),
    );

    return !state.hasError;
  }
}
