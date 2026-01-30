import 'package:flutter/material.dart';

import '../../../styles/sizes.dart';
import 'seperated_row_m1.dart';

class SeperatedRowS3 extends StatelessWidget {
  final List<Widget> children;
  final double? sizeBetween;
  const SeperatedRowS3({required this.children, this.sizeBetween, super.key});

  @override
  Widget build(BuildContext context) {
    return SeperatedRowM1(
      separator: SizedBox(width: sizeBetween ?? Sizes.xsm),
      children: children,
    );
  }
}
