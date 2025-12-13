import 'package:monn/features/life_insurance/domain/life_insurance_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'life_insurance_form_controller.g.dart';

@Riverpod(keepAlive: true)
class LifeInsuranceFormController extends _$LifeInsuranceFormController {
  @override
  LifeInsuranceForm build() => const LifeInsuranceForm(
    invested: '',
    interests: '',
  );

  void invested({required String invested}) {
    state = state.copyWith(invested: invested);
  }

  void interests({required String interests}) {
    state = state.copyWith(interests: interests);
  }
}
