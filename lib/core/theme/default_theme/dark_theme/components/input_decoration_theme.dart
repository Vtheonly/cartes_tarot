import 'package:flutter/material.dart';

import '../../../../styles/styles.dart' hide Theme;
import '../../default_theme_colors.dart';

InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
  fillColor: Grey.dark,
  filled: true,
  hintStyle: TextStyle(color: Grey.complete, fontSize: FontSizes.s14),
  border: outlineInputBorder,
  enabledBorder: outlineInputBorder,
  focusedBorder: focusedOutlineInputBorder,
  errorBorder: errorOutlineInputBorder,
);

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: Corners.lgBorder,
  borderSide: BorderSide(
    color: Colors.transparent,
  ),
);

final OutlineInputBorder focusedOutlineInputBorder = OutlineInputBorder(
  borderRadius: Corners.lgBorder,
  borderSide: BorderSide(color: darkColorScheme.primary),
);

const OutlineInputBorder errorOutlineInputBorder = OutlineInputBorder(
  borderRadius: Corners.lgBorder,
  borderSide: BorderSide(
    color: Colors.red,
  ),
);

OutlineInputBorder secodaryOutlineInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: Corners.lgBorder,
    borderSide: BorderSide(
      color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.15),
    ),
  );
}
