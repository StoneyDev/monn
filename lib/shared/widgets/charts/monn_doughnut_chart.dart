import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/widgets/charts/chart.dart';
import 'package:monn/utils/app_colors.dart';

class MonnDoughnutChart extends StatelessWidget {
  const MonnDoughnutChart({
    required this.chart,
    this.onTap,
    this.onLongPress,
    super.key,
  });

  final Chart chart;
  final void Function()? onTap;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    final emptyColor = context.isDarkTheme
        ? AppColors.gray300
        : AppColors.white600;

    final displayChart = chart.data.isEmpty
        ? Chart(
            totalAmount: chart.totalAmount,
            data: [ChartData(portion: 100, color: emptyColor)],
          )
        : chart;

    return GestureDetector(
      onLongPress: onLongPress,
      onTap: onTap,
      child: CustomPaint(
        size: const Size.square(200),
        painter: _DonutPainter(
          textColor: Theme.of(context).colorScheme.primary,
          chart: displayChart,
        ),
      ),
    );
  }
}

class _DonutPainter extends CustomPainter {
  const _DonutPainter({
    required this.textColor,
    required this.chart,
  });

  final Color textColor;
  final Chart chart;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const gradiansToRadians = 3.6 * (pi / 180);
    const padding = 3.6;
    const paddingAngle = gradiansToRadians * padding;
    var startAngle = -2 + (paddingAngle / 2);

    for (final donut in chart.data) {
      final radians = (donut.portion - padding) * gradiansToRadians;
      final path = Path()..addArc(Offset.zero & size, startAngle, radians);

      startAngle += radians + paddingAngle;

      canvas.drawPath(
        path,
        Paint()
          ..color = donut.color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 16
          ..strokeCap = StrokeCap.round,
      );
    }

    final textPainter = TextPainter(
      text: TextSpan(
        text: chart.totalAmount.simpleCurrency('en'),
        style: TextStyle(
          fontFamily: 'DMSans',
          fontWeight: FontWeight.bold,
          color: textColor,
          fontSize: 24,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout();

    final offset = Offset(
      center.dx - textPainter.width / 2,
      center.dy - textPainter.height / 2,
    );

    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(_) => false;
}
