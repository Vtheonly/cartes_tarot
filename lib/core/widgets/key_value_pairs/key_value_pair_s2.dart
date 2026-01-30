import 'package:flutter/material.dart';

import '../../styles/sizes.dart';
import '../texts/text_caption_s7.dart';

class KeyValuePairS2 extends StatelessWidget {
  final String name;
  final String value;
  const KeyValuePairS2({required this.name, required this.value, super.key});

  const KeyValuePairS2.inversed(
      {required String name, required String value, super.key})
      : name = value,
        value = name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextCaptionS7(text: name),
        SizedBox(width: Sizes.xsm),
        TextCaptionS7(text: value)
      ],
    );
  }
}
