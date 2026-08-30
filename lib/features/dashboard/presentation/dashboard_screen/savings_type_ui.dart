import 'package:flutter/material.dart';
import 'package:monn/features/cash/presentation/cash_screen/cash_screen.dart';
import 'package:monn/features/counter_strike/presentation/counter_strike_screen/counter_strike_screen.dart';
import 'package:monn/features/crowdfunding/presentation/crowdfunding_screen/crowdfunding_screen.dart';
import 'package:monn/features/cryptocurrency/presentation/cryptocurrency_screen/cryptocurrency_screen.dart';
import 'package:monn/features/life_insurance/presentation/life_insurance_screen/life_insurance_screen.dart';
import 'package:monn/features/pea/presentation/pea_screen/pea_screen.dart';
import 'package:monn/features/per/presentation/per_screen/per_screen.dart';
import 'package:monn/features/reit/presentation/reit_screen/reit_screen.dart';
import 'package:monn/features/savings_book/presentation/savings_book_screen/savings_book_screen.dart';
import 'package:monn/shared/domain/savings.dart';
import 'package:monn/utils/assets.gen.dart';

extension SavingsTypeUI on SavingsType {
  Widget route() => switch (this) {
    SavingsType.savingsBook => const SavingsBookScreen(),
    SavingsType.crowdfunding => const CrowdfundingScreen(),
    SavingsType.cryptocurrency => const CryptocurrencyScreen(),
    SavingsType.csKnives => const CounterStrikeScreen(),
    SavingsType.cash => const CashScreen(),
    SavingsType.lifeInsurance => const LifeInsuranceScreen(),
    SavingsType.pea => const PeaScreen(),
    SavingsType.per => const PerScreen(),
    SavingsType.reit => const ReitScreen(),
  };

  ImageProvider<Object> icon() => switch (this) {
    SavingsType.savingsBook => MonnAssets.images.icon.locker.provider(),
    SavingsType.crowdfunding => MonnAssets.images.icon.moneyBag.provider(),
    SavingsType.cryptocurrency => MonnAssets.images.icon.ethCoin.provider(),
    SavingsType.csKnives => MonnAssets.images.icon.crown.provider(),
    SavingsType.cash => MonnAssets.images.icon.money.provider(),
    SavingsType.lifeInsurance => MonnAssets.images.icon.umbrella.provider(),
    SavingsType.pea => MonnAssets.images.icon.bag.provider(),
    SavingsType.per => MonnAssets.images.icon.calendar.provider(),
    SavingsType.reit => MonnAssets.images.icon.folder.provider(),
  };
}
