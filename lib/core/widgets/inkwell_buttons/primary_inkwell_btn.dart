import 'package:flutter/material.dart';

import 'inkwell_btn.dart';

class PrimaryInkWellBtn extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const PrimaryInkWellBtn({required this.child, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWellBtn(
      backgroundColor: Theme.of(context).colorScheme.surface,
      borderColor: Colors.transparent,
      onPressed: onPressed,
      child: child,
    );
  }
}
