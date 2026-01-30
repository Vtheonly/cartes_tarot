import 'package:flutter/material.dart';

import '../../texts/text_caption_s5.dart';
import 'seperated_row_s2.dart';

class SeperatedRowTextsS2 extends StatelessWidget {
  final List<String> texts;
  const SeperatedRowTextsS2({required this.texts, super.key});

  @override
  Widget build(BuildContext context) {
    return SeperatedRowS2(
      children: texts.map((e) => TextCaptionS5(text: e)).toList(),
    );
  }
}
