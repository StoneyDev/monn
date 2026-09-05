import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_category.freezed.dart';

@freezed
abstract class ExpenseCategory with _$ExpenseCategory {
  const factory ExpenseCategory({
    required String name,
    required double total,
    required Color color,
    required List<ExpenseCategoryItem> items,
  }) = _ExpenseCategory;

  const ExpenseCategory._();

  List<ExpenseCategoryItem> get nonEmptyItems =>
      items.where((i) => i.amount > 0).toList();
}

@freezed
abstract class ExpenseCategoryItem with _$ExpenseCategoryItem {
  const factory ExpenseCategoryItem({
    required String name,
    required double amount,
  }) = _ExpenseCategoryItem;
}
