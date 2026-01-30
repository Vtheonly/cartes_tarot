import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_themes.dart';

abstract class OSChrome {
  Future<void> init();
  Future<void> setNavigationBarColor(bool isDark,
      {ThemeData? lightTheme, ThemeData? darkTheme});

  SystemUiOverlayStyle createSystemUiOverlayStyle(BuildContext context);
}

class OSChromeImpl implements OSChrome {
  const OSChromeImpl();

  @override
  Future<void> init() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    //SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //  systemNavigationBarColor: Colors.transparent));
    //await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
    //  overlays: [SystemUiOverlay.top]);
  }

  @override
  Future<void> setNavigationBarColor(bool isDark,
      {ThemeData? lightTheme, ThemeData? darkTheme}) async {
    lightTheme ??= defaultLightTheme;
    darkTheme ??= defaultDarkTheme;

    await Future.delayed(const Duration(milliseconds: 100));

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: isDark
            ? darkTheme.colorScheme.surface
            : lightTheme.colorScheme.surface));
  }

  @override
  SystemUiOverlayStyle createSystemUiOverlayStyle(BuildContext context) {
    return SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).colorScheme.surface);
  }
}
