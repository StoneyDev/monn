import 'package:monn/features/reit/domain/reit_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reit_form_controller.g.dart';

@Riverpod(keepAlive: true)
class ReitFormController extends _$ReitFormController {
  @override
  ReitForm build() => const ReitForm();

  void edit({
    String? reitName,
    DateTime? boughtOn,
    String? shares,
    String? price,
  }) {
    state = state.copyWith(
      reitName: reitName ?? state.reitName,
      price: double.tryParse(price ?? '') ?? state.price,
      shares: double.tryParse(shares ?? '') ?? state.shares,
      boughtOn: boughtOn ?? state.boughtOn,
    );
  }
}
