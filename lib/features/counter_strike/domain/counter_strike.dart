import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'counter_strike.freezed.dart';
part 'counter_strike.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class CounterStrike with _$CounterStrike {
  const factory CounterStrike({
    required String name,
    required DateTime boughtAt,
    required DateTime lastUpdate,
    required String imageId,
    String? wear,
    @Default(1) int quantity,
    @Default(0.0) double purchaseValue,
    @Default(0.0) double currentValue,
    @Default(Isar.autoIncrement) Id id,
  }) = _CounterStrike;

  @override
  Id get id;
}
