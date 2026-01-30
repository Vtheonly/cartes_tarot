import 'package:flutter/material.dart';

import '../../texts/text_caption_s1.dart';
import 'seperated_row_s1.dart';

class SeperatedRowTextsS1 extends StatelessWidget {
  final List<String> texts;
  const SeperatedRowTextsS1({required this.texts, super.key});

  @override
  Widget build(BuildContext context) {
    return SeperatedRowS1(
      children: texts.map((e) => TextCaptionS1(text: e)).toList(),
    );
  }
}
