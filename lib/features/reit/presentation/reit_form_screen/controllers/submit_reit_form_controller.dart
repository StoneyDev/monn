import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/reit/domain/reit.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/controllers/reit_form_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submit_reit_form_controller.g.dart';

@riverpod
class SubmitReitFormController extends _$SubmitReitFormController {
  @override
  FutureOr<void> build() async {}

  Future<bool> submit() async {
    state = const AsyncLoading();

    final repository = ref.read(reitRepositoryProvider);
    final formData = ref.read(reitFormControllerProvider);

    state = await AsyncValue.guard(
      () => repository.addReit(
        Reit()
          ..name = formData.reitName
          ..price = double.parse(formData.price)
          ..boughtOn = formData.boughtOn
          ..shares = int.parse(formData.shares),
      ),
    );

    return !state.hasError;
  }
}
