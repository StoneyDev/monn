import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monn/features/expenses/domain/budget.dart';
import 'package:monn/features/expenses/domain/expense_category.dart';
import 'package:monn/shared/extensions/budget_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/widgets/monn_card.dart';
import 'package:monn/utils/app_colors.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({required this.budget, super.key});

  final Budget budget;

  @override
  Widget build(BuildContext context) {
    final categories = budget.toCategories(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 12,
        children: [
          for (final category in categories)
            _CategorySection(
              category: category,
              totalExpenses: budget.totalExpenses,
            ),
        ],
      ),
    );
  }
}

class _CategorySection extends StatelessWidget {
  const _CategorySection({
    required this.category,
    required this.totalExpenses,
  });

  final ExpenseCategory category;
  final double totalExpenses;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    final percentage = totalExpenses > 0
        ? (category.total / totalExpenses * 100)
        : 0.0;
    final nonEmptyItems = category.nonEmptyItems;

    return MonnCard(
      child: Column(
        spacing: 16,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: .stretch,
              spacing: 12,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: category.color,
                    borderRadius: .circular(2),
                  ),
                  child: const SizedBox(width: 4),
                ),
                Expanded(
                  child: Text(
                    category.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: .w600,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      category.total.simpleCurrency(locale),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: .w600,
                        color: category.color,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Text(
                        '${percentage.toStringAsFixed(0)}%',
                        textAlign: .end,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: category.color),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (nonEmptyItems.length > 1) ...[
            Divider(
              color: Theme.of(context).colorScheme.outlineVariant,
              height: 0,
            ),
            ...nonEmptyItems.map(
              (item) => _ExpenseLineItem(
                name: item.name,
                amount: item.amount,
                categoryTotal: category.total,
                color: category.color,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ExpenseLineItem extends StatelessWidget {
  const _ExpenseLineItem({
    required this.name,
    required this.amount,
    required this.categoryTotal,
    required this.color,
  });

  final String name;
  final double amount;
  final double categoryTotal;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    final percentage = categoryTotal > 0 ? (amount / categoryTotal * 100) : 0.0;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: .stretch,
        spacing: 12,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.5),
              borderRadius: .circular(2),
            ),
            child: const SizedBox(width: 4),
          ),
          Expanded(
            child: Text(
              name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Text(
            amount.simpleCurrency(locale),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: .w500,
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(
              '${percentage.toStringAsFixed(0)}%',
              textAlign: .end,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.lightGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
