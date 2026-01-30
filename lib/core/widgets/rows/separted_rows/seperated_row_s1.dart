import 'package:flutter/material.dart';

import '../../../styles/insets.dart';
import '../../decorated_containers/circular_container_s3.dart';
import 'seperated_row_m1.dart';

class SeperatedRowS1 extends StatelessWidget {
  final List<Widget> children;
  final double? sizeBetween;
  const SeperatedRowS1({required this.children, this.sizeBetween, super.key});

  @override
  Widget build(BuildContext context) {
    return SeperatedRowM1(
      separator: Padding(
        padding: EdgeInsets.symmetric(horizontal: sizeBetween ?? Insets.xsm),
        child: const CircularContainerS3(),
      ),
      children: children,
    );
  }
}
