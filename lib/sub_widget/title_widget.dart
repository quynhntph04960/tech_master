import 'package:flutter/material.dart';

import '../base/utils/text_style.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: FormText.titleStyle,
    );
  }
}
