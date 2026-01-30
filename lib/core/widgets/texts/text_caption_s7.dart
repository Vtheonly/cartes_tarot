import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/text_styles.dart';

class TextCaptionS7 extends StatelessWidget {
  final String text;
  const TextCaptionS7({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.caption.copyWith(color: TextColor.of(context).s60),
    );
  }
}
