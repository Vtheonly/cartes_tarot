import 'package:flutter/material.dart';

import '../../../styles/insets.dart';
import '../../decorated_containers/circular_container_s4.dart';
import 'seperated_row_m1.dart';

class SeperatedRowS2 extends StatelessWidget {
  final List<Widget> children;
  final double? sizeBetween;
  const SeperatedRowS2({required this.children, this.sizeBetween, super.key});

  @override
  Widget build(BuildContext context) {
    return SeperatedRowM1(
      separator: Padding(
        padding: EdgeInsets.symmetric(horizontal: sizeBetween ?? Insets.xsm),
        child: const CircularContainerS4(),
      ),
      children: children,
    );
  }
}
