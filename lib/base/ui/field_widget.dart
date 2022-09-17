import 'package:flutter/material.dart';

const String typeFieldPassword = "Password";
const String typeFieldDefault = "Default";

class FieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String typeField;
  final String? hintText;
  final int? maxLines, maxLength;
  final Widget? suffixIcon, prefixIcon;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;

  const FieldWidget({
    Key? key,
    this.controller,
    this.hintText,
    this.maxLines,
    this.maxLength,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputAction,
    this.validator,
    this.typeField = typeFieldDefault,
  }) : super(key: key);

  @override
  State<FieldWidget> createState() => _FieldWidgetState();
}

class _FieldWidgetState extends State<FieldWidget> {
  TextEditingController? controller;
  String typeField = typeFieldPassword;
  String? hintText;
  int? maxLines, maxLength;
  Widget? suffixIcon, prefixIcon;
  TextInputAction? textInputAction;
  FormFieldValidator<String>? validator;

  bool isCheckPassword = true;

  @override
  void initState() {
    super.initState();
    typeField = widget.typeField;
    controller = widget.controller;
    hintText = widget.hintText;
    maxLines = widget.maxLines;
    maxLength = widget.maxLength;
    suffixIcon = widget.suffixIcon;
    prefixIcon = widget.prefixIcon;
    textInputAction = widget.textInputAction;
    validator = widget.validator;

    if (suffixIcon == null) {
      switch (typeField) {
        case typeFieldPassword:
          suffixIcon = GestureDetector(
            onTap: () {
              isCheckPassword = !isCheckPassword;
              setState(() {});
            },
            child: Icon(isCheckPassword
                ? Icons.remove_red_eye
                : Icons.panorama_fish_eye),
          );
          break;
      }
    }

    if (prefixIcon == null) {
      switch (typeField) {
        case typeFieldPassword:
          prefixIcon = const Icon(Icons.lock_clock_outlined);
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: typeField == typeFieldPassword ? isCheckPassword : false,
      decoration: InputDecoration(
        counterText: "",
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      textInputAction: textInputAction,
      maxLines: maxLines,
      maxLength: maxLength,
    );
  }
}
