import 'package:flutter/material.dart';
import 'package:monn/features/dashboard/presentation/dashboard_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monn',
      theme: ThemeData(
        fontFamily: 'DMSans',
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const DashboardScreen(),
    );
  }
}
