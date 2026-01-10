import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/dashboard/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:monn/features/expenses/presentation/expenses_screen/expenses_screen.dart';
import 'package:monn/features/freelance/presentation/freelance_screen/freelance_screen.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/utils/app_colors.dart';

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
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          DashboardScreen(),
          FreelanceScreen(),
          ExpensesScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        backgroundColor: colorScheme.surfaceContainerHighest,
        indicatorColor: colorScheme.outline,
        elevation: 0,
        height: 70,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: [
          NavigationDestination(
            icon: const iconoir.Wallet(color: AppColors.lightGray),
            selectedIcon: iconoir.Wallet(color: colorScheme.primary),
            label: context.tr(LocaleKeys.home_savings),
          ),
          NavigationDestination(
            icon: const iconoir.Suitcase(color: AppColors.lightGray),
            selectedIcon: iconoir.Suitcase(color: colorScheme.primary),
            label: context.tr(LocaleKeys.home_freelance),
          ),
          NavigationDestination(
            icon: const iconoir.StatsReport(color: AppColors.lightGray),
            selectedIcon: iconoir.StatsReport(color: colorScheme.primary),
            label: context.tr(LocaleKeys.home_expenses),
          ),
        ],
      ),
    );
  }
}
