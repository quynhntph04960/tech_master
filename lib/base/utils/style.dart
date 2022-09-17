import 'package:flutter/material.dart';

class Style {
  // Text
  static final textLinearGradient = LinearGradient(
    colors: <Color>[
      Colors.blue,
      Colors.blue.shade100,
    ],
  ).createShader(
    const Rect.fromLTRB(0.0, 0.0, 300.0, 50.0),
  );

  static final titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    foreground: Paint()..shader = Style.textLinearGradient,
  );

  // container

  static final decorationFrame = BoxDecoration(
    border: Border.all(color: Colors.blue, width: 1),
    borderRadius: BorderRadius.circular(16),
  );
}
