import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../base/ui/button_widget.dart';
import '../model/upload_file_response.dart';
import 'picker_image_cubit.dart';

class PickerImagePage extends StatefulWidget {
  final Function(DataUploadFile file) callback;
  const PickerImagePage({Key? key, required this.callback}) : super(key: key);

  @override
  State<PickerImagePage> createState() => _PickerImagePageState();
}

class _PickerImagePageState extends State<PickerImagePage> {
  final _cubit = PickerImageCubit();

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
              Navigator.pop(context);
              _cubit.selectedImage(ImageSource.camera, context).then((value) {
                if (value == null) return;
                upload(value);
              });
            },
            text: "Camera",
          ),
          ButtonWidget(
            margin: const EdgeInsets.symmetric(vertical: 8),
            onPressed: () {
              Navigator.pop(context);
              _cubit.selectedImage(ImageSource.gallery, context).then((value) {
                if (value == null) return;
                upload(value);
              });
            },
            width: double.infinity,
            text: "Galley",
          ),
        ],
      ),
    );
  }

  void upload(DataUploadFile file) {
    file.path = "http://api.quynhtao.com${file.path}";
    widget.callback(file);
  }
}
