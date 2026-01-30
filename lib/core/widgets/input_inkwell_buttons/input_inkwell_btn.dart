import 'package:flutter/material.dart';

import '../../styles/sizes.dart';
import '../inkwell_buttons/inkwell_btn.dart';

class InputInkWellBtn extends StatelessWidget {
  final Widget child;
  final Widget side;
  final Color? backgroundColor;
  final Color? borderColor;
  final VoidCallback? onPressed;

  const InputInkWellBtn({
    required this.child,
    required this.side,
    this.backgroundColor,
    this.borderColor,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellBtn(
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      child: Row(
        children: [Expanded(child: child), SizedBox(width: Sizes.med), side],
      ),
    );
  }
}
