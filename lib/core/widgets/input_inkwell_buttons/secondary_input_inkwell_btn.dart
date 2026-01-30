import 'package:flutter/material.dart';

import '../../styles/sizes.dart';
import '../inkwell_buttons/secondary_inkwell_btn.dart';

class SecondaryInputBtn extends StatelessWidget {
  final Widget child;
  final Widget side;
  final VoidCallback? onPressed;
  const SecondaryInputBtn(
      {required this.child, required this.side, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SecondaryInkWellBtn(
      onPressed: onPressed,
      child: Row(
        children: [Expanded(child: child), SizedBox(width: Sizes.med), side],
      ),
    );
  }
}
