import 'package:flutter/material.dart' show ThemeMode;
import '../styles/themes.dart';
import 'default_theme/default_theme.dart';

final appThemes = {
  Theme.defaullt: defaultTheme,
};

final defaultLightTheme = appThemes[Theme.defaullt]![ThemeMode.light]!;
final defaultDarkTheme = appThemes[Theme.defaullt]![ThemeMode.dark]!;
