import 'package:flutter/material.dart';

import '../../../styles/insets.dart';
import '../../decorated_containers/circular_container_s3.dart';

class SeperatedListViewS1 extends StatelessWidget {
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;
  const SeperatedListViewS1(
      {required this.itemBuilder, required this.itemCount, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      separatorBuilder: (context, _) => Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.xsm),
        child: const CircularContainerS3(),
      ),
      itemBuilder: itemBuilder,
    );
  }
}
