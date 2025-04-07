import 'package:monn/features/counter_strike/data/counter_strike_repository.dart';
import 'package:monn/features/counter_strike/domain/counter_strike.dart';
import 'package:monn/features/counter_strike/presentation/add_counter_strike_screen/controllers/counter_strike_form_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submit_counter_strike_form_controller.g.dart';

@riverpod
class SubmitCounterStrikeFormController
    extends _$SubmitCounterStrikeFormController {
  @override
  FutureOr<void> build() async {}

  Future<bool> submit() async {
    final repository = ref.read(counterStrikeRepositoryProvider);
    final formData = ref.read(counterStrikeFormControllerProvider);

    state = await AsyncValue.guard(
      () => repository.editCounterStrike(
        CounterStrike(
          wear: double.tryParse(formData.wear ?? ''),
          quantity: int.parse(formData.quantity),
          currentValue: double.parse(formData.currentValue),
          purchaseValue: double.parse(formData.purchaseValue),
          boughtAt: formData.boughtAt,
          lastUpdate: DateTime.now(),
          imageId: formData.imageId!,
        ),
      ),
    );

    return !state.hasError;
  }

  Future<bool> submitNewCurrentValue(CounterStrike counterStrike) async {
    final repository = ref.read(counterStrikeRepositoryProvider);

    state = await AsyncValue.guard(
      () => repository.editCounterStrike(counterStrike),
    );

    return !state.hasError;
  }
}
