import 'package:monn/features/freelance/data/freelance_repository.dart';
import 'package:monn/features/freelance/domain/freelance.dart';
import 'package:monn/features/freelance/presentation/freelance_screen/controllers/freelance_form_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submit_freelance_form_controller.g.dart';

@Riverpod(keepAlive: true)
class SubmitFreelanceFormController extends _$SubmitFreelanceFormController {
  @override
  Future<void> build() async {}

  Future<bool> submit() async {
    final repository = ref.read(freelanceRepositoryProvider);
    final formData = ref.read(freelanceFormControllerProvider);

    state = await AsyncValue.guard(
      () => repository.editFreelance(
        Freelance()
          ..annualRevenue = double.tryParse(formData.annualRevenue) ?? 0,
      ),
    );

    if (!ref.mounted) return false;

    return !state.hasError;
  }
}
