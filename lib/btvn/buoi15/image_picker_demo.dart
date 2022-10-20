import 'dart:io';

import 'package:btvn_techmaster/base/ui/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDemo extends StatefulWidget {
  const ImagePickerDemo({Key? key}) : super(key: key);

  @override
  State<ImagePickerDemo> createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {
  final picker = ImagePicker();
  XFile? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("image picker"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (file != null) ...[
              Image.file(
                File(file?.path ?? ""),
                width: 300,
                height: 100,
              ),
            ],
            ButtonWidget(
              onPressed: () {
                selectedImage(ImageSource.camera);
              },
              text: "Camera",
            ),
            ButtonWidget(
              onPressed: () {
                selectedImage(ImageSource.gallery);
              },
              text: "Galley",
            ),
          ],
        ),
      ),
    );
  }

  Future<void> selectedImage(ImageSource source) async {
    try {
      final image = await picker.pickImage(
        source: source,
        imageQuality: 0,
      );
      if (image != null) {
        upload(image);
      }
    } catch (e) {
      getLostData();
    }
  }

  Future<void> getLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.files != null) {
      for (final XFile file in response.files ?? []) {
        upload(file);
      }
    } else {
      throw Exception("Cos looix xayr ra khoong theer laays dc hinhf anhr");
    }
  }

  void upload(XFile file) {
    this.file = file;
    setState(() {});
  }
}
