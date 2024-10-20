import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/crowdfunding/presentation/crowdfunding_screen/crowdfunding_screen.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/presentation/cryptocurrency_screen/cryptocurrency_screen.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/reit/presentation/reit_screen/reit_screen.dart';

extension SavingsTypeUI on SavingsType {
  PayoutReportData? getReport(WidgetRef ref) {
    return switch (this) {
      SavingsType.booklet => null,
      SavingsType.crowdfunding =>
        ref.watch(watchPayoutReportCrowdfundingProvider).valueOrNull,
      SavingsType.cryptocurrency =>
        ref.watch(watchPayoutReportCryptoProvider).valueOrNull,
      SavingsType.csknives => null,
      SavingsType.cto => null,
      SavingsType.lifeInsurance => null,
      SavingsType.pea => null,
      SavingsType.reit => ref.watch(watchPayoutReportReitProvider).valueOrNull,
      SavingsType.rip => null,
    };
  }

  Widget route() {
    return switch (this) {
      SavingsType.booklet => const Placeholder(),
      SavingsType.crowdfunding => const CrowdfundingScreen(),
      SavingsType.cryptocurrency => const CryptocurrencyScreen(),
      SavingsType.csknives => const Placeholder(),
      SavingsType.cto => const Placeholder(),
      SavingsType.lifeInsurance => const Placeholder(),
      SavingsType.pea => const Placeholder(),
      SavingsType.reit => const ReitScreen(),
      SavingsType.rip => const Placeholder(),
    };
  }
}
