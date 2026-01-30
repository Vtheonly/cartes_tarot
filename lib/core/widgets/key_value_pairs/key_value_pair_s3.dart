import 'package:flutter/material.dart';

import '../../styles/sizes.dart';
import '../texts/text_caption_s5.dart';

class KeyValuePairS3 extends StatelessWidget {
  final String name;
  final String value;
  const KeyValuePairS3({required this.name, required this.value, super.key});

  const KeyValuePairS3.inversed(
      {required String name, required String value, super.key})
      : name = value,
        value = name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextCaptionS5(text: name),
        SizedBox(width: Sizes.xsm),
        TextCaptionS5(text: value)
      ],
    );
  }
}
