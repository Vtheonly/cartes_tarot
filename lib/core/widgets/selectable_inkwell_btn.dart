import 'package:flutter/material.dart';

import '../styles/styles.dart' hide Theme;

class SelectableInkWellBtn extends StatelessWidget {
  final Widget child;
  final bool isActive;
  final Color? backgroundColor;
  final Color? borderColor;
  final VoidCallback onPressed;

  const SelectableInkWellBtn(
      {required this.child,
      required this.isActive,
      this.backgroundColor,
      this.borderColor,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: Corners.lgBorder,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: Insets.lg, vertical: Insets.sm),
        decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).colorScheme.primary
              : backgroundColor ?? Colors.transparent,
          border: Border.all(
              color: isActive
                  ? Colors.transparent
                  : borderColor ?? TextColor.of(context).s10),
          borderRadius: Corners.lgBorder,
        ),
        child: child,
        /*
        child : Row(
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isActive
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).textTheme.bodyText1!.color,
              ),
            ),
          ],
        )
        */
      ),
    );
  }
}
