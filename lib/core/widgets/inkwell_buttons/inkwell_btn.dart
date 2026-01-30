import 'package:flutter/material.dart';

import '../../styles/styles.dart' hide Theme;

class InkWellBtn extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Color? borderColor;
  final VoidCallback? onPressed;

  const InkWellBtn({
    required this.child,
    this.backgroundColor,
    this.borderColor,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? () {},
      borderRadius: Corners.lgBorder,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: Insets.lg, vertical: Insets.sm),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          border: Border.all(color: borderColor ?? TextColor.of(context).s10),
          borderRadius: Corners.lgBorder,
        ),
        child: child,
      ),
    );
  }
}
