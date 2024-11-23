import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/crowdfunding/presentation/crowdfunding_screen/crowdfunding_screen.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/presentation/cryptocurrency_screen/cryptocurrency_screen.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/features/pea/presentation/pea_screen/pea_screen.dart';
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/reit/presentation/reit_screen/reit_screen.dart';
import 'package:monn/features/savings_book/data/savings_book_repository.dart';
import 'package:monn/features/savings_book/presentation/savings_book_screen/savings_book_screen.dart';

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
      SavingsType.csknives => 0,
      SavingsType.cto => 0,
      SavingsType.lifeInsurance => 0,
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
      SavingsType.rip => 0,
    };
  }

  Widget route() {
    return switch (this) {
      SavingsType.savingsBook => const SavingsBookScreen(),
      SavingsType.crowdfunding => const CrowdfundingScreen(),
      SavingsType.cryptocurrency => const CryptocurrencyScreen(),
      SavingsType.csknives => const Placeholder(),
      SavingsType.cto => const Placeholder(),
      SavingsType.lifeInsurance => const Placeholder(),
      SavingsType.pea => const PeaScreen(),
      SavingsType.reit => const ReitScreen(),
      SavingsType.rip => const Placeholder(),
    };
  }
}
