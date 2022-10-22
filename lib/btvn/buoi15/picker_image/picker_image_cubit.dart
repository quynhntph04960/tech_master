import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../base/service/api_service.dart';
import '../model/upload_file_response.dart';

class PickerImageCubit extends Cubit<PickerImageState> {
  final picker = ImagePicker();

  PickerImageCubit() : super(PickerImageState());

  Future<DataUploadFile?> selectedImage(
      ImageSource source, BuildContext context) async {
    // Navigator.pop(context);
    try {
      final image = await picker.pickImage(
        source: source,
        imageQuality: 0,
      );
      if (image != null) {
        return await uploadFile(image);
      }
    } catch (e) {
      return await getLostData();
    }
    return null;
  }

  Future<DataUploadFile?> getLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return null;
    }
    if (response.files != null) {
      for (final XFile file in response.files ?? []) {
        return await uploadFile(file);
      }
    } else {
      throw Exception("Cos looix xayr ra khoong theer laays dc hinhf anhr");
    }
    return null;
  }

  Future<DataUploadFile?> uploadFile(XFile? file) async {
    final json = await apiService.request(
      path: "upload",
      method: Method.post,
      file: file,
    );
    final response = UploadFileResponse.fromJson(json);
    if (response.code == 0) {
      return response.data;
    }
    return null;
  }
}

class PickerImageState {}
