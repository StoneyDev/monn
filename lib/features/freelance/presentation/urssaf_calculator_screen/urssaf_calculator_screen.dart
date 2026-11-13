import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monn/features/amount/presentation/amount_screen.dart';
import 'package:monn/features/freelance/domain/freelance_calculator.dart';
import 'package:monn/features/freelance/presentation/widgets/revenue_summary.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_scroll_view.dart';

class UrssafCalculatorScreen extends StatefulWidget {
  const UrssafCalculatorScreen({super.key});

  @override
  State<UrssafCalculatorScreen> createState() => _UrssafCalculatorScreenState();
}

class _UrssafCalculatorScreenState extends State<UrssafCalculatorScreen> {
  double _monthlyRevenue = 0;

  void _openAmountScreen() {
    var amount = 0.0;

    unawaited(
      context.push<void>(
        fullscreenDialog: true,
        AmountScreen(
          initialValue: _monthlyRevenue,
          onChanged: (value) => amount = double.tryParse(value) ?? 0,
          onSubmit: () {
            setState(() => _monthlyRevenue = amount);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final urssaf = FreelanceCalculator.calculateUrssaf(_monthlyRevenue);
    final remaining = _monthlyRevenue - urssaf;

    return Scaffold(
      appBar: MonnAppBar(
        title: context.tr(LocaleKeys.freelance_urssaf_calculator),
      ),
      body: MonnScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: RevenueSummary(
              label: context.tr(LocaleKeys.freelance_urssaf_due),
              amount: urssaf,
              highlight: remaining,
              caption: context.tr(LocaleKeys.freelance_monthly_remaining),
              revenueLabel: context.tr(LocaleKeys.freelance_monthly_revenue),
              revenue: _monthlyRevenue,
              remaining: remaining,
              onEdit: _openAmountScreen,
            ),
          ),
        ],
      ),
    );
  }
}
