import 'package:flutter/material.dart';
import '../../../styles/styles.dart';
import '../default_theme_colors.dart';
import 'components/checkbox_themedata.dart';
import 'components/theme_data.dart';
import 'components/button_theme.dart';
import 'components/input_decoration_theme.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: lightColorScheme.primary,
  fontFamily: Fonts.plusJakarta,
  useMaterial3: true,
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: White.complete,
  iconTheme: const IconThemeData(color: Black.complete),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Black.s40),
    bodyLarge: const TextStyle(color: Black.complete),
  ),
  elevatedButtonTheme: elevatedButtonThemeData,
  outlinedButtonTheme: outlinedButtonThemeData,
  textButtonTheme: textButtonThemeData,
  inputDecorationTheme: lightInputDecorationTheme,
  checkboxTheme: checkboxThemeData.copyWith(
    side: BorderSide(color: Black.s40),
  ),
  appBarTheme: appBarLightTheme,
  scrollbarTheme: scrollbarThemeData,
  dataTableTheme: dataTableLightThemeData,
  dividerColor: Black.s10,
  navigationBarTheme: NavigationBarThemeData(
    labelTextStyle: WidgetStateProperty.all(
      TextStyle(
        fontSize: FontSizes.s11,
        fontWeight: FontWeight.bold,
        color: Black.complete,
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
