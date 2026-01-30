import 'package:flutter/material.dart';

import '../../styles/insets.dart';
import '../decorated_containers/rectangular_container_s3.dart';
import '../texts/text_body3_s3.dart';

class DataContainer extends StatelessWidget {
  final String data;
  const DataContainer({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return RectangularContainerS3(
      child: Padding(
        padding: EdgeInsets.only(bottom: Insets.xxsm),
        child: TextBody3S3(text: data),
      ),
    );
  }
}
