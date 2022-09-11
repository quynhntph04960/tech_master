import 'package:flutter/material.dart';

import '../model/item.dart';

class AnswerWidget extends StatelessWidget {
  final Item data;
  const AnswerWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        "assets/images/${data.photo}",
        // "assets/chicken1.jpeg",
        fit: BoxFit.cover,
        width: 100,
        height: 100,
        // width: double.infinity,
        // height: double.infinity,
      ),
    );
  }
}
