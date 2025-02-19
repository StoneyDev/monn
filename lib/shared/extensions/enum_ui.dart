import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/counter_strike/data/counter_strike_repository.dart';
import 'package:monn/features/counter_strike/presentation/counter_strike_screen/counter_strike_screen.dart';
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/crowdfunding/presentation/crowdfunding_screen/crowdfunding_screen.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/cryptocurrency/presentation/cryptocurrency_screen/cryptocurrency_screen.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/features/pea/presentation/pea_screen/pea_screen.dart';
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
            (value) => value.valueOrNull?.finalAmount ?? 0,
          ),
        ),
      SavingsType.crowdfunding => ref.watch(
          watchPayoutReportCrowdfundingProvider.select(
            (value) => value.valueOrNull?.finalAmount ?? 0,
          ),
        ),
      SavingsType.cryptocurrency => ref.watch(
          watchPayoutReportCryptoProvider.select(
            (value) => value.valueOrNull?.finalAmount ?? 0,
          ),
        ),
      SavingsType.csknives => ref.watch(
          watchPayoutReportCounterStrikeProvider.select(
            (value) => value.valueOrNull?.finalAmount ?? 0,
          ),
        ),
      // SavingsType.cto => 0,
      // SavingsType.lifeInsurance => 0,
      SavingsType.pea => ref.watch(
          getPayoutReportPeaProvider.select(
            (value) => value.valueOrNull?.finalAmount ?? 0,
          ),
        ),
      SavingsType.reit => ref.watch(
          watchPayoutReportReitProvider.select(
            (value) => value.valueOrNull?.finalAmount ?? 0,
          ),
        ),
      // SavingsType.rip => 0,
    };
  }

  Widget route() {
    return switch (this) {
      SavingsType.savingsBook => const SavingsBookScreen(),
      SavingsType.crowdfunding => const CrowdfundingScreen(),
      SavingsType.cryptocurrency => const CryptocurrencyScreen(),
      SavingsType.csknives => const CounterStrikeScreen(),
      // SavingsType.cto => const MonnWip(),
      // SavingsType.lifeInsurance => const MonnWip(),
      SavingsType.pea => const PeaScreen(),
      SavingsType.reit => const ReitScreen(),
      // SavingsType.rip => const MonnWip(),
    };
  }

  ImageProvider<Object> icon() {
    return switch (this) {
      SavingsType.savingsBook => MonnAssets.images.icon.locker.provider(),
      SavingsType.crowdfunding => MonnAssets.images.icon.moneyBag.provider(),
      SavingsType.cryptocurrency => MonnAssets.images.icon.ethCoin.provider(),
      SavingsType.csknives => MonnAssets.images.icon.crown.provider(),
      // SavingsType.cto => MonnAssets.images.icon.bag.provider(),
      // ignore: lines_longer_than_80_chars
      // SavingsType.lifeInsurance => MonnAssets.images.icon.umbrella.provider(),
      SavingsType.pea => MonnAssets.images.icon.bag.provider(),
      SavingsType.reit => MonnAssets.images.icon.folder.provider(),
      // SavingsType.rip => MonnAssets.images.icon.calendar.provider(),
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
