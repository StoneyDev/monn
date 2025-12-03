import 'package:monn/features/counter_strike/domain/counter_strike.dart';
import 'package:monn/features/counter_strike/domain/counter_strike_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_strike_form_controller.g.dart';

@Riverpod(keepAlive: true)
class CounterStrikeFormController extends _$CounterStrikeFormController {
  @override
  CounterStrikeForm build() => CounterStrikeForm(
        wear: '',
        currentValue: '',
        boughtAt: DateTime.now(),
        purchaseValue: '',
        quantity: '1',
        imageId: null,
      );

  void wear({String? wear}) {
    state = state.copyWith(wear: wear);
  }

  void purchaseValue({required String purchaseValue}) {
    state = state.copyWith(purchaseValue: purchaseValue);
  }

  void currentValue({required String currentValue}) {
    state = state.copyWith(currentValue: currentValue);
  }

  void quantity({required String quantity}) {
    state = state.copyWith(quantity: quantity);
  }

  void boughtAt({required DateTime boughtAt}) {
    state = state.copyWith(boughtAt: boughtAt);
  }

  void imageId({required CounterStrikeItem imageId}) {
    state = state.copyWith(imageId: imageId);
  }
}
