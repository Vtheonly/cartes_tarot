import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' as material;

///Its [name] can be "light", "dark" or "system" as default
class ThemeMode extends Equatable {
  ///It can be "light", "dark" or "system" as default
  final String name;

  const ThemeMode({required this.name});

  const ThemeMode.defaullt() : name = "system";
  ThemeMode.from(material.ThemeMode themeMode) : name = themeMode.name;

  bool get isSystem => name.compareTo("system") == 0;

  @override
  List<Object?> get props => [name];
}
