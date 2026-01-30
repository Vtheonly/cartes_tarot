import 'package:flutter/material.dart';

import '../../styles/decorations.dart';

class CircularContainerS3 extends StatelessWidget {
  final Widget? child;
  final double? dimension;
  const CircularContainerS3({this.child, this.dimension, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dimension,
      width: dimension,
      decoration: Decorations.circularD3(context),
      padding: const EdgeInsets.all(1.0),
      child: child,
    );
  }
}
