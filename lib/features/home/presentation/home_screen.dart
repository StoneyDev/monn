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
        minimum: const .fromLTRB(20, 0, 20, 12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: .circular(30),
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
            borderRadius: .circular(30),
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
                  fontWeight: selected ? .w700 : .w500,
                );
              }),
              destinations: [
                NavigationDestination(
                  icon: iconoir.Wallet(color: colorScheme.onSurfaceVariant),
                  selectedIcon: iconoir.WalletSolid(color: colorScheme.primary),
                  label: context.tr(LocaleKeys.home_savings),
                ),
                NavigationDestination(
                  icon: iconoir.Cash(color: colorScheme.onSurfaceVariant),
                  selectedIcon: iconoir.CashSolid(color: colorScheme.primary),
                  label: context.tr(LocaleKeys.home_freelance),
                ),
                NavigationDestination(
                  icon: iconoir.StatsDownSquare(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  selectedIcon: iconoir.StatsDownSquareSolid(
                    color: colorScheme.primary,
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
