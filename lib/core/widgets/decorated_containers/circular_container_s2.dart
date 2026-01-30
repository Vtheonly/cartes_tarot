import 'package:flutter/material.dart';

import '../../styles/decorations.dart';
import '../../styles/insets.dart';

class CircularContainerS2 extends StatelessWidget {
  final Widget? child;
  final double? dimension;
  const CircularContainerS2({this.child, this.dimension, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dimension,
      width: dimension,
      decoration: Decorations.circularD2(context),
      padding: EdgeInsets.all(Insets.xsm),
      child: child,
    );
  }
}
