import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class RectangularContainerS3 extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;

  const RectangularContainerS3(
      {required this.child, this.height, this.width, super.key});

  const RectangularContainerS3.square(
      {required this.child, double? dimension, super.key})
      : height = dimension,
        width = dimension;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: Decorations.rectangularD1(context),
      padding: EdgeInsets.symmetric(horizontal: Insets.sm),
      child: child,
    );
  }
}
