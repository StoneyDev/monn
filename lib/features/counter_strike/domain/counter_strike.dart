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
    required double purchaseValue,
    required double currentValue,
    String? wear,
    @Default(1) int quantity,
    @Default(Isar.autoIncrement) Id id,
  }) = _CounterStrike;

  @override
  Id get id;
}
