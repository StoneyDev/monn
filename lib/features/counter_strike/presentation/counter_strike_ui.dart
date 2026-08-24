import 'package:flutter/material.dart';
import 'package:monn/features/counter_strike/domain/counter_strike.dart';
import 'package:monn/utils/assets.gen.dart';

extension CounterStrikeItemUI on CounterStrikeItem {
  Image image({double? height}) => switch (this) {
    CounterStrikeItem.ak47Bloodsport =>
      MonnAssets.images.counterStrike.ak47Bloodsport.image(height: height),
    CounterStrikeItem.ak47LegionOfAnubis =>
      MonnAssets.images.counterStrike.ak47LegionOfAnubis.image(height: height),
    CounterStrikeItem.m4a1SPrintstream =>
      MonnAssets.images.counterStrike.m4a1SPrintstream.image(height: height),
    CounterStrikeItem.uspSPrintstream =>
      MonnAssets.images.counterStrike.uspSPrintstream.image(height: height),
    CounterStrikeItem.stilettoSlaughter =>
      MonnAssets.images.counterStrike.stilettoSlaughter.image(height: height),
    CounterStrikeItem.ursusFade =>
      MonnAssets.images.counterStrike.ursusFade.image(height: height),
    CounterStrikeItem.prisma2Case =>
      MonnAssets.images.counterStrike.prisma2Case.image(height: height),
    CounterStrikeItem.prismaCase =>
      MonnAssets.images.counterStrike.prismaCase.image(height: height),
    CounterStrikeItem.gammaCase =>
      MonnAssets.images.counterStrike.gammaCase.image(height: height),
    CounterStrikeItem.recoilCase =>
      MonnAssets.images.counterStrike.recoilCase.image(height: height),
    CounterStrikeItem.glock18RameseSReach =>
      MonnAssets.images.counterStrike.glock18RameseSReach.image(height: height),
    CounterStrikeItem.horizonCase =>
      MonnAssets.images.counterStrike.horizonCase.image(height: height),
    CounterStrikeItem.spectrumCase =>
      MonnAssets.images.counterStrike.spectrumCase.image(height: height),
    CounterStrikeItem.falchionCase =>
      MonnAssets.images.counterStrike.falchionCase.image(height: height),
    CounterStrikeItem.shadowCase =>
      MonnAssets.images.counterStrike.shadowCase.image(height: height),
    CounterStrikeItem.bayonetTigerTooth =>
      MonnAssets.images.counterStrike.bayonetTigerTooth.image(height: height),
    CounterStrikeItem.ak47LeetMuseo =>
      MonnAssets.images.counterStrike.ak47LeetMuseo.image(height: height),
    CounterStrikeItem.revolutionCase =>
      MonnAssets.images.counterStrike.revolutionCase.image(height: height),
    CounterStrikeItem.skeletonFade =>
      MonnAssets.images.counterStrike.skeletonFade.image(height: height),
  };
}
