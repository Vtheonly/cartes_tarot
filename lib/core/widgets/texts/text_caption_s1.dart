import 'package:flutter/material.dart';

import '../../styles/text_styles.dart';

class TextCaptionS1 extends StatelessWidget {
  final String text;
  const TextCaptionS1({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.caption,
    );
  }
}
