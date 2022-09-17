import 'package:flutter/material.dart';

class AssetWidget extends StatelessWidget {
  final String? image;
  final double? height, width;
  final Color? colorImg;

  const AssetWidget(
      {Key? key, required this.image, this.height, this.width, this.colorImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image ?? "",
      height: height,
      width: width,
      color: colorImg,
      fit: BoxFit.cover,
    );
  }
}
