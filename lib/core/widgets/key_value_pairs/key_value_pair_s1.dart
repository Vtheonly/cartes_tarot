import 'package:flutter/material.dart';

import '../../styles/sizes.dart';
import '../texts/text_caption_s1.dart';
import '../texts/text_caption_s2.dart';

class KeyValuePairS1 extends StatelessWidget {
  final String name;
  final String value;
  const KeyValuePairS1({required this.name, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextCaptionS1(text: name),
        SizedBox(width: Sizes.xsm),
        TextCaptionS2(text: value)
      ],
    );
  }
}
