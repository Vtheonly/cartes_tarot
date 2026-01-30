import 'package:flutter/material.dart';

import '../../styles/text_styles.dart';

class TextBody3S2 extends StatelessWidget {
  final String text;
  const TextBody3S2({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.body3
          .copyWith(color: Theme.of(context).colorScheme.onSurface),
    );
  }
}
