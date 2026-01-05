import 'package:monn/features/counter_strike/data/counter_strike_repository.dart';
import 'package:monn/features/counter_strike/domain/counter_strike.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_strike_form_controller.g.dart';

typedef CounterStrikeForm = ({
  int? id,
  String? wear,
  String purchaseValue,
  String currentValue,
  DateTime boughtAt,
  String quantity,
  CounterStrikeItem? imageId,
});

@Riverpod(keepAlive: true)
class CounterStrikeFormController extends _$CounterStrikeFormController {
  @override
  CounterStrikeForm build() => (
    id: null,
    wear: null,
    purchaseValue: '',
    currentValue: '',
    boughtAt: DateTime.now(),
    quantity: '1',
    imageId: null,
  );

  void set({
    int? id,
    String? wear,
    String? purchaseValue,
    String? currentValue,
    DateTime? boughtAt,
    String? quantity,
    CounterStrikeItem? imageId,
  }) {
    state = (
      id: id ?? state.id,
      wear: wear ?? state.wear,
      purchaseValue: purchaseValue ?? state.purchaseValue,
      currentValue: currentValue ?? state.currentValue,
      boughtAt: boughtAt ?? state.boughtAt,
      quantity: quantity ?? state.quantity,
      imageId: imageId ?? state.imageId,
    );
  }

  Future<bool> submit() async {
    final repository = ref.read(counterStrikeRepositoryProvider);

    final counterStrike = CounterStrike()
      ..wear = double.tryParse(state.wear ?? '')
      ..quantity = int.parse(state.quantity)
      ..currentValue = double.parse(state.currentValue)
      ..purchaseValue = double.parse(state.purchaseValue)
      ..boughtAt = state.boughtAt
      ..lastUpdate = DateTime.now()
      ..imageId = state.imageId!;

    if (state.id != null) counterStrike.id = state.id!;

    final result = await AsyncValue.guard(
      () => repository.editCounterStrike(counterStrike),
    );

    if (!ref.mounted) return false;

    return !result.hasError;
  }
}
