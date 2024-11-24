import 'package:monn/features/counter_strike/domain/counter_strike_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_strike_form_controller.g.dart';

@Riverpod(keepAlive: true)
class CounterStrikeFormController extends _$CounterStrikeFormController {
  @override
  CounterStrikeForm build() => const CounterStrikeForm();

  void edit({
    String? name,
    String? wear,
    String? purchaseValue,
    String? currentValue,
    String? quantity,
    String? imageId,
    DateTime? boughtAt,
  }) {
    state = state.copyWith(
      name: name ?? state.name,
      wear: wear ?? state.wear,
      purchaseValue:
          double.tryParse(purchaseValue ?? '') ?? state.purchaseValue,
      currentValue: double.tryParse(currentValue ?? '') ?? state.currentValue,
      quantity: int.tryParse(quantity ?? '') ?? state.quantity,
      imageId: imageId ?? state.imageId,
      boughtAt: boughtAt ?? state.boughtAt,
    );
  }
}
