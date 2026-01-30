import 'package:flutter/material.dart';

import '../../styles/decorations.dart';

class CircularContainerS4 extends StatelessWidget {
  final Widget? child;
  final double? dimension;
  const CircularContainerS4({this.child, this.dimension, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dimension,
      width: dimension,
      decoration: Decorations.circularD4(context),
      padding: const EdgeInsets.all(1.0),
      child: child,
    );
  }
}
