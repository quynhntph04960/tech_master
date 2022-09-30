import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final double? width, height;
  final Color? colorBackGround, colorText;

  const ButtonWidget(
      {this.text,
      required this.onPressed,
      this.padding,
      this.margin,
      this.width,
      this.height,
      this.alignment,
      this.colorText,
      this.colorBackGround,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: margin,
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 28),
        width: width,
        height: height,
        alignment: alignment,
        decoration: BoxDecoration(
          color: colorBackGround ?? Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: colorText ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
