import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../base/navigator.dart';
import '../../../../base/service/api_service.dart';
import '../../../../main.dart';
import '../../model/user_response.dart';
import '../news_feed/news_feed_page.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  Future checkLogin(BuildContext context) async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    String? token1 = pres.getString("token");
    if (token1 != null) {
      token = token1;
      Future.delayed(Duration.zero, () {
        navigatorPushAndRemoveUntil(context, const NewsFeedPage());
      });
    }
  }

  Future loginUser(String phone, String password, BuildContext context) async {
    if (phone.isEmpty || password.isEmpty) {
      print("Thiếu thông tin !");
      return;
    }
    final param = {
      "PhoneNumber": phone,
      "Password": password,
    };
    final response = await apiService.request(
        path: "accounts/login", method: Method.post, body: param);
    UserResponse dataResponse = UserResponse.fromJson(response);
    if (dataResponse.code == 0) {
      SharedPreferences pres = await SharedPreferences.getInstance();
      pres.setString("token", dataResponse.data?.token ?? "");
      token = dataResponse.data?.token ?? "";
      Future.delayed(Duration.zero, () {
        navigatorPushAndRemoveUntil(context, const NewsFeedPage());
      });
    } else {
      print("${dataResponse.message} - ${dataResponse.code}");
    }
  }
}

class LoginState {}
