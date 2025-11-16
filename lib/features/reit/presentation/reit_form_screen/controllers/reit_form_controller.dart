import 'package:monn/features/reit/domain/reit_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reit_form_controller.g.dart';

@Riverpod(keepAlive: true)
class ReitFormController extends _$ReitFormController {
  @override
  ReitForm build() => ReitForm(
        reitName: '',
        boughtOn: DateTime.now(),
        price: '',
        shares: '',
      );

  void reitName(String reitName) {
    state = state.copyWith(reitName: reitName);
  }

  void boughtOn(DateTime boughtOn) {
    state = state.copyWith(boughtOn: boughtOn);
  }

  void shares(String shares) {
    state = state.copyWith(shares: shares);
  }

  void price(String price) {
    state = state.copyWith(price: price);
  }
}
