import 'package:monn/features/per/domain/per_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'per_form_controller.g.dart';

@Riverpod(keepAlive: true)
class PerFormController extends _$PerFormController {
  @override
  PerForm build() => const PerForm(
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
