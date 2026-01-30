import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/icon_sizes.dart';

class ErrorIcon extends StatelessWidget {
  const ErrorIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.error_outline_outlined,
      size: IconSizes.sm,
      color: ExtraColors.redColor,
    );
  }
}
