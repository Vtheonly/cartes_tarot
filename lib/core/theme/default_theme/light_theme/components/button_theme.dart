import 'package:flutter/material.dart';

import '../../../../styles/styles.dart';
import '../../default_theme_colors.dart';

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.all(Insets.sm),
    backgroundColor: lightColorScheme.primary,
    minimumSize: Size(double.infinity, Sizes.xxl),
    shape: const RoundedRectangleBorder(
      borderRadius: Corners.lgBorder,
    ),
  ),
);

TextButtonThemeData textButtonThemeData = TextButtonThemeData(
  style: TextButton.styleFrom(foregroundColor: lightColorScheme.primary),
);

OutlinedButtonThemeData outlinedButtonThemeData = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor: lightColorScheme.primary,
    padding: EdgeInsets.all(Insets.lg),
    minimumSize: Size(double.infinity, Sizes.xxl),
    side: BorderSide(width: 1.5, color: Black.s5),
    shape: const RoundedRectangleBorder(
      borderRadius: Corners.lgBorder,
    ),
  ),
);
