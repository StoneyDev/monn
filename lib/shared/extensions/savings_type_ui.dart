import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/crowdfunding/presentation/crowdfunding_screen/crowdfunding_screen.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/features/dashboard/domain/savings.dart';

extension SavingsTypeUI on SavingsType {
  PayoutReportData? getReport(WidgetRef ref) {
    return switch (this) {
      SavingsType.bookletA => null,
      SavingsType.bookletSSD => null,
      SavingsType.crowdfunding =>
        ref.watch(watchPayoutReportCrowdfundingProvider).valueOrNull,
      SavingsType.cryptocurrency => null,
      SavingsType.csknives => null,
      SavingsType.cto => null,
      SavingsType.lifeInsurance => null,
      SavingsType.pea => null,
      SavingsType.reit => null,
      SavingsType.rip => null,
    };
  }

  Widget route() {
    return switch (this) {
      SavingsType.bookletA => const Placeholder(),
      SavingsType.bookletSSD => const Placeholder(),
      SavingsType.crowdfunding => const CrowdfundingScreen(),
      SavingsType.cryptocurrency => const Placeholder(),
      SavingsType.csknives => const Placeholder(),
      SavingsType.cto => const Placeholder(),
      SavingsType.lifeInsurance => const Placeholder(),
      SavingsType.pea => const Placeholder(),
      SavingsType.reit => const Placeholder(),
      SavingsType.rip => const Placeholder(),
    };
  }
}
