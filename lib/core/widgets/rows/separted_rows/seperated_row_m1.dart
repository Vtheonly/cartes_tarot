import 'package:flutter/material.dart';

class SeperatedRowM1 extends StatelessWidget {
  final List<Widget> children;
  final Widget separator;
  const SeperatedRowM1(
      {required this.children, required this.separator, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildSeparatedChildren(),
    );
  }

  List<Widget> _buildSeparatedChildren() {
    List<Widget> separatedChildren = [];

    for (int i = 0; i < children.length; i++) {
      separatedChildren.add(children[i]);
      if (i < children.length - 1) {
        separatedChildren.add(separator);
      }
    }

    return separatedChildren;
  }
}
