import 'package:flutter/material.dart';

import '../../texts/text_caption_s1.dart';
import 'seperated_list_view_s1.dart';

class SeperatedListViewTextsS1 extends StatelessWidget {
  final List<String> texts;
  const SeperatedListViewTextsS1({required this.texts, super.key});

  @override
  Widget build(BuildContext context) {
    return SeperatedListViewS1(
      itemCount: texts.length,
      itemBuilder: (_, index) => TextCaptionS1(text: texts[index]),
    );
  }
}
