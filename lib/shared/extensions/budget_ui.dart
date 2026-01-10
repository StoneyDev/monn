import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monn/features/expenses/domain/budget.dart';
import 'package:monn/features/expenses/domain/expense_category.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/utils/app_colors.dart';

extension BudgetToCategories on Budget {
  List<ExpenseCategory> toCategories(BuildContext context) => [
    ExpenseCategory(
      name: context.tr(LocaleKeys.expenses_housing),
      total: totalHousing,
      color: AppColors.blue,
      items: [
        ExpenseCategoryItem(
          name: context.tr(LocaleKeys.expenses_rent),
          amount: rent,
        ),
        ExpenseCategoryItem(
          name: context.tr(LocaleKeys.expenses_electricity),
          amount: electricity,
        ),
        ExpenseCategoryItem(
          name: context.tr(LocaleKeys.expenses_water),
          amount: water,
        ),
        ExpenseCategoryItem(
          name: context.tr(LocaleKeys.expenses_internet),
          amount: internet,
        ),
        ExpenseCategoryItem(
          name: context.tr(LocaleKeys.expenses_gas),
          amount: gas,
        ),
        ExpenseCategoryItem(
          name: context.tr(LocaleKeys.expenses_home_insurance),
          amount: homeInsurance,
        ),
      ],
    ),
    ExpenseCategory(
      name: context.tr(LocaleKeys.expenses_transport),
      total: totalTransport,
      color: AppColors.btc,
      items: [
        ExpenseCategoryItem(
          name: context.tr(LocaleKeys.expenses_public_transport),
          amount: publicTransport,
        ),
      ],
    ),
    ExpenseCategory(
      name: context.tr(LocaleKeys.expenses_food),
      total: totalFood,
      color: AppColors.green,
      items: [
        ExpenseCategoryItem(
          name: context.tr(LocaleKeys.expenses_groceries),
          amount: groceries,
        ),
        ExpenseCategoryItem(
          name: context.tr(LocaleKeys.expenses_restaurants),
          amount: restaurants,
        ),
      ],
    ),
    ExpenseCategory(
      name: context.tr(LocaleKeys.expenses_health),
      total: totalHealth,
      color: AppColors.red,
      items: [
        ExpenseCategoryItem(
          name: context.tr(LocaleKeys.expenses_health_insurance),
          amount: healthInsurance,
        ),
      ],
    ),
    ExpenseCategory(
      name: context.tr(LocaleKeys.expenses_subscriptions),
      total: totalSubscriptions,
      color: AppColors.link,
      items: [
        ExpenseCategoryItem(
          name: context.tr(LocaleKeys.expenses_phone),
          amount: phone,
        ),
        ExpenseCategoryItem(
          name: context.tr(LocaleKeys.expenses_ai),
          amount: ai,
        ),
      ],
    ),
  ];
}
