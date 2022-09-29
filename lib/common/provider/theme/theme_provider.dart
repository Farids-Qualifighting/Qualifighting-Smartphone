import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qualifighting_mobile/common/provider/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String sharedThemeMode = 'shared_theme_mode';

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeMode>((ref) {
  final sharedPref = ref.watch(sharedPrefProvider);
  final sharedMode = sharedPref.getString(sharedThemeMode);

  final themeMode = sharedMode == ThemeMode.light.name
      ? ThemeMode.light
      : sharedMode == ThemeMode.dark.name
          ? ThemeMode.dark
          : ThemeMode.system;

  return ThemeProvider(themeMode, sharedPreferences: sharedPref);
});

class ThemeProvider extends StateNotifier<ThemeMode> {
  ThemeProvider(super.state, {required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  void changeThemeMode(ThemeMode mode) {
    sharedPreferences.setString(sharedThemeMode, mode.name);
    state = mode;
  }
}
