import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/theme_mode_settings/theme_mode_settings_bloc.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  void _switchThemeMode(BuildContext context) =>
      context.read<ThemeModeSettingsBloc>().addPostThemeModeEv();

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: context.watch<ThemeModeSettingsBloc>().state.data.vm1.isDarkMode,
        onChanged: (_) => _switchThemeMode(context));
  }
}
