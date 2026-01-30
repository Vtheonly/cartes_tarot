import 'package:flutter/material.dart';

import '../../styles/sizes.dart';
import '../decorated_containers/rectangular_container_s1.dart';

class RectangularIconContainer extends StatelessWidget {
  final Icon icon;
  const RectangularIconContainer({required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return RectangularContainerS1.square(
      dimension: Sizes.xxxl,
      child: icon,
    );
  }
}
