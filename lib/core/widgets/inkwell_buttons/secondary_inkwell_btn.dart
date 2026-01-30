import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import 'inkwell_btn.dart';

class SecondaryInkWellBtn extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  const SecondaryInkWellBtn({required this.child, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWellBtn(
      borderColor: TextColor.of(context).s5,
      onPressed: onPressed,
      child: child,
    );
  }
}
