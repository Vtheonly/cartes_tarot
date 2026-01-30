import 'package:flutter/material.dart';

import '../../../../styles/styles.dart';
import '../../default_theme_colors.dart';

AppBarTheme appBarLightTheme = AppBarTheme(
  backgroundColor: White.complete,
  elevation: 0,
  iconTheme: const IconThemeData(color: Black.complete),
  titleTextStyle: TextStyle(
    fontSize: FontSizes.s16,
    fontWeight: FontWeight.w500,
    color: Black.complete,
  ),
);

ScrollbarThemeData scrollbarThemeData = ScrollbarThemeData(
  trackColor: WidgetStateProperty.all(lightColorScheme.primary),
);

DataTableThemeData dataTableLightThemeData = DataTableThemeData(
  columnSpacing: 24,
  headingRowColor: WidgetStateProperty.all(Colors.black12),
  decoration: BoxDecoration(
    borderRadius: Corners.lgBorder,
    border: Border.all(color: Colors.black12),
  ),
  dataTextStyle: TextStyle(
    fontSize: FontSizes.s12,
    fontWeight: FontWeight.w500,
    color: Black.complete,
  ),
);
