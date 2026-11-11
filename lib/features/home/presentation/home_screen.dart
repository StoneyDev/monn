import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/dashboard/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:monn/features/expenses/presentation/expenses_screen/expenses_screen.dart';
import 'package:monn/features/freelance/presentation/freelance_screen/freelance_screen.dart';
import 'package:monn/generated/locale_keys.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          DashboardScreen(),
          FreelanceScreen(),
          ExpensesScreen(),
        ],
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        minimum: const EdgeInsets.fromLTRB(20, 0, 20, 12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(
                  alpha: colorScheme.brightness == Brightness.dark ? .3 : .08,
                ),
                blurRadius: 24,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() => _selectedIndex = index);
              },
              backgroundColor: colorScheme.surfaceContainer,
              surfaceTintColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              elevation: 0,
              height: 60,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              labelTextStyle: WidgetStateProperty.resolveWith((states) {
                final selected = states.contains(WidgetState.selected);
                return Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: selected
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                );
              }),
              destinations: [
                NavigationDestination(
                  icon: iconoir.Wallet(color: colorScheme.onSurfaceVariant),
                  selectedIcon: iconoir.WalletSolid(color: colorScheme.primary),
                  label: context.tr(LocaleKeys.home_savings),
                ),
                NavigationDestination(
                  icon: iconoir.Suitcase(color: colorScheme.onSurfaceVariant),
                  selectedIcon: CustomPaint(
                    size: const Size.square(24),
                    painter: _FilledNavigationIcon(
                      color: colorScheme.primary,
                      detailColor: colorScheme.surfaceContainer,
                      isReport: false,
                    ),
                  ),
                  label: context.tr(LocaleKeys.home_freelance),
                ),
                NavigationDestination(
                  icon: iconoir.StatsReport(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  selectedIcon: CustomPaint(
                    size: const Size.square(24),
                    painter: _FilledNavigationIcon(
                      color: colorScheme.primary,
                      detailColor: colorScheme.surfaceContainer,
                      isReport: true,
                    ),
                  ),
                  label: context.tr(LocaleKeys.home_expenses),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Iconoir has no solid Suitcase or StatsReport; keep their original geometry.
class _FilledNavigationIcon extends CustomPainter {
  const _FilledNavigationIcon({
    required this.color,
    required this.detailColor,
    required this.isReport,
  });

  final Color color;
  final Color detailColor;
  final bool isReport;

  @override
  void paint(Canvas canvas, Size size) {
    canvas
      ..save()
      ..scale(size.width / 24, size.height / 24);
    final fill = Paint()..color = color;
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    if (isReport) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          const Rect.fromLTRB(2.25, 2.25, 21.75, 21.75),
          const Radius.circular(1.35),
        ),
        fill,
      );
      stroke.color = detailColor;
      canvas
        ..drawLine(const Offset(6, 6), const Offset(9, 6), stroke)
        ..drawLine(const Offset(6, 9), const Offset(10, 9), stroke)
        ..drawCircle(const Offset(15.5, 8.5), 2.5, stroke)
        ..drawPath(
          Path()
            ..moveTo(6, 13)
            ..lineTo(11, 17)
            ..lineTo(13.5, 15)
            ..lineTo(18, 18),
          stroke,
        );
    } else {
      canvas
        ..drawRRect(
          RRect.fromRectAndRadius(
            const Rect.fromLTRB(8, 3, 16, 9),
            const Radius.circular(.6),
          ),
          stroke,
        )
        ..drawRRect(
          RRect.fromRectAndRadius(
            const Rect.fromLTRB(1.25, 6.25, 22.75, 21.75),
            const Radius.circular(2.75),
          ),
          fill,
        );
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_FilledNavigationIcon oldDelegate) =>
      color != oldDelegate.color ||
      detailColor != oldDelegate.detailColor ||
      isReport != oldDelegate.isReport;
}
