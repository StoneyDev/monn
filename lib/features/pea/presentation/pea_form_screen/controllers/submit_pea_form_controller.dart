import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/features/pea/presentation/pea_form_screen/controllers/pea_form_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submit_pea_form_controller.g.dart';

@riverpod
class SubmitPeaFormController extends _$SubmitPeaFormController {
  @override
  Future<void> build() async {}

  Future<bool> submit() async {
    final repository = ref.read(peaRepositoryProvider);
    final formData = ref.read(peaFormControllerProvider);
    final pea = await ref.refresh(getPeaProvider.future);

    state = await AsyncValue.guard(
      () => repository.editPea(
        pea!
          ..equity = formData.equity!
          ..costAverage = formData.costAverage!,
      ),
    );

    return !state.hasError;
  }
}
