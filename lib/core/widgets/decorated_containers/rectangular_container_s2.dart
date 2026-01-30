import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class RectangularContainerS2 extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;

  const RectangularContainerS2(
      {required this.child, this.height, this.width, super.key});

  const RectangularContainerS2.square(
      {required this.child, double? dimension, super.key})
      : height = dimension,
        width = dimension;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: Decorations.rectangularD2(context),
      padding:
          EdgeInsets.symmetric(vertical: Insets.xsm, horizontal: Insets.sm),
      child: child,
    );
  }
}
