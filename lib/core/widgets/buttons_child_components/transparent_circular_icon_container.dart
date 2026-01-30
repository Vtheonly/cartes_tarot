import 'package:flutter/material.dart';

import '../../styles/sizes.dart';
import '../decorated_containers/transparent_circular_container_s1.dart';

class TransCircularIconContainer extends StatelessWidget {
  final Icon icon;
  const TransCircularIconContainer({required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return TransCircularContaineS1(
      dimension: Sizes.xxxl,
      child: icon,
    );
  }
}
