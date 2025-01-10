import 'dart:ui' as ui;

import 'package:flutter/material.dart';

extension ContextUi on BuildContext {
  bool isDarkTheme(ThemeMode? theme) {
    final platformBrightness = MediaQuery.platformBrightnessOf(this);
    final isDark = theme == ThemeMode.dark ||
        (theme == ThemeMode.system && platformBrightness == ui.Brightness.dark);

    return isDark;
  }

  Future<void> push(Widget page) {
    return Navigator.push(
      this,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, __, child) {
          final slideAnimation = Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutExpo,
            ),
          );

          return SlideTransition(
            position: slideAnimation,
            child: child,
          );
        },
      ),
    );
  }
}
