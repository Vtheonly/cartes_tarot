import 'package:flutter/material.dart';

import 'colors.dart';
import 'corners.dart';

class Decorations {
  static Decoration rectangularD1(BuildContext context) => BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: Corners.smBorder,
      );

  static Decoration rectangularD2(BuildContext context) => BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: Corners.lgBorder,
      );

  static Decoration circularD1(BuildContext context) => BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        shape: BoxShape.circle,
      );

  static Decoration circularD2(BuildContext context) => const BoxDecoration(
        color: ExtraColors.redColor,
        shape: BoxShape.circle,
      );

  static Decoration circularD3(BuildContext context) => BoxDecoration(
        color: BackgroundColor.of(context).s60,
        shape: BoxShape.circle,
      );

  static Decoration circularD4(BuildContext context) => BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        shape: BoxShape.circle,
      );

  static Decoration transRectangularD1(BuildContext context) =>
      const BoxDecoration(
        color: Colors.transparent,
        borderRadius: Corners.smBorder,
      );

  static Decoration transCircularD1(BuildContext context) =>
      const BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
      );
}
