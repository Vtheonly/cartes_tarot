import 'package:flutter/material.dart';

import '../../styles/sizes.dart';
import '../inkwell_buttons/primary_inkwell_btn.dart';

class PrimaryInputBtn extends StatelessWidget {
  final Widget child;
  final Widget side;
  final VoidCallback? onPressed;
  const PrimaryInputBtn(
      {required this.child, required this.side, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryInkWellBtn(
      onPressed: onPressed,
      child: Row(
        children: [Expanded(child: child), SizedBox(width: Sizes.med), side],
      ),
    );
  }
}
