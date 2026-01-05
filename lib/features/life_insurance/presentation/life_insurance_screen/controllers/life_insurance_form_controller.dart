import 'package:monn/features/life_insurance/data/life_insurance_repository.dart';
import 'package:monn/features/life_insurance/domain/life_insurance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'life_insurance_form_controller.g.dart';

typedef LifeInsuranceForm = ({String invested, String interests});

@Riverpod(keepAlive: true)
class LifeInsuranceFormController extends _$LifeInsuranceFormController {
  @override
  LifeInsuranceForm build() => (invested: '', interests: '');

  void set({String? invested, String? interests}) {
    state = (
      invested: invested ?? state.invested,
      interests: interests ?? state.interests,
    );
  }

  Future<bool> submit() async {
    final repository = ref.read(lifeInsuranceRepositoryProvider);

    final result = await AsyncValue.guard(
      () => repository.editLifeInsurance(
        LifeInsurance()
          ..invested = double.parse(state.invested)
          ..interests = double.parse(state.interests),
      ),
    );

    if (!ref.mounted) return false;

    return !result.hasError;
  }
}
