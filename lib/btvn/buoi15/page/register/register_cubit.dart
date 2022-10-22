import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/service/api_service.dart';
import '../../model/user_response.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());

  Future registerUser({
    required String phone,
    required String password,
    required String name,
    required String address,
    required String email,
    required BuildContext context,
  }) async {
    if (phone.isEmpty || password.isEmpty || name.isEmpty || email.isEmpty) {
      print("Thiếu thông tin !");
      return;
    }
    final param = {
      "PhoneNumber": phone,
      "Password": password,
      "Email": email,
      "Address": address,
      "Name": name,
    };
    final json = await apiService.request(
        path: "accounts/register", method: Method.post, body: param);
    UserResponse dataResponse = UserResponse.fromJson(json);
    if (dataResponse.code == 0) {
      Navigator.pop(context);
    }
  }
}

class RegisterState {}
