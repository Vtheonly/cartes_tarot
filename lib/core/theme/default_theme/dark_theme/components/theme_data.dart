import 'package:flutter/material.dart';

import '../../../../styles/styles.dart';
import '../../default_theme_colors.dart';

AppBarTheme appBarDarkTheme = AppBarTheme(
  backgroundColor: Black.complete,
  elevation: 0,
  iconTheme: const IconThemeData(color: White.complete),
  titleTextStyle: TextStyle(
    fontSize: FontSizes.s16,
    fontWeight: FontWeight.w500,
    color: White.complete,
  ),
);

ScrollbarThemeData scrollbarThemeData = ScrollbarThemeData(
  trackColor: WidgetStateProperty.all(darkColorScheme.primary),
);

DataTableThemeData dataTableDarkThemeData = DataTableThemeData(
  columnSpacing: 24,
  headingRowColor: WidgetStateProperty.all(Colors.white12),
  decoration: BoxDecoration(
    borderRadius: Corners.lgBorder,
    border: Border.all(color: Colors.white12),
  ),
  dataTextStyle: TextStyle(
    fontSize: FontSizes.s12,
    fontWeight: FontWeight.w500,
    color: White.complete,
  ),
);
