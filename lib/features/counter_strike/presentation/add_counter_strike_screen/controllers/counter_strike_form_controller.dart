import 'package:drift/drift.dart';
import 'package:monn/features/counter_strike/data/counter_strike_repository.dart';
import 'package:monn/features/counter_strike/domain/counter_strike.dart';
import 'package:monn/shared/local/database.dart';
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

    final companion = CounterStrikeEntriesCompanion(
      id: state.id != null ? Value(state.id!) : const Value.absent(),
      wear: Value(double.tryParse(state.wear ?? '')),
      quantity: Value(int.parse(state.quantity)),
      currentValue: Value(double.parse(state.currentValue)),
      purchaseValue: Value(double.parse(state.purchaseValue)),
      boughtAt: Value(state.boughtAt),
      lastUpdate: Value(DateTime.now()),
      imageId: Value(state.imageId!.name),
    );

    final result = await AsyncValue.guard(
      () => repository.editCounterStrike(companion),
    );

    if (!ref.mounted) return false;

    return !result.hasError;
  }
}
