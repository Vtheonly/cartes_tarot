import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../default_theme_colors.dart';
import 'components/button_theme.dart';
import 'components/checkbox_themedata.dart';
import 'components/input_decoration_theme.dart';
import 'components/theme_data.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: darkColorScheme.primary,
  fontFamily: Fonts.plusJakarta,
  useMaterial3: true,
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: Black.complete,
  iconTheme: const IconThemeData(color: White.complete),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: White.s40),
    bodyLarge: const TextStyle(color: White.complete),
  ),
  elevatedButtonTheme: elevatedButtonThemeData,
  outlinedButtonTheme: outlinedButtonThemeData,
  textButtonTheme: textButtonThemeData,
  inputDecorationTheme: darkInputDecorationTheme,
  checkboxTheme: checkboxThemeData.copyWith(
    side: BorderSide(color: White.s40),
  ),
  appBarTheme: appBarDarkTheme,
  scrollbarTheme: scrollbarThemeData,
  dataTableTheme: dataTableDarkThemeData,
  dividerColor: White.s10,
  navigationBarTheme: NavigationBarThemeData(
    labelTextStyle: WidgetStateProperty.all(
      TextStyle(
        fontSize: FontSizes.s11,
        fontWeight: FontWeight.bold,
        color: White.complete,
      ),
    ),
    iconTheme: WidgetStateProperty.all(
      IconThemeData(
        color: Grey.normal,
        size: IconSizes.med,
      ),
    ),
  ),
);
