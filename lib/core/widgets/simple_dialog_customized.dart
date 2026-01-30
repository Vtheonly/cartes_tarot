import 'package:flutter/material.dart';

import '../styles/insets.dart';

class SimpleDialogCust extends StatelessWidget {
  final String? title;
  final Widget body;
  const SimpleDialogCust({required this.body, this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: title != null
          ? Text(
              title!.toUpperCase(),
              style: const TextStyle(
                letterSpacing: 0.5,
                fontSize: 13.0,
              ),
            )
          : null,
      titlePadding: EdgeInsets.all(Insets.lg),
      insetPadding: EdgeInsets.symmetric(
        vertical: Insets.xxl,
        horizontal: Insets.lg,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      children: [body],
    );
  }
}
