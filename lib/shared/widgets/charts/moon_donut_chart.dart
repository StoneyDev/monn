import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/widgets/charts/chart.dart';
import 'package:monn/utils/app_colors.dart';

class MoonDonutChart extends StatelessWidget {
  const MoonDonutChart({
    required this.chart,
    super.key,
  });

  final Chart chart;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          size: Size.square(constraints.maxWidth / 2),
          painter: _DonutPainter(
            context: context,
            chart: chart,
          ),
        );
      },
    );
  }
}

class _DonutPainter extends CustomPainter {
  const _DonutPainter({
    required this.context,
    required this.chart,
  });

  final BuildContext context;
  final Chart chart;

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 20.0;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final total = chart.data.fold<double>(0, (sum, val) => sum + val.portion);
    final center = Offset(size.width / 2, size.height / 2);
    final arcRect = Rect.fromCircle(
      center: center,
      radius: (size.width / 2) - strokeWidth / 2,
    );
    var startAngle = -pi / 2;

    for (final segment in chart.data) {
      final sweepAngle = (segment.portion / total) * 2 * pi;

      paint.color = segment.color;
      canvas.drawArc(arcRect, startAngle, sweepAngle, false, paint);

      startAngle += sweepAngle;
    }

    final textPainter = TextPainter(
      text: TextSpan(
        text: chart.totalAmount.simpleCurrency(context),
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.darkGray,
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
