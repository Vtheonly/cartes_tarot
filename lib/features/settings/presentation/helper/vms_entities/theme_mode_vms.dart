import '../../../../../core/model_views/base/mv_n1_m1.dart';
import '../../../domain/entities/theme_mode.dart';
import 'package:flutter/material.dart' as material;

import '../../../../../core/utils/theme_mode_utils.dart';
import '../../../../../injection_container/service_locator.dart';

class ThemeModeVM extends MV<ThemeMode> {
  const ThemeModeVM({required ThemeMode themeMode}) : super(e: themeMode);

  const ThemeModeVM.defaullt() : super(e: const ThemeMode.defaullt());

  ThemeMode get themeMode => e;

  ThemeModeVM1 get vm1 => ThemeModeVM1(e);
}

class ThemeModeVM1 extends MV<ThemeMode> {
  const ThemeModeVM1(ThemeMode e) : super(e: e);

  material.ThemeMode get themeMode =>
      sl<ThemeModeUtils>().themeModeFromName(e.name);

  bool get isDarkMode => sl<ThemeModeUtils>().booleanDarkModeFromName(e.name);

  bool get isSetToSystem => e.isSystem;
}
