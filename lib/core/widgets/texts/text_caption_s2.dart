import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class TextCaptionS2 extends StatelessWidget {
  final String text;
  const TextCaptionS2({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.caption.copyWith(color: TextColor.of(context).complete),
    );
  }
}
