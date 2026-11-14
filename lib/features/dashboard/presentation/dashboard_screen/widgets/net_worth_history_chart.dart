import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/dashboard/data/net_worth_history_repository.dart';
import 'package:monn/features/dashboard/presentation/dashboard_screen/controllers/net_worth_provider.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/widgets/monn_error.dart';

class NetWorthHistoryChart extends ConsumerStatefulWidget {
  const NetWorthHistoryChart({required this.selection, super.key});

  final ValueNotifier<NetWorthSnapshot?> selection;

  @override
  ConsumerState<NetWorthHistoryChart> createState() =>
      _NetWorthHistoryChartState();
}

class _NetWorthHistoryChartState extends ConsumerState<NetWorthHistoryChart> {
  static const _periods = [30, 90, 365, 0];

  int _days = 30;

  void _select(NetWorthSnapshot? snapshot) {
    if (widget.selection.value?.day != snapshot?.day) {
      widget.selection.value = snapshot;
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = ref.watch(watchTotalNetWorthProvider);
    final history = ref.watch(watchNetWorthHistoryProvider);
    final recording = ref.watch(recordNetWorthSnapshotProvider);
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;
    final locale = context.locale.toString();
    final now = DateTime.now();
    final cutoff = DateTime(now.year, now.month, now.day - _days);
    final snapshots = history.value ?? const <NetWorthSnapshot>[];
    final firstInRange = _days == 0
        ? 0
        : snapshots.indexWhere((point) => !point.day.isBefore(cutoff));
    final start = firstInRange < 0 ? snapshots.length : firstInRange;
    // Snapshots are only taken when the app is opened, so the last one before
    // the range is carried forward to its start as the baseline.
    final points = [
      if (start > 0 &&
          (start == snapshots.length || snapshots[start].day.isAfter(cutoff)))
        snapshots[start - 1].copyWith(day: cutoff),
      ...snapshots.skip(start),
    ];
    String formatDay(DateTime day) =>
        (day.year == now.year
                ? DateFormat.MMMd(locale)
                : DateFormat.yMMMd(locale))
            .format(day);
    final error = total.error ?? recording.error;

    return ValueListenableBuilder(
      valueListenable: widget.selection,
      builder: (context, selection, _) {
        final selectedIndex = selection == null
            ? -1
            : points.indexWhere((point) => point.day == selection.day);
        final selected = selectedIndex < 0 ? null : points[selectedIndex];
        final last = points.isEmpty ? null : points.last;
        final end = selected ?? last;
        final delta = points.length < 2 || end == null
            ? null
            : end.total - points.first.total;
        final percent = delta == null || points.first.total == 0
            ? null
            : delta / points.first.total.abs() * 100;
        final positive = (delta ?? 0) >= 0;
        final formattedPercent = percent?.toDecimal(locale: locale, digit: 1);
        final percentageLabel = formattedPercent == null
            ? ''
            : ' (${positive ? '+' : ''}$formattedPercent %)';
        final trendColor = positive
            ? context.positiveColor
            : context.negativeColor;

        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    if (error != null && selected == null)
                      MonnError(message: error.toString())
                    else if (!total.hasValue && selected == null)
                      LinearProgressIndicator(color: theme.colorScheme.primary),
                    if (delta != null)
                      Wrap(
                        spacing: 8,
                        runSpacing: 6,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 9,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: trendColor.withValues(alpha: .10),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '${positive ? '+' : ''}'
                              '${delta.simpleCurrency(locale)}'
                              '$percentageLabel',
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: trendColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            context.tr(
                              LocaleKeys.history_since,
                              args: [formatDay(points.first.day)],
                            ),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: .5,
                              ),
                            ),
                          ),
                        ],
                      )
                    else if (history.hasValue)
                      Text(
                        points.isEmpty
                            ? context.tr(LocaleKeys.history_empty)
                            : context.tr(
                                LocaleKeys.history_first_point,
                                args: [formatDay(points.first.day)],
                              ),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: .5,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (history.hasError)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    spacing: 8,
                    children: [
                      Text(context.tr(LocaleKeys.history_unavailable)),
                      TextButton(
                        onPressed: () =>
                            ref.invalidate(watchNetWorthHistoryProvider),
                        child: Text(context.tr(LocaleKeys.button_retry)),
                      ),
                    ],
                  ),
                )
              else if (history.isLoading && !history.hasValue)
                const SizedBox(
                  height: 200,
                  child: Center(child: CircularProgressIndicator()),
                )
              else
                Column(
                  spacing: 8,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          void select(double x) {
                            if (points.length < 2) return;
                            final fraction = (x / (constraints.maxWidth - 8))
                                .clamp(0.0, 1.0);
                            final start =
                                points.first.day.millisecondsSinceEpoch;
                            final duration =
                                points.last.day.millisecondsSinceEpoch - start;
                            final target = start + duration * fraction;
                            final nearest = points.reduce(
                              (a, b) =>
                                  (a.day.millisecondsSinceEpoch - target)
                                          .abs() <=
                                      (b.day.millisecondsSinceEpoch - target)
                                          .abs()
                                  ? a
                                  : b,
                            );
                            _select(nearest);
                          }

                          final activeIndex = selectedIndex < 0
                              ? points.length - 1
                              : selectedIndex;
                          final previous = activeIndex > 0
                              ? points[activeIndex - 1]
                              : null;
                          final next = activeIndex < points.length - 1
                              ? points[activeIndex + 1]
                              : null;
                          final dayFormat = DateFormat.yMMMd(locale);
                          String? describe(NetWorthSnapshot? point) =>
                              point == null
                              ? null
                              : '${dayFormat.format(point.day)}, '
                                    '${point.total.simpleCurrency(locale)}';

                          return Semantics(
                            label: context.tr(LocaleKeys.history_title),
                            value: describe(end),
                            increasedValue: describe(next),
                            decreasedValue: describe(previous),
                            onIncrease: next == null
                                ? null
                                : () => _select(next),
                            onDecrease: previous == null
                                ? null
                                : () => _select(previous),
                            onDidLoseAccessibilityFocus: () => _select(null),
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTapDown: (details) =>
                                  select(details.localPosition.dx),
                              onTapUp: (_) => _select(null),
                              onTapCancel: () => _select(null),
                              onHorizontalDragStart: (details) =>
                                  select(details.localPosition.dx),
                              onHorizontalDragUpdate: (details) =>
                                  select(details.localPosition.dx),
                              onHorizontalDragEnd: (_) => _select(null),
                              onHorizontalDragCancel: () => _select(null),
                              child: SizedBox(
                                height: 180,
                                width: double.infinity,
                                child: CustomPaint(
                                  painter: _HistoryPainter(
                                    points: points,
                                    selectedIndex: selectedIndex,
                                    dark: dark,
                                    accent: theme.colorScheme.primary,
                                    surface: theme.colorScheme.surface,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    if (points.length > 1)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (final point in [points.first, points.last])
                              Text(
                                DateFormat.yMMMd(locale).format(point.day),
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.onSurface.withValues(
                                    alpha: .4,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: AnimatedAlign(
                          alignment: Alignment(
                            -1 + _periods.indexOf(_days) * 2 / 3,
                            0,
                          ),
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.fastEaseInToSlowEaseOut,
                          child: FractionallySizedBox(
                            widthFactor: 1 / _periods.length,
                            heightFactor: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: DecoratedBox(
                                decoration: ShapeDecoration(
                                  color:
                                      theme.colorScheme.surfaceContainerHighest,
                                  shape: const StadiumBorder(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          for (final days in _periods)
                            Expanded(
                              child: Semantics(
                                selected: _days == days,
                                child: TextButton(
                                  onPressed: () {
                                    _select(null);
                                    setState(() => _days = days);
                                  },
                                  style: TextButton.styleFrom(
                                    minimumSize: const Size(0, 44),
                                    padding: EdgeInsets.zero,
                                    foregroundColor: _days == days
                                        ? theme.colorScheme.onSurface
                                        : theme.colorScheme.onSurfaceVariant,
                                    overlayColor: Colors.transparent,
                                    shape: const StadiumBorder(),
                                  ),
                                  child: Text(
                                    context.tr(switch (days) {
                                      30 => LocaleKeys.history_month,
                                      90 => LocaleKeys.history_quarter,
                                      365 => LocaleKeys.history_year,
                                      _ => LocaleKeys.history_all,
                                    }),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HistoryPainter extends CustomPainter {
  const _HistoryPainter({
    required this.points,
    required this.selectedIndex,
    required this.dark,
    required this.accent,
    required this.surface,
  });

  final List<NetWorthSnapshot> points;
  final int selectedIndex;
  final bool dark;
  final Color accent;
  final Color surface;

  @override
  void paint(Canvas canvas, Size size) {
    final area = Rect.fromLTRB(0, 16, size.width - 8, size.height - 12);
    final grid = Paint()
      ..color = (dark ? Colors.white : Colors.black).withValues(alpha: .045);
    for (var i = 0; i < 3; i++) {
      final y = area.top + area.height * (i + 1) / 4;
      canvas.drawLine(Offset(area.left, y), Offset(area.right, y), grid);
    }
    if (points.isEmpty) return;
    if (points.length == 1) return _drawMarker(canvas, area.center);
    final minimum = points.map((p) => p.total).reduce(math.min);
    final maximum = points.map((p) => p.total).reduce(math.max);
    final spread = maximum - minimum;
    final padding = spread == 0
        ? math.max(maximum.abs() * .02, 1)
        : spread * .16;
    final bottom = minimum - padding;
    final range = spread + padding * 2;
    final start = points.first.day.millisecondsSinceEpoch;
    final duration = points.last.day.millisecondsSinceEpoch - start;
    final offsets = [
      for (final point in points)
        Offset(
          area.left +
              (point.day.millisecondsSinceEpoch - start) /
                  duration *
                  area.width,
          area.bottom - (point.total - bottom) / range * area.height,
        ),
    ];
    final line = Path()..moveTo(offsets.first.dx, offsets.first.dy);
    // Midpoint control points soften the line without overshooting balances.
    for (var i = 1; i < offsets.length; i++) {
      final previous = offsets[i - 1];
      final current = offsets[i];
      final middle = (previous.dx + current.dx) / 2;
      line.cubicTo(
        middle,
        previous.dy,
        middle,
        current.dy,
        current.dx,
        current.dy,
      );
    }
    final fill = Path.from(line)
      ..lineTo(area.right, area.bottom)
      ..lineTo(area.left, area.bottom)
      ..close();
    canvas
      ..drawPath(
        fill,
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              accent.withValues(alpha: dark ? .12 : .08),
              accent.withValues(alpha: .035),
              accent.withValues(alpha: 0),
            ],
            stops: const [0, .7, 1],
          ).createShader(area),
      )
      ..drawPath(
        line,
        Paint()
          ..shader = LinearGradient(
            colors: [
              accent.withValues(alpha: .7),
              accent,
              Color.lerp(accent, Colors.white, .2)!,
            ],
          ).createShader(area)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..strokeCap = StrokeCap.round,
      );
    final active = selectedIndex < 0 ? offsets.last : offsets[selectedIndex];
    if (selectedIndex >= 0) {
      canvas.drawLine(
        Offset(active.dx, area.top),
        Offset(active.dx, area.bottom),
        Paint()
          ..color = accent.withValues(alpha: .3)
          ..strokeWidth = 1,
      );
    }
    _drawMarker(canvas, active);
  }

  void _drawMarker(Canvas canvas, Offset center) {
    canvas
      ..drawCircle(center, 10, Paint()..color = accent.withValues(alpha: .12))
      ..drawCircle(center, 5, Paint()..color = surface)
      ..drawCircle(center, 3, Paint()..color = accent);
  }

  @override
  bool shouldRepaint(_HistoryPainter oldDelegate) =>
      oldDelegate.points != points ||
      oldDelegate.selectedIndex != selectedIndex ||
      oldDelegate.dark != dark ||
      oldDelegate.accent != accent ||
      oldDelegate.surface != surface;
}
