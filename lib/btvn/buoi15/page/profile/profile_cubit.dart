import 'package:btvn_techmaster/base/ui/custom_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/service/api_service.dart';
import '../../model/user_response.dart';
import '../picker_image.dart';

class ProfileCubit extends Cubit<ProfileState> {
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
      subWidget: PickerImagePage(callback: (file) {
        emit(state.copyWith(avatar: file.path));
      }),
    ).showBottomSheetDialog();
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
