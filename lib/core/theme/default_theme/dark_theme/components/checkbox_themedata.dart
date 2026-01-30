import 'package:flutter/material.dart';

import '../../../../styles/styles.dart';
import '../../default_theme_colors.dart';

CheckboxThemeData checkboxThemeData = CheckboxThemeData(
  fillColor: WidgetStateProperty.all(darkColorScheme.primary),
  shape: const RoundedRectangleBorder(
    borderRadius: Corners.smBorder,
  ),
  side: BorderSide(color: White.s20),
);
