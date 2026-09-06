import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:monn/features/expenses/domain/budget_extension.dart';
import 'package:monn/features/expenses/presentation/budget_ui.dart';
import 'package:monn/features/expenses/presentation/models/expense_category.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/utils/app_colors.dart';

const _kBlockWidth = 7.0;
const _kGap = 4.0;
const _kCategoryGap = 6.0;
const _kSourceGap = 1.5;
const _kMinBlockHeight = 18.0;
const _kProportionalHeight = 230.0;
const _kBorderRadius = 3.0;
const _kIncomeBarWidth = 6.0;
const _kLabelPadding = 4.0;

const _kFlowOpacity = 0.40;
const _kIncomeOpacity = 0.85;

class SankeyDiagram extends StatelessWidget {
  const SankeyDiagram({required this.budget, super.key});

  final BudgetEntry budget;

  @override
  Widget build(BuildContext context) {
    final categories = budget
        .toCategories(context)
        .where((category) => category.total > 0)
        .toList();
    final totalIncome = budget.freelanceIncome;

    if (categories.isEmpty || totalIncome <= 0) {
      return const SizedBox.shrink();
    }

    return RepaintBoundary(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final layout = _SankeyLayout(width: constraints.maxWidth);
          final labelStyle = Theme.of(context).textTheme.labelMedium!.copyWith(
            fontSize: 11.5,
            height: 1.13,
            letterSpacing: 0,
            fontWeight: FontWeight.w500,
          );
          final textScaler = MediaQuery.textScalerOf(context);
          final locale = context.locale.toString();
          final pixelsPerAmount = _kProportionalHeight / budget.totalExpenses;
          final textPainter = TextPainter(
            textDirection: Directionality.of(context),
            textScaler: textScaler,
          );
          final itemHeights = <ExpenseCategoryItem, double>{};
          for (final item in categories.expand((c) => c.nonEmptyItems)) {
            textPainter
              ..text = TextSpan(
                text: item.amount.simpleCurrency(locale),
                style: labelStyle.copyWith(fontWeight: FontWeight.w600),
              )
              ..layout();
            final amountWidth = math.min(
              textPainter.width,
              layout.amountMaxWidth,
            );
            textPainter
              ..text = TextSpan(text: item.name, style: labelStyle)
              ..layout(
                maxWidth: math.max(
                  1,
                  constraints.maxWidth - layout.subLabelX - amountWidth - 13,
                ),
              );
            itemHeights[item] = math.max(
              math.max(textScaler.scale(_kMinBlockHeight), textPainter.height),
              item.amount * pixelsPerAmount,
            );
          }
          textPainter.dispose();
          var positions = _calculatePositions(
            categories: categories,
            itemHeights: itemHeights,
          );

          if (constraints.hasBoundedHeight &&
              positions.height < constraints.maxHeight * 0.92) {
            final extraHeight = constraints.maxHeight * 0.92 - positions.height;
            itemHeights.updateAll(
              (item, height) =>
                  height + extraHeight * item.amount / budget.totalExpenses,
            );
            positions = _calculatePositions(
              categories: categories,
              itemHeights: itemHeights,
            );
          }

          return SingleChildScrollView(
            child: SizedBox(
              height: positions.height,
              child: CustomPaint(
                painter: _SankeyPainter(
                  layout: layout,
                  positions: positions,
                ),
                child: _SankeyLabels(
                  layout: layout,
                  positions: positions,
                  totalIncome: totalIncome,
                  labelStyle: labelStyle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

sealed class _NodePosition {
  const _NodePosition({required this.top, required this.bottom});

  final double top;
  final double bottom;

  double get height => bottom - top;

  Color get color;
}

class _CategoryPosition extends _NodePosition {
  const _CategoryPosition({
    required this.category,
    required this.incomeOffset,
    required super.top,
    required super.bottom,
  });

  final ExpenseCategory category;
  final double incomeOffset;

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

  double get incomeTop =>
      (categories.first.top + categories.last.bottom - incomeHeight) / 2;
  double get incomeHeight =>
      categories.last.incomeOffset + categories.last.height;
  double get height =>
      math.max(subItems.last.bottom, categories.last.bottom) + 12;
}

_SankeyPositions _calculatePositions({
  required List<ExpenseCategory> categories,
  required Map<ExpenseCategoryItem, double> itemHeights,
}) {
  final categoryPositions = <_CategoryPosition>[];
  final subPositions = <_SubItemPosition>[];
  var subY = 12.0;
  var packedIncomeY = 0.0;

  for (final category in categories) {
    var categoryHeight = 0.0;
    final categoryStart = subY;

    for (final item in category.nonEmptyItems) {
      // Use the same visible thickness throughout each ribbon, including
      // the minimum height that keeps small expenses legible.
      final itemHeight = itemHeights[item]!;
      subPositions.add(
        _SubItemPosition(
          category: category,
          item: item,
          top: subY,
          bottom: subY + itemHeight,
        ),
      );
      categoryHeight += itemHeight + _kSourceGap;
      subY += itemHeight + _kGap;
    }

    categoryHeight -= _kSourceGap;
    // Center each source on its leaves, with a small vertical shift so the
    // tightly packed ribbons keep a gentle curve.
    final categoryTop =
        categoryStart +
        (subY - _kGap - categoryStart - categoryHeight) / 2 +
        10;
    categoryPositions.add(
      _CategoryPosition(
        category: category,
        incomeOffset: packedIncomeY,
        top: categoryTop,
        bottom: categoryTop + categoryHeight,
      ),
    );
    packedIncomeY += categoryHeight;
    subY += _kCategoryGap - _kGap;
  }

  return _SankeyPositions(
    categories: categoryPositions,
    subItems: subPositions,
  );
}

class _SankeyLayout {
  const _SankeyLayout({required this.width});

  final double width;

  double get incomeBlockRight => 30;
  double get catBlockX => width * 0.26;
  double get catLabelX => catBlockX + _kBlockWidth + _kLabelPadding;
  double get subBlockX => width * 0.61;
  double get subLabelX => subBlockX + _kBlockWidth + 5;
  double get amountMaxWidth => math.max(0, (width - subLabelX - 13) / 2);
}

class _SankeyLabels extends StatelessWidget {
  const _SankeyLabels({
    required this.layout,
    required this.positions,
    required this.totalIncome,
    required this.labelStyle,
  });

  final _SankeyLayout layout;
  final _SankeyPositions positions;
  final double totalIncome;
  final TextStyle labelStyle;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    final incomeLabelStyle = labelStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.lightGray,
      height: 1.3,
    );

    final categoryLabelHeight = MediaQuery.textScalerOf(context).scale(20);
    final categoryLabelStyle = labelStyle.copyWith(
      fontWeight: FontWeight.w700,
    );

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 0,
          top: positions.incomeTop,
          height: positions.incomeHeight,
          width: layout.incomeBlockRight - _kLabelPadding - _kIncomeBarWidth,
          child: Align(
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                '${context.tr(LocaleKeys.expenses_income)} · '
                '${totalIncome.simpleCurrency(locale)}',
                style: incomeLabelStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        for (final pos in positions.categories)
          Positioned(
            left: layout.catLabelX,
            width: layout.subBlockX - layout.catLabelX - _kLabelPadding,
            top: (pos.top + pos.bottom - categoryLabelHeight) / 2,
            height: categoryLabelHeight,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                pos.category.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: categoryLabelStyle.copyWith(
                  color: pos.color,
                ),
              ),
            ),
          ),
        for (final pos in positions.subItems)
          Positioned(
            left: layout.subLabelX,
            top: pos.top,
            height: pos.height,
            right: 9,
            child: Align(
              alignment: Alignment.centerLeft,
              child: DefaultTextStyle(
                style: labelStyle.copyWith(color: pos.color),
                child: Row(
                  spacing: 4,
                  children: [
                    Expanded(
                      child: Text(pos.item.name),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: layout.amountMaxWidth,
                      ),
                      child: Text(
                        pos.item.amount.simpleCurrency(locale),
                        maxLines: 1,
                        overflow: .ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

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

    _drawFlowsToCategories(canvas);
    _drawFlowsToSubItems(canvas);

    _drawBlock(
      canvas,
      x: layout.incomeBlockRight - _kIncomeBarWidth,
      top: positions.incomeTop,
      width: _kIncomeBarWidth,
      height: positions.incomeHeight,
      color: AppColors.lightGray.withValues(alpha: _kIncomeOpacity),
    );
    _drawBlocks(canvas, positions.categories, x: layout.catBlockX);
    _drawBlocks(canvas, positions.subItems, x: layout.subBlockX);
  }

  void _drawBlocks(
    Canvas canvas,
    List<_NodePosition> nodes, {
    required double x,
  }) {
    for (final pos in nodes) {
      _drawBlock(
        canvas,
        x: x,
        top: pos.top,
        width: _kBlockWidth,
        height: pos.height,
        color: pos.color,
      );
    }
  }

  void _drawFlowsToCategories(Canvas canvas) {
    for (final pos in positions.categories) {
      // Flows extend slightly under the blocks for clean visual transition
      _drawGradientFlow(
        canvas,
        startX: layout.incomeBlockRight - 2,
        startTop: positions.incomeTop + pos.incomeOffset,
        startBottom: positions.incomeTop + pos.incomeOffset + pos.height,
        endX: layout.catBlockX + _kBorderRadius,
        endTop: pos.top,
        endBottom: pos.bottom,
        color: pos.color,
      );
    }
  }

  void _drawFlowsToSubItems(Canvas canvas) {
    for (final catPos in positions.categories) {
      final catSubItems = positions.subItems.where(
        (s) => s.category == catPos.category,
      );

      var catY = catPos.top;
      for (final subPos in catSubItems) {
        // Flows extend slightly under the blocks for clean visual transition
        _drawGradientFlow(
          canvas,
          startX: layout.catBlockX + _kBlockWidth - _kBorderRadius,
          startTop: catY,
          startBottom: catY + subPos.height,
          endX: layout.subBlockX + _kBorderRadius,
          endTop: subPos.top,
          endBottom: subPos.bottom,
          color: subPos.color,
        );

        catY += subPos.height + _kSourceGap;
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
    required Color color,
  }) {
    // Horizontal tangents keep both ends flush with their vertical nodes.
    final controlOffset = (endX - startX) * 0.36;
    final path = Path()
      ..moveTo(startX, startTop)
      ..cubicTo(
        startX + controlOffset,
        startTop,
        endX - controlOffset,
        endTop,
        endX,
        endTop,
      )
      ..lineTo(endX, endBottom)
      ..cubicTo(
        endX - controlOffset,
        endBottom,
        startX + controlOffset,
        startBottom,
        startX,
        startBottom,
      )
      ..close();

    final gradient = ui.Gradient.linear(
      Offset(startX, 0),
      Offset(endX, 0),
      [color.withValues(alpha: _kFlowOpacity), color.withValues(alpha: 0.25)],
    );

    canvas.drawPath(
      path,
      Paint()..shader = gradient,
    );
  }

  @override
  bool shouldRepaint(covariant _SankeyPainter oldDelegate) =>
      !listEquals(positions.categories, oldDelegate.positions.categories) ||
      !listEquals(positions.subItems, oldDelegate.positions.subItems);
}
