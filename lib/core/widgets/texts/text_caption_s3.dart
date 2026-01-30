import 'package:flutter/material.dart';

import '../../styles/text_styles.dart';

class TextCaptionS3 extends StatelessWidget {
  final String text;
  const TextCaptionS3({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.caption
          .copyWith(color: Theme.of(context).colorScheme.onSurface),
    );
  }
}
