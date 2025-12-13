import 'package:monn/features/life_insurance/data/life_insurance_repository.dart';
import 'package:monn/features/life_insurance/domain/life_insurance.dart';
import 'package:monn/features/life_insurance/presentation/life_insurance_screen/controllers/life_insurance_form_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submit_life_insurance_form_controller.g.dart';

@Riverpod(keepAlive: true)
class SubmitLifeInsuranceFormController
    extends _$SubmitLifeInsuranceFormController {
  @override
  Future<void> build() async {}

  Future<bool> submit() async {
    final repository = ref.read(lifeInsuranceRepositoryProvider);
    final formData = ref.read(lifeInsuranceFormControllerProvider);

    state = await AsyncValue.guard(
      () => repository.editLifeInsurance(
        LifeInsurance()
          ..invested = double.parse(formData.invested)
          ..interests = double.parse(formData.interests),
      ),
    );

    if (!ref.mounted) return false;

    return !state.hasError;
  }
}
