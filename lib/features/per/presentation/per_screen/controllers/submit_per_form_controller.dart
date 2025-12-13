import 'package:monn/features/per/data/per_repository.dart';
import 'package:monn/features/per/domain/per.dart';
import 'package:monn/features/per/presentation/per_screen/controllers/per_form_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submit_per_form_controller.g.dart';

@Riverpod(keepAlive: true)
class SubmitPerFormController extends _$SubmitPerFormController {
  @override
  Future<void> build() async {}

  Future<bool> submit() async {
    final repository = ref.read(perRepositoryProvider);
    final formData = ref.read(perFormControllerProvider);

    state = await AsyncValue.guard(
      () => repository.editPer(
        Per()
          ..invested = double.parse(formData.invested)
          ..interests = double.parse(formData.interests),
      ),
    );

    if (!ref.mounted) return false;

    return !state.hasError;
  }
}
