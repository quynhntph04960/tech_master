import 'package:btvn_techmaster/base/ui/custom_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../base/service/api_service.dart';
import '../../../../base/ui/button_widget.dart';
import '../../model/user_response.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final picker = ImagePicker();

  ProfileCubit() : super(ProfileState());

  Future infoUser() async {
    final response =
        await apiService.request(path: "accounts/profile", method: Method.get);
    UserResponse dataResponse = UserResponse.fromJson(response);
    if (dataResponse.code == 0) {
      emit(ProfileState(
        dataUser: dataResponse.data,
        avatar: dataResponse.data?.avatar,
      ));
    } else {
      print("${dataResponse.message} - ${dataResponse.code}");
    }
  }

  void pickerImage(BuildContext context) {
    CustomBottomSheetWidget(
      context: context,
      subWidget: Container(
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
      ),
    ).showBottomSheetDialog();
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
    // this.file = file;
    emit(state.copyWith(avatar: file.path));
  }

  Future updateUser({
    required String name,
    required String email,
    required String address,
    required String dateOfBirth,
    required bool gender,
  }) async {
    final param = {
      "Name": name,
      "Email": email,
      "Address": address,
      "DateOfBirth": dateOfBirth,
      "Gender": gender,
      "Avatar": state.avatar ?? state.dataUser?.avatar ?? "",
    };

    final response = await apiService.request(
        path: "accounts/update", method: Method.post, body: param);
    UserResponse dataResponse = UserResponse.fromJson(response);
    if (dataResponse.code == 0) {
      emit(state.copyWith(
          dataUser: dataResponse.data, avatar: dataResponse.data?.avatar));
    } else {
      print("${dataResponse.message} - ${dataResponse.code}");
    }
  }
}

class ProfileState {
  final DataUser? dataUser;
  final String? avatar;

  ProfileState({this.dataUser, this.avatar});

  ProfileState copyWith({
    DataUser? dataUser,
    String? avatar,
  }) {
    return ProfileState(
      dataUser: dataUser ?? this.dataUser,
      avatar: avatar ?? this.avatar,
    );
  }
}
