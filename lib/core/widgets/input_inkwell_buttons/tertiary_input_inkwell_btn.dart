import 'package:flutter/material.dart';

import '../../styles/sizes.dart';
import '../inkwell_buttons/tertiary_inkwell_btn.dart';

class TertiaryInputBtn extends StatelessWidget {
  final Widget child;
  final Widget side;
  final VoidCallback? onPressed;
  const TertiaryInputBtn(
      {required this.child, required this.side, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return TertiaryInkWellBtn(
      onPressed: onPressed,
      child: Row(
        children: [Expanded(child: child), SizedBox(width: Sizes.med), side],
      ),
    );
  }
}
