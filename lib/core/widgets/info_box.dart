import 'package:flutter/material.dart';

import '../styles/styles.dart';

class InfoBox extends StatelessWidget {
  final Color backgroundColor;
  final Widget icon;
  final Widget info;

  const InfoBox(
      {required this.backgroundColor,
      required this.icon,
      required this.info,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(Insets.med),
      margin: EdgeInsets.symmetric(horizontal: Insets.sm, vertical: Insets.med),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: Corners.xsmBorder,
      ),
      child: Row(
        children: [icon, SizedBox(width: Sizes.med), info],
      ),
    );
  }
}
