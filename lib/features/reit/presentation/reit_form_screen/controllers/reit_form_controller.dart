import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/reit/domain/reit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reit_form_controller.g.dart';

typedef ReitForm = ({
  String reitName,
  DateTime boughtOn,
  String price,
  String shares,
});

@Riverpod(keepAlive: true)
class ReitFormController extends _$ReitFormController {
  @override
  ReitForm build() => (
    reitName: '',
    boughtOn: DateTime.now(),
    price: '',
    shares: '',
  );

  void set({
    String? reitName,
    DateTime? boughtOn,
    String? price,
    String? shares,
  }) {
    state = (
      reitName: reitName ?? state.reitName,
      boughtOn: boughtOn ?? state.boughtOn,
      price: price ?? state.price,
      shares: shares ?? state.shares,
    );
  }

  Future<bool> submit() async {
    final repository = ref.read(reitRepositoryProvider);

    final result = await AsyncValue.guard(
      () => repository.addReit(
        Reit()
          ..name = state.reitName
          ..price = double.parse(state.price)
          ..boughtOn = state.boughtOn
          ..shares = int.parse(state.shares),
      ),
    );

    if (!ref.mounted) return false;

    return !result.hasError;
  }
}
