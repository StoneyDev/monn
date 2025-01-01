import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_switch_controller.g.dart';

@riverpod
class ThemeSwitchController extends _$ThemeSwitchController {
  late SharedPreferencesWithCache _prefsCache;

  @override
  Future<ThemeMode> build() async {
    _prefsCache = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: <String>{'theme'},
      ),
    );

    final theme = _prefsCache.getString('theme');
    final themeMode = switch (theme) {
      'dark' => ThemeMode.dark,
      'light' => ThemeMode.light,
      _ => ThemeMode.system,
    };

    return themeMode;
  }

  void toggle(ThemeMode theme) {
    state = AsyncData(theme);
    _prefsCache.setString('theme', theme.name);
  }
}

class ThemeSwitchControllerMock extends _$ThemeSwitchController
    with Mock
    implements ThemeSwitchController {
  @override
  Future<ThemeMode> build() => Future.value(ThemeMode.dark);
}
