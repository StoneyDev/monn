import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'cash.freezed.dart';
part 'cash.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Cash with _$Cash {
  const factory Cash({
    required String label,
    required double value,
    @Default(Isar.autoIncrement) Id id,
  }) = _Cash;

  @override
  Id get id;
}
