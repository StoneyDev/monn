import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monn/shared/widgets/payout_report.dart';
import 'package:monn/utils/app_colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.simpleCurrency(locale: 'fr');

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Valeur totale',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.lightGray,
                    ),
              ),
              Text(
                currency.format(24000),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.darkGray,
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const SizedBox(height: 20),
              const PayoutReport(),
              // Expanded(
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         Container(),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
