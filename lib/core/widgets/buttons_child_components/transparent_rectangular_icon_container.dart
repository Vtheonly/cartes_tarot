import 'package:flutter/material.dart';

import '../../styles/sizes.dart';
import '../decorated_containers/transparent_rectangular_container_s1.dart';

class TransRectangularIconContainer extends StatelessWidget {
  final Icon icon;
  const TransRectangularIconContainer({required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return TransRectangularContainerS1.square(
      dimension: Sizes.xxxl,
      child: icon,
    );
  }
}
