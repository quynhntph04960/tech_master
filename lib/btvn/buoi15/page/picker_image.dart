import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../base/ui/button_widget.dart';

class PickerImagePage extends StatefulWidget {
  final Function(XFile file) callback;
  const PickerImagePage({Key? key, required this.callback}) : super(key: key);

  @override
  State<PickerImagePage> createState() => _PickerImagePageState();
}

class _PickerImagePageState extends State<PickerImagePage> {
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Column(
        children: [
          ButtonWidget(
            margin: const EdgeInsets.symmetric(vertical: 8),
            width: double.infinity,
            onPressed: () {
              selectedImage(ImageSource.camera, context);
            },
            text: "Camera",
          ),
          ButtonWidget(
            margin: const EdgeInsets.symmetric(vertical: 8),
            onPressed: () {
              selectedImage(ImageSource.gallery, context);
            },
            width: double.infinity,
            text: "Galley",
          ),
        ],
      ),
    );
  }

  Future<void> selectedImage(ImageSource source, BuildContext context) async {
    Navigator.pop(context);
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
    widget.callback(file);
    Navigator.pop(context);
  }
}
