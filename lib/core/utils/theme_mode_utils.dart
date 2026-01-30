import 'package:flutter/material.dart';

abstract class ThemeModeUtils {
  Brightness get paltformBrightness;
  ThemeMode get systemThemeMode;
  ThemeMode themeModeFromName(String name);
  bool booleanDarkModeFromName(String name);
  ThemeMode themeModeFromBooleanDarkMode(bool isDark);
  ThemeMode inverseThemeMode(ThemeMode themeMode);
}

class ThemeModeUtilsImpl implements ThemeModeUtils {
  const ThemeModeUtilsImpl();

  @override
  Brightness get paltformBrightness =>
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  @override
  ThemeMode get systemThemeMode =>
      paltformBrightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;

  @override
  ThemeMode themeModeFromName(String name) => ThemeMode.values.firstWhere(
        (e) => e.name == name,
        orElse: () => ThemeMode.system,
      );

  @override
  bool booleanDarkModeFromName(String name) {
    switch (name) {
      case "light":
        return false;
      case "dark":
        return true;
      default:
        return paltformBrightness == Brightness.dark;
    }
  }

  @override
  ThemeMode themeModeFromBooleanDarkMode(bool isDark) =>
      isDark ? ThemeMode.dark : ThemeMode.light;

  @override
  ThemeMode inverseThemeMode(ThemeMode themeMode) =>
      themeModeFromBooleanDarkMode(!booleanDarkModeFromName(themeMode.name));
}
