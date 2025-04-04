import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'counter_strike.freezed.dart';
part 'counter_strike.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class CounterStrike with _$CounterStrike {
  const factory CounterStrike({
    required DateTime boughtAt,
    required DateTime lastUpdate,
    @Enumerated(EnumType.name) required CounterStrikeItem imageId,
    required double purchaseValue,
    required double currentValue,
    required int quantity,
    double? wear,
    @Default(Isar.autoIncrement) Id id,
  }) = _CounterStrike;

  @override
  Id get id;
}

enum CounterStrikeItem {
  ak47Bloodsport('AK47 Bloodsport'),
  ak47LegionOfAnubis('AK47 Legion Of Anubis'),
  ak47LeetMuseo('AK47 Leet Museo'),
  m4a1SPrintstream('M4A1-S Printstream'),
  uspSPrintstream('USP-S Printstream'),
  glock18RameseSReach("Glock-18 Ramese's Reach"),
  stilettoSlaughter('Stiletto Slaughter'),
  bayonetTigerTooth('Bayonet Tiger Tooth'),
  ursusFade('Ursus Fade'),
  prismaCase('Prisma'),
  prisma2Case('Prisma 2'),
  gammaCase('Gamma'),
  revolutionCase('Revolution'),
  shadowCase('Shadow'),
  spectrumCase('Spectrum'),
  falchionCase('Falchion'),
  horizonCase('Horizon'),
  recoilCase('Recoil');

  const CounterStrikeItem(this.label);

  final String label;
}
