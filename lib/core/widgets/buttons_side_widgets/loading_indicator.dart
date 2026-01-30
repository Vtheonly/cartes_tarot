import 'package:flutter/material.dart';

import '../../styles/sizes.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: Sizes.med,
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.onSurface,
        strokeWidth: 2.0,
      ),
    );
  }
}
