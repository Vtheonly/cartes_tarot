import 'package:flutter/material.dart';

import '../../styles/icon_sizes.dart';

class ExpandMoreIcon extends StatelessWidget {
  const ExpandMoreIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.expand_more_outlined,
        size: IconSizes.sm, color: Theme.of(context).colorScheme.onSurface);
  }
}
