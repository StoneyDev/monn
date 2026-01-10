import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:monn/features/expenses/domain/budget.dart';
import 'package:monn/features/expenses/domain/expense_category.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/budget_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/utils/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Design constants
// ─────────────────────────────────────────────────────────────────────────────

const _kBlockWidth = 14.0;
const _kGap = 8.0;
const _kMinBlockHeight = 18.0;
const _kBorderRadius = 4.0;
const _kIncomeBarWidth = 10.0;
const _kLabelPadding = 12.0;

// Opacity values
const _kBlockOpacity = 0.95;
const _kFlowOpacity = 0.35;
const _kIncomeOpacity = 0.85;


class SankeyDiagram extends StatelessWidget {
  const SankeyDiagram({required this.budget, super.key});

  final Budget budget;

  @override
  Widget build(BuildContext context) {
    final categories = budget.toCategories(context);
    final totalIncome = budget.freelanceIncome;

    if (categories.isEmpty || totalIncome <= 0) {
      return const SizedBox.shrink();
    }

    return RepaintBoundary(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final layout = _SankeyLayout(width: constraints.maxWidth);
          final positions = _calculatePositions(
            categories: categories,
            totalExpenses: budget.totalExpenses,
            height: constraints.maxHeight,
          );

          return CustomPaint(
            painter: _SankeyPainter(
              layout: layout,
              positions: positions,
            ),
            child: _SankeyLabels(
              layout: layout,
              positions: positions,
              totalIncome: totalIncome,
            ),
          );
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Position models
// ─────────────────────────────────────────────────────────────────────────────

sealed class _NodePosition {
  const _NodePosition({required this.top, required this.bottom});

  final double top;
  final double bottom;

  double get height => bottom - top;
  double get center => (top + bottom) / 2;

  Color get color;
}

class _CategoryPosition extends _NodePosition {
  const _CategoryPosition({
    required this.category,
    required super.top,
    required super.bottom,
  });

  final ExpenseCategory category;

  @override
  Color get color => category.color;
}

class _SubItemPosition extends _NodePosition {
  const _SubItemPosition({
    required this.category,
    required this.item,
    required super.top,
    required super.bottom,
  });

  final ExpenseCategory category;
  final ExpenseCategoryItem item;

  @override
  Color get color => category.color;
}

class _SankeyPositions {
  const _SankeyPositions({
    required this.categories,
    required this.subItems,
  });

  final List<_CategoryPosition> categories;
  final List<_SubItemPosition> subItems;

  double get incomeTop => categories.isNotEmpty ? categories.first.top : 0;
  double get incomeBottom =>
      categories.isNotEmpty ? categories.last.bottom : 0;
  double get incomeHeight => incomeBottom - incomeTop;

  double get totalExpenses =>
      categories.fold<double>(0, (sum, p) => sum + p.category.total);
}

// ─────────────────────────────────────────────────────────────────────────────
// Position calculation
// ─────────────────────────────────────────────────────────────────────────────

_SankeyPositions _calculatePositions({
  required List<ExpenseCategory> categories,
  required double totalExpenses,
  required double height,
}) {
  final allSubItems =
      categories.expand((c) => c.nonEmptyItems.map((i) => (c, i))).toList();

  // Calculate gaps
  final catGapsTotal = _kGap * (categories.length - 1);
  final subGapsTotal = _kGap * (allSubItems.length - 1);

  // Calculate proportional heights
  final catProportionalHeights = categories
      .map((c) => (height - catGapsTotal) * c.total / totalExpenses)
      .toList();
  final subProportionalHeights = allSubItems
      .map((item) => (height - subGapsTotal) * item.$2.amount / totalExpenses)
      .toList();

  // Apply minBlockHeight
  final catActualHeights = catProportionalHeights
      .map((h) => math.max(_kMinBlockHeight, h))
      .toList();
  final subActualHeights = subProportionalHeights
      .map((h) => math.max(_kMinBlockHeight, h))
      .toList();

  final catTotalHeight =
      catActualHeights.fold<double>(0, (a, b) => a + b) + catGapsTotal;
  final subTotalHeight =
      subActualHeights.fold<double>(0, (a, b) => a + b) + subGapsTotal;

  // Scale if needed
  final maxNeededHeight = math.max(catTotalHeight, subTotalHeight);
  final scale = maxNeededHeight > height ? height / maxNeededHeight : 1.0;

  // Center vertically
  final scaledCatHeight = catTotalHeight * scale;
  final scaledSubHeight = subTotalHeight * scale;
  final maxScaledHeight = math.max(scaledCatHeight, scaledSubHeight);
  final verticalOffset = (height - maxScaledHeight) / 2;

  // Build category positions
  final catOffset = verticalOffset + (maxScaledHeight - scaledCatHeight) / 2;
  final categoryPositions = <_CategoryPosition>[];
  var catY = catOffset;

  for (var i = 0; i < categories.length; i++) {
    final catHeight = catActualHeights[i] * scale;
    categoryPositions.add(
      _CategoryPosition(
        category: categories[i],
        top: catY,
        bottom: catY + catHeight,
      ),
    );
    catY += catHeight + _kGap * scale;
  }

  // Build sub-item positions
  final subOffset = verticalOffset + (maxScaledHeight - scaledSubHeight) / 2;
  final subPositions = <_SubItemPosition>[];
  var subY = subOffset;

  for (var i = 0; i < allSubItems.length; i++) {
    final (category, item) = allSubItems[i];
    final subHeight = subActualHeights[i] * scale;
    subPositions.add(
      _SubItemPosition(
        category: category,
        item: item,
        top: subY,
        bottom: subY + subHeight,
      ),
    );
    subY += subHeight + _kGap * scale;
  }

  return _SankeyPositions(
    categories: categoryPositions,
    subItems: subPositions,
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// Layout
// ─────────────────────────────────────────────────────────────────────────────

class _SankeyLayout {
  _SankeyLayout({required double width}) {
    const margin = 8.0;
    final usable = width - margin * 2;

    // Proportions for each zone
    const incomeP = 0.18;
    const flow1P = 0.06;
    const catP = 0.20;
    const flow2P = 0.08;

    incomeBlockRight = margin + usable * incomeP;
    catBlockX = incomeBlockRight + usable * flow1P;
    catLabelX = catBlockX + _kBlockWidth + _kLabelPadding;
    subBlockX = catBlockX + usable * catP + usable * flow2P;
    subLabelX = subBlockX + _kBlockWidth + _kLabelPadding;
  }

  late final double incomeBlockRight;
  late final double catBlockX;
  late final double catLabelX;
  late final double subBlockX;
  late final double subLabelX;
}

// ─────────────────────────────────────────────────────────────────────────────
// Labels widget
// ─────────────────────────────────────────────────────────────────────────────

class _SankeyLabels extends StatelessWidget {
  const _SankeyLabels({
    required this.layout,
    required this.positions,
    required this.totalIncome,
  });

  final _SankeyLayout layout;
  final _SankeyPositions positions;
  final double totalIncome;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    final theme = Theme.of(context);

    final incomeLabelStyle = theme.textTheme.labelLarge?.copyWith(
      fontWeight: FontWeight.w700,
      color: AppColors.lightGray,
      height: 1.3,
    );

    final categoryLabelStyle = theme.textTheme.labelLarge?.copyWith(
      fontWeight: FontWeight.w700,
    );

    final subItemLabelStyle = theme.textTheme.labelMedium?.copyWith(
      fontWeight: FontWeight.w600,
    );

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Income label
        Positioned(
          left: 0,
          top: positions.incomeTop,
          height: positions.incomeHeight,
          width: layout.incomeBlockRight - _kLabelPadding - _kIncomeBarWidth,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${context.tr(LocaleKeys.expenses_income)}\n'
              '${totalIncome.simpleCurrency(locale)}',
              style: incomeLabelStyle,
              textAlign: TextAlign.right,
            ),
          ),
        ),
        // Category labels
        for (final pos in positions.categories)
          Positioned(
            left: layout.catLabelX,
            top: pos.top,
            height: pos.height,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                pos.category.name,
                style: categoryLabelStyle?.copyWith(
                  color: pos.color,
                ),
              ),
            ),
          ),
        // Sub-item labels
        for (final pos in positions.subItems)
          Positioned(
            left: layout.subLabelX,
            top: pos.top,
            height: pos.height,
            right: 4,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${pos.item.name} ${pos.item.amount.simpleCurrency(locale)}',
                style: subItemLabelStyle?.copyWith(
                  color: pos.color,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Custom painter
// ─────────────────────────────────────────────────────────────────────────────

class _SankeyPainter extends CustomPainter {
  _SankeyPainter({
    required this.layout,
    required this.positions,
  });

  final _SankeyLayout layout;
  final _SankeyPositions positions;

  @override
  void paint(Canvas canvas, Size size) {
    if (positions.categories.isEmpty) return;

    // Draw flows first (behind blocks)
    _drawFlowsToCategories(canvas);
    _drawFlowsToSubItems(canvas);

    // Draw blocks on top
    _drawIncomeBlock(canvas);
    _drawCategoryBlocks(canvas);
    _drawSubItemBlocks(canvas);
  }

  void _drawIncomeBlock(Canvas canvas) {
    _drawBlock(
      canvas,
      x: layout.incomeBlockRight - _kIncomeBarWidth,
      top: positions.incomeTop,
      width: _kIncomeBarWidth,
      height: positions.incomeHeight,
      color: AppColors.lightGray.withValues(alpha: _kIncomeOpacity),
    );
  }

  void _drawCategoryBlocks(Canvas canvas) {
    for (final pos in positions.categories) {
      _drawBlock(
        canvas,
        x: layout.catBlockX,
        top: pos.top,
        width: _kBlockWidth,
        height: pos.height,
        color: pos.color.withValues(alpha: _kBlockOpacity),
      );
    }
  }

  void _drawSubItemBlocks(Canvas canvas) {
    for (final pos in positions.subItems) {
      _drawBlock(
        canvas,
        x: layout.subBlockX,
        top: pos.top,
        width: _kBlockWidth,
        height: pos.height,
        color: pos.color.withValues(alpha: _kBlockOpacity),
      );
    }
  }

  void _drawFlowsToCategories(Canvas canvas) {
    var incomeY = positions.incomeTop;

    for (final pos in positions.categories) {
      final ratio = pos.category.total / positions.totalExpenses;
      final incomeSliceHeight = positions.incomeHeight * ratio;

      // Flows extend slightly under the blocks for clean visual transition
      _drawGradientFlow(
        canvas,
        startX: layout.incomeBlockRight - _kBorderRadius,
        startTop: incomeY,
        startBottom: incomeY + incomeSliceHeight,
        endX: layout.catBlockX + _kBorderRadius,
        endTop: pos.top,
        endBottom: pos.bottom,
        startColor: pos.color.withValues(alpha: 0.3),
        endColor: pos.color.withValues(alpha: 0.5),
      );

      incomeY += incomeSliceHeight;
    }
  }

  void _drawFlowsToSubItems(Canvas canvas) {
    for (final catPos in positions.categories) {
      final catSubItems = positions.subItems
          .where((s) => s.category.name == catPos.category.name)
          .toList();

      if (catSubItems.isEmpty) continue;

      var catY = catPos.top;
      final catTotal =
          catSubItems.fold<double>(0, (sum, s) => sum + s.item.amount);

      for (final subPos in catSubItems) {
        final ratio = subPos.item.amount / catTotal;
        final catSliceHeight = catPos.height * ratio;

        // Flows extend slightly under the blocks for clean visual transition
        _drawGradientFlow(
          canvas,
          startX: layout.catBlockX + _kBlockWidth - _kBorderRadius,
          startTop: catY,
          startBottom: catY + catSliceHeight,
          endX: layout.subBlockX + _kBorderRadius,
          endTop: subPos.top,
          endBottom: subPos.bottom,
          startColor: catPos.color.withValues(alpha: _kFlowOpacity),
          endColor: subPos.color.withValues(alpha: _kFlowOpacity * 0.8),
        );

        catY += catSliceHeight;
      }
    }
  }

  void _drawBlock(
    Canvas canvas, {
    required double x,
    required double top,
    required double width,
    required double height,
    required Color color,
  }) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(x, top, width, height),
        const Radius.circular(_kBorderRadius),
      ),
      Paint()..color = color,
    );
  }

  void _drawGradientFlow(
    Canvas canvas, {
    required double startX,
    required double startTop,
    required double startBottom,
    required double endX,
    required double endTop,
    required double endBottom,
    required Color startColor,
    required Color endColor,
  }) {
    final dx = endX - startX;

    // Smoother curves with adjusted control points
    final cp1x = startX + dx * 0.4;
    final cp2x = endX - dx * 0.4;

    // Vertical interpolation for more natural flow
    final cp1yTop = startTop + (endTop - startTop) * 0.15;
    final cp1yBottom = startBottom + (endBottom - startBottom) * 0.15;
    final cp2yTop = endTop - (endTop - startTop) * 0.15;
    final cp2yBottom = endBottom - (endBottom - startBottom) * 0.15;

    final path = Path()
      ..moveTo(startX, startTop)
      ..cubicTo(cp1x, cp1yTop, cp2x, cp2yTop, endX, endTop)
      ..lineTo(endX, endBottom)
      ..cubicTo(cp2x, cp2yBottom, cp1x, cp1yBottom, startX, startBottom)
      ..close();

    final gradient = ui.Gradient.linear(
      Offset(startX, 0),
      Offset(endX, 0),
      [startColor, endColor],
    );

    canvas.drawPath(
      path,
      Paint()
        ..shader = gradient
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant _SankeyPainter oldDelegate) =>
      !listEquals(positions.categories, oldDelegate.positions.categories) ||
      !listEquals(positions.subItems, oldDelegate.positions.subItems);
}
