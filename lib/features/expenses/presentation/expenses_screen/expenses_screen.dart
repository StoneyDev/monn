import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/expenses/data/expenses_repository.dart';
import 'package:monn/features/expenses/domain/budget.dart';
import 'package:monn/features/expenses/presentation/edit_budget_screen/edit_budget_screen.dart';
import 'package:monn/features/expenses/presentation/expenses_screen/widgets/expense_category_list.dart';
import 'package:monn/features/expenses/presentation/expenses_screen/widgets/sankey_diagram.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_error.dart';
import 'package:monn/shared/widgets/monn_scroll_view.dart';
import 'package:monn/utils/app_colors.dart';

enum _ViewMode { list, chart }

class ExpensesScreen extends ConsumerStatefulWidget {
  const ExpensesScreen({super.key});

  @override
  ConsumerState<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends ConsumerState<ExpensesScreen> {
  _ViewMode _viewMode = _ViewMode.chart;

  void _toggleViewMode() {
    setState(() {
      _viewMode = switch (_viewMode) {
        _ViewMode.chart => _ViewMode.list,
        _ViewMode.list => _ViewMode.chart,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final budget = ref.watch(watchBudgetProvider);

    return Scaffold(
      appBar: MonnAppBar(
        title: context.tr(LocaleKeys.expenses_budget),
        actions: [
          IconButton(
            icon: switch (_viewMode) {
              _ViewMode.chart => const iconoir.List(),
              _ViewMode.list => const iconoir.GraphUp(),
            },
            onPressed: _toggleViewMode,
          ),
          IconButton(
            icon: const iconoir.EditPencil(),
            onPressed: () => context.push(const EditBudgetScreen()),
          ),
        ],
      ),
      body: switch (budget) {
        AsyncData(:final value) =>
          value != null
              ? _BudgetContent(budget: value, viewMode: _viewMode)
              : const _EmptyBudget(),
        AsyncError(:final error) => Padding(
          padding: const .all(16),
          child: MonnError(message: error.toString()),
        ),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}

class _EmptyBudget extends StatelessWidget {
  const _EmptyBudget();

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: .center,
      spacing: 8,
      children: [
        const iconoir.Wallet(
          height: 64,
          width: 64,
          color: AppColors.lightGray,
        ),
        Text(
          context.tr(LocaleKeys.expenses_no_data),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.lightGray,
          ),
        ),
      ],
    ),
  );
}

class _BudgetContent extends StatelessWidget {
  const _BudgetContent({required this.budget, required this.viewMode});

  final Budget budget;
  final _ViewMode viewMode;

  @override
  Widget build(BuildContext context) {
    if (budget.freelanceIncome == 0) {
      return const _EmptyBudget();
    }

    final locale = context.locale.toString();

    final header = Column(
      spacing: 8,
      children: [
        Text(
          budget.totalExpenses.simpleCurrency(locale),
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: .w900,
          ),
        ),
        Text(
          // ignore: lines_longer_than_80_chars
          '${context.tr(LocaleKeys.expenses_to_invest)} ${budget.balance.simpleCurrency(locale)}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.lightGray,
            fontWeight: .w600,
          ),
        ),
      ],
    );

    return switch (viewMode) {
      _ViewMode.list => MonnScrollView(
        slivers: [
          SliverToBoxAdapter(child: header),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(child: ExpenseCategoryList(budget: budget)),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
      _ViewMode.chart => Column(
        children: [
          header,
          Expanded(
            child: FractionallySizedBox(
              heightFactor: 0.8,
              child: SankeyDiagram(budget: budget),
            ),
          ),
        ],
      ),
    };
  }
}
