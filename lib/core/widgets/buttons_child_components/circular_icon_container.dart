import 'package:flutter/material.dart';

import '../../styles/sizes.dart';
import '../decorated_containers/circular_container_s1.dart';

class CircularIconContainer extends StatelessWidget {
  final Icon icon;
  const CircularIconContainer({required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return CircularContainerS1(
      dimension: Sizes.xxxl,
      child: icon,
    );
  }
}
