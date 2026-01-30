import 'package:flutter/material.dart';

class TextColor {
  final BuildContext context;
  TextColor.of(this.context);

  bool get _isDark => Theme.of(context).brightness == Brightness.dark;

  Color get complete => _isDark ? White.complete : Black.complete;
  Color get s80 => _isDark ? White.s80 : Black.s80;
  Color get s60 => _isDark ? White.s60 : Black.s60;
  Color get s40 => _isDark ? White.s40 : Black.s40;
  Color get s20 => _isDark ? White.s20 : Black.s20;
  Color get s10 => _isDark ? White.s10 : Black.s10;
  Color get s5 => _isDark ? White.s5 : Black.s5;
}

class BackgroundColor {
  final BuildContext context;
  BackgroundColor.of(this.context);

  bool get _isDark => Theme.of(context).brightness == Brightness.dark;

  Color get complete => _isDark ? White.complete : Black.complete;
  Color get s60 => _isDark ? White.s80 : Black.s60;
  Color get s40 => _isDark ? White.s60 : Black.s40;
  Color get s20 => _isDark ? White.s40 : Black.s20;
  Color get s10 => _isDark ? White.s20 : Black.s10;
  Color get s5 => _isDark ? White.s10 : Black.s5;
  Color get s2 => _isDark ? White.s5 : Black.s2;
}

class Black {
  static const Color complete = Colors.black;
  static final Color s80 = Colors.black.withOpacity(.8); //Color(0xFF45454B);
  static final Color s60 = Colors.black.withOpacity(.6); //Color(0xFF737378);
  static final Color s40 = Colors.black.withOpacity(.4); //Color(0xFFA2A2A5);
  static final Color s20 = Colors.black.withOpacity(.2); //Color(0xFFD0D0D2);
  static final Color s10 = Colors.black.withOpacity(.1); //Color(0xFFE8E8E9);
  static final Color s5 = Colors.black.withOpacity(.05); // Color(0xFFF3F3F4);
  static final Color s2 = Colors.black.withOpacity(.02);
}

class White {
  static const Color complete = Colors.white;
  static final Color s80 = Colors.white.withOpacity(.8); //Color(0xFFCCCCCC);
  static final Color s60 = Colors.white.withOpacity(.6); //Color(0xFF999999);
  static final Color s40 = Colors.white.withOpacity(.4); //Color(0xFF666666);
  static final Color s20 = Colors.white.withOpacity(.2); //Color(0xFF333333);
  static final Color s10 = Colors.white.withOpacity(.1); //Color(0xFF191919);
  static final Color s5 = Colors.white.withOpacity(.05); //Color(0xFF0D0D0D);
  static final Color s2 = Colors.white.withOpacity(.02);
}

class Grey {
  static const Color complete = Colors.grey;
  static const Color normal = Color(0xFFB8B5C3);
  static const Color light = Color(0xFFF8F8F9);
  static const Color dark = Color(0xFF1C1C25);
}

class ExtraColors {
  static final Color warnningColor = Colors.yellow.shade800;
  static const Color tealColor = Colors.teal;
  static final Color greenColor = Colors.green.shade700;
  static const Color redColor = Color.fromARGB(255, 165, 1, 1);
}
