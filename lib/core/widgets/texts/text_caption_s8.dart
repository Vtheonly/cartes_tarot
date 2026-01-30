import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/text_styles.dart';

class TextCaptionS8 extends StatelessWidget {
  final String text;
  const TextCaptionS8({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.caption.copyWith(color: ExtraColors.warnningColor),
    );
  }
}
