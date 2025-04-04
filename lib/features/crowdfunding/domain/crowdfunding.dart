import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'crowdfunding.freezed.dart';
part 'crowdfunding.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Crowdfunding with _$Crowdfunding {
  const factory Crowdfunding({
    required double brutProfit,
    required String platformName,
    double? netProfit,
    double? taxProfit,
    double? taxPercentage,
    DateTime? receivedAt,
    @Default(Isar.autoIncrement) Id id,
  }) = _Crowdfunding;

  @override
  Id get id;
}
