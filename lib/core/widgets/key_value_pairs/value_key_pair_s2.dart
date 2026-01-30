import 'package:flutter/material.dart';

import '../../styles/sizes.dart';
import '../texts/text_caption_s5.dart';
import '../texts/text_caption_s6.dart';

class ValueKeyPairS2 extends StatelessWidget {
  final String name;
  final String value;
  const ValueKeyPairS2({required this.name, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextCaptionS6(text: value),
        SizedBox(width: Sizes.xsm),
        TextCaptionS5(text: name)
      ],
    );
  }
}
