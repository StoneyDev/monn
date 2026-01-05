import 'package:monn/features/freelance/data/freelance_repository.dart';
import 'package:monn/features/freelance/domain/freelance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'freelance_form_controller.g.dart';

typedef FreelanceForm = ({String annualRevenue});

@Riverpod(keepAlive: true)
class FreelanceFormController extends _$FreelanceFormController {
  @override
  FreelanceForm build() => (annualRevenue: '');

  void set({String? annualRevenue}) {
    state = (
      annualRevenue: annualRevenue ?? state.annualRevenue,
    );
  }

  Future<bool> submit() async {
    final repository = ref.read(freelanceRepositoryProvider);

    final result = await AsyncValue.guard(
      () => repository.editFreelance(
        Freelance()..annualRevenue = double.tryParse(state.annualRevenue) ?? 0,
      ),
    );

    if (!ref.mounted) return false;

    return !result.hasError;
  }
}
