import 'package:flutter/material.dart';

import 'inkwell_btn.dart';

class TertiaryInkWellBtn extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  const TertiaryInkWellBtn({required this.child, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWellBtn(
      borderColor: Colors.transparent,
      onPressed: onPressed,
      child: child,
    );
  }
}
