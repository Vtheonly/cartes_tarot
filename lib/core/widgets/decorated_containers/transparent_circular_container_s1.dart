import 'package:flutter/material.dart';

import '../../styles/decorations.dart';
import '../../styles/insets.dart';

class TransCircularContaineS1 extends StatelessWidget {
  final Widget? child;
  final double? dimension;
  const TransCircularContaineS1({this.child, this.dimension, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dimension,
      width: dimension,
      decoration: Decorations.transCircularD1(context),
      padding: EdgeInsets.all(Insets.xsm),
      child: child,
    );
  }
}
