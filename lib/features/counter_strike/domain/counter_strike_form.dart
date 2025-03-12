import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monn/features/counter_strike/domain/counter_strike.dart';

part 'counter_strike_form.freezed.dart';

@freezed
class CounterStrikeForm with _$CounterStrikeForm {
  const factory CounterStrikeForm({
    required String purchaseValue,
    required String currentValue,
    required DateTime boughtAt,
    required String quantity,
    required CounterStrikeItem? imageId,
    String? wear,
  }) = _CounterStrikeForm;
}
