import 'package:flutter/material.dart';

import '../../../../core/language/en_lang.dart';
import '../widgets/theme_switch.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(EnLang.settings),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(EnLang.switchMode),
            ThemeSwitch(),
          ],
        ),
      ),
    );
  }
}
