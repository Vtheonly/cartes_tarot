import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class TransRectangularContainerS1 extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;

  const TransRectangularContainerS1(
      {required this.child, this.height, this.width, super.key});

  const TransRectangularContainerS1.square(
      {required this.child, double? dimension, super.key})
      : height = dimension,
        width = dimension;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: Decorations.transRectangularD1(context),
      padding: EdgeInsets.all(Insets.xsm),
      child: child,
    );
  }
}
