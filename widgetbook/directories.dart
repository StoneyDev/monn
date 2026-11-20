import 'package:flutter/material.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/cryptocurrency/presentation/cryptocurrency_ui.dart';
import 'package:monn/shared/widgets/charts/chart.dart';
import 'package:monn/shared/widgets/charts/monn_doughnut_chart.dart';
import 'package:monn/shared/widgets/fields/monn_field_date.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/fields/monn_field_text.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';
import 'package:monn/shared/widgets/monn_card.dart';
import 'package:monn/shared/widgets/monn_error.dart';
import 'package:monn/shared/widgets/monn_financial_info.dart';
import 'package:monn/shared/widgets/monn_line.dart';
import 'package:monn/shared/widgets/monn_tile.dart';
import 'package:monn/shared/widgets/monn_up_down.dart';
import 'package:monn/shared/widgets/payout_report.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:widgetbook/widgetbook.dart';

/// Every use case listed here also gets a golden test in light and dark mode
/// (see `test/widgetbook/widgetbook_golden_test.dart`).
final directories = <WidgetbookNode>[
  WidgetbookComponent(
    name: 'MonnAppBar',
    useCases: [
      WidgetbookUseCase.child(
        name: 'Title',
        child: const MonnAppBar(title: 'PEA'),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'MonnButton',
    useCases: [
      WidgetbookUseCase.child(
        name: 'Enabled',
        child: MonnButton(text: 'Valider', onPressed: () {}),
      ),
      WidgetbookUseCase.child(
        name: 'Disabled',
        child: const MonnButton(text: 'Valider'),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'MonnCard',
    useCases: [
      WidgetbookUseCase.child(
        name: 'Default',
        child: const MonnCard(child: Text('Contenu de la carte')),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'MonnDoughnutChart',
    useCases: [
      WidgetbookUseCase.child(
        name: 'With data',
        child: const MonnDoughnutChart(
          chart: Chart(
            totalAmount: 48250,
            data: [
              ChartData(portion: 45, color: AppColors.btc),
              ChartData(portion: 30, color: AppColors.eth),
              ChartData(portion: 25, color: AppColors.usdt),
            ],
          ),
        ),
      ),
      WidgetbookUseCase.child(
        name: 'Empty',
        child: const MonnDoughnutChart(chart: Chart(totalAmount: 0, data: [])),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'MonnError',
    useCases: [
      WidgetbookUseCase.child(
        name: 'Default',
        child: const MonnError(message: 'Impossible de charger les données.'),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'MonnFieldDate',
    useCases: [
      WidgetbookUseCase.child(
        name: 'Filled',
        child: MonnFieldDate(
          label: 'Date',
          initialValue: DateTime(2026, 11, 14),
          onChanged: (_) {},
        ),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'MonnFieldNumber',
    useCases: [
      WidgetbookUseCase.child(
        name: 'Empty',
        child: const MonnFieldNumber<double>(label: 'Montant', suffix: '€'),
      ),
      WidgetbookUseCase.child(
        name: 'Filled',
        child: const MonnFieldNumber<double>(
          label: 'Montant',
          initialValue: '1250.50',
          suffix: '€',
        ),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'MonnFieldText',
    useCases: [
      WidgetbookUseCase.child(
        name: 'Filled',
        child: const MonnFieldText(label: 'Nom', initialValue: 'Livret A'),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'MonnFinancialInfo',
    useCases: [
      WidgetbookUseCase.child(
        name: 'Amount',
        child: const MonnFinancialInfo(title: 'Total versé', data: 15000.0),
      ),
      WidgetbookUseCase.child(
        name: 'Text',
        child: const MonnFinancialInfo(title: 'ISIN', data: 'FR0011550185'),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'MonnLine',
    useCases: [
      WidgetbookUseCase.child(
        name: 'Default',
        child: const MonnLine(
          title: 'ISIN',
          value: Text('FR0011550185', textAlign: .right),
        ),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'MonnTile',
    useCases: [
      WidgetbookUseCase.child(
        name: 'Default',
        child: MonnTile(
          icon: Image(image: CryptoType.bitcoin.logo(), height: 40, width: 40),
          content: Text(
            CryptoType.bitcoin.label,
            style: TextStyle(
              fontWeight: .w900,
              color: CryptoType.bitcoin.color,
            ),
          ),
          subContent: const Text(r'$84,250.00'),
          trailing: const Text('0.05 BTC', textAlign: .right),
          subTrailing: const Text(r'$4,212.50'),
        ),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'MonnUpDown',
    useCases: [
      WidgetbookUseCase.child(
        name: 'Positive',
        child: const MonnUpDown(value: 120),
      ),
      WidgetbookUseCase.child(
        name: 'Negative',
        child: const MonnUpDown(value: -50),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'PayoutReport',
    useCases: [
      WidgetbookUseCase.child(
        name: 'Default',
        child: const PayoutReport(netProfit: 1250.5, tax: 375.15, loss: 80),
      ),
    ],
  ),
];
