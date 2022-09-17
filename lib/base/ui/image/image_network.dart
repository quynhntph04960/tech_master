import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NetworkWidget extends StatelessWidget {
  final String? url;
  final double? height, width;

  const NetworkWidget({
    Key? key,
    required this.url,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(url ?? ""),
      height: height,
      width: width,
      errorBuilder: (BuildContext context, exception, stackTrace) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      fit: BoxFit.cover,
    );
  }
}
