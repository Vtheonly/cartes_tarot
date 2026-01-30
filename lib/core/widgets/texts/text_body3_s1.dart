import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class TextBody3S1 extends StatelessWidget {
  final String text;
  const TextBody3S1({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.body3.copyWith(color: TextColor.of(context).complete),
    );
  }
}
