import 'package:monn/features/freelance/domain/freelance_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'freelance_form_controller.g.dart';

@Riverpod(keepAlive: true)
class FreelanceFormController extends _$FreelanceFormController {
  @override
  FreelanceForm build() => const FreelanceForm(annualRevenue: '');

  void annualRevenue(String annualRevenue) {
    state = state.copyWith(annualRevenue: annualRevenue);
  }
}
