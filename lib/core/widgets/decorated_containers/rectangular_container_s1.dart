import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class RectangularContainerS1 extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;

  const RectangularContainerS1(
      {required this.child, this.height, this.width, super.key});

  const RectangularContainerS1.square(
      {required this.child, double? dimension, super.key})
      : height = dimension,
        width = dimension;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: Decorations.rectangularD1(context),
      padding: EdgeInsets.all(Insets.xsm),
      child: child,
    );
  }
}
