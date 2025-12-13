import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/cash/data/cash_repository.dart';
import 'package:monn/features/cash/presentation/cash_screen/cash_screen.dart';
import 'package:monn/features/counter_strike/data/counter_strike_repository.dart';
import 'package:monn/features/counter_strike/domain/counter_strike.dart';
import 'package:monn/features/counter_strike/presentation/counter_strike_screen/counter_strike_screen.dart';
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/crowdfunding/presentation/crowdfunding_screen/crowdfunding_screen.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/cryptocurrency/presentation/cryptocurrency_screen/cryptocurrency_screen.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/life_insurance/data/life_insurance_repository.dart';
import 'package:monn/features/life_insurance/presentation/life_insurance_screen/life_insurance_screen.dart';
import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/features/pea/presentation/pea_screen/pea_screen.dart';
import 'package:monn/features/per/data/per_repository.dart';
import 'package:monn/features/per/presentation/per_screen/per_screen.dart';
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/reit/presentation/reit_screen/reit_screen.dart';
import 'package:monn/features/savings_book/data/savings_book_repository.dart';
import 'package:monn/features/savings_book/presentation/savings_book_screen/savings_book_screen.dart';
import 'package:monn/utils/assets.gen.dart';

extension SavingsTypeUI on SavingsType {
  double getReport(WidgetRef ref) {
    return switch (this) {
      SavingsType.savingsBook => ref.watch(
        watchPayoutReportSavingsBookProvider.select(
          (value) => value.value?.finalAmount ?? 0,
        ),
      ),
      SavingsType.crowdfunding => ref.watch(
        watchPayoutReportCrowdfundingProvider.select(
          (value) => value.value?.finalAmount ?? 0,
        ),
      ),
      SavingsType.cryptocurrency => ref.watch(
        watchPayoutReportCryptoProvider.select(
          (value) => value.value?.finalAmount ?? 0,
        ),
      ),
      SavingsType.csKnives => ref.watch(
        watchPayoutReportCounterStrikeProvider.select(
          (value) => value.value?.finalAmount ?? 0,
        ),
      ),
      SavingsType.cash => ref.watch(
        watchPayoutReportCashProvider.select(
          (value) => value.value?.finalAmount ?? 0,
        ),
      ),
      // SavingsType.cto => 0,
      SavingsType.lifeInsurance => ref.watch(
        watchPayoutReportLifeInsuranceProvider.select(
          (value) => value.value?.finalAmount ?? 0,
        ),
      ),
      SavingsType.pea => ref.watch(
        getPayoutReportPeaProvider.select(
          (value) => value.value?.finalAmount ?? 0,
        ),
      ),
      SavingsType.per => ref.watch(
        watchPayoutReportPerProvider.select(
          (value) => value.value?.finalAmount ?? 0,
        ),
      ),
      SavingsType.reit => ref.watch(
        watchPayoutReportReitProvider.select(
          (value) => value.value?.finalAmount ?? 0,
        ),
      ),
    };
  }

  Widget route() {
    return switch (this) {
      SavingsType.savingsBook => const SavingsBookScreen(),
      SavingsType.crowdfunding => const CrowdfundingScreen(),
      SavingsType.cryptocurrency => const CryptocurrencyScreen(),
      SavingsType.csKnives => const CounterStrikeScreen(),
      SavingsType.cash => const CashScreen(),
      // SavingsType.cto => const MonnWip(),
      SavingsType.lifeInsurance => const LifeInsuranceScreen(),
      SavingsType.pea => const PeaScreen(),
      SavingsType.per => const PerScreen(),
      SavingsType.reit => const ReitScreen(),
    };
  }

  ImageProvider<Object> icon() {
    return switch (this) {
      SavingsType.savingsBook => MonnAssets.images.icon.locker.provider(),
      SavingsType.crowdfunding => MonnAssets.images.icon.moneyBag.provider(),
      SavingsType.cryptocurrency => MonnAssets.images.icon.ethCoin.provider(),
      SavingsType.csKnives => MonnAssets.images.icon.crown.provider(),
      SavingsType.cash => MonnAssets.images.icon.money.provider(),
      // SavingsType.cto => MonnAssets.images.icon.bag.provider(),
      SavingsType.lifeInsurance => MonnAssets.images.icon.umbrella.provider(),
      SavingsType.pea => MonnAssets.images.icon.bag.provider(),
      SavingsType.per => MonnAssets.images.icon.calendar.provider(),
      SavingsType.reit => MonnAssets.images.icon.folder.provider(),
    };
  }
}

extension CryptoTypeUI on CryptoType {
  ImageProvider<Object> logo() {
    return switch (this) {
      CryptoType.bitcoin => MonnAssets.images.crypto.bitcoin.provider(),
      CryptoType.ethereum => MonnAssets.images.crypto.ethereum.provider(),
      CryptoType.chainlink => MonnAssets.images.crypto.chainlink.provider(),
      CryptoType.tether => MonnAssets.images.crypto.tether.provider(),
      CryptoType.usdCoin => MonnAssets.images.crypto.usdCoin.provider(),
    };
  }
}

extension CounterStrikeItemUI on CounterStrikeItem {
  Image image({double? height}) {
    return switch (this) {
      CounterStrikeItem.ak47Bloodsport =>
        MonnAssets.images.counterStrike.ak47Bloodsport.image(height: height),
      CounterStrikeItem.ak47LegionOfAnubis =>
        MonnAssets.images.counterStrike.ak47LegionOfAnubis.image(
          height: height,
        ),
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
        MonnAssets.images.counterStrike.glock18RameseSReach.image(
          height: height,
        ),
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
    };
  }
}
