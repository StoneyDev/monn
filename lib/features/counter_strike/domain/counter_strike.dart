import 'package:isar_community/isar.dart';

part 'counter_strike.g.dart';

@collection
class CounterStrike {
  Id id = Isar.autoIncrement;

  late DateTime boughtAt;
  late DateTime lastUpdate;

  @Enumerated(EnumType.name)
  late CounterStrikeItem imageId;

  late double purchaseValue;
  late double currentValue;
  late int quantity;

  double? wear;
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
  recoilCase('Recoil'),
  skeletonFade('Skeleton Fade')
  ;

  const CounterStrikeItem(this.label);

  final String label;
}
