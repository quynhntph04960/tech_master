import 'package:btvn_techmaster/base/utils/style.dart';
import 'package:flutter/material.dart';

class FormText {
  static const titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static final titleLinearGradient = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    foreground: Paint()..shader = Style.textLinearGradient,
  );
}
