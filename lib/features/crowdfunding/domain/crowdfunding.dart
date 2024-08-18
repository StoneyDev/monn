import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'crowdfunding.freezed.dart';
part 'crowdfunding.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Crowdfunding with _$Crowdfunding {
  const factory Crowdfunding({
    @Default(0.0) double netProfit,
    @Default(0.0) double brutProfit,
    @Default(0.0) double taxProfit,
    @Default(0.0) double taxPercentage,
    @Default('Inconnue') String platform,
    DateTime? receiveAt,
    @Default(Isar.autoIncrement) Id id,
  }) = _Crowdfunding;

  const Crowdfunding._();

  @override
  Id get id;
}
