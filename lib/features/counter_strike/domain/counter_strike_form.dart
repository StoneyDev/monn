import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_strike_form.freezed.dart';

@freezed
class CounterStrikeForm with _$CounterStrikeForm {
  const factory CounterStrikeForm({
    String? name,
    String? wear,
    double? purchaseValue,
    double? currentValue,
    DateTime? boughtAt,
    int? quantity,
    String? imageId,
  }) = _CounterStrikeForm;
}
