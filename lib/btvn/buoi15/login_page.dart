import 'dart:convert';

import 'package:btvn_techmaster/base/navigator.dart';
import 'package:btvn_techmaster/btvn/buoi15/register_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../base/ui/button_widget.dart';
import '../../base/ui/field_widget.dart';
import '../../main.dart';
import 'model/user_response.dart';
import 'news_feed/news_feed_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController =
      TextEditingController(text: "0393923233");
  TextEditingController passwordController =
      TextEditingController(text: "123123");
  UserResponse? dataResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  Future checkLogin() async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    String? token = pres.getString("token");
    if (token != null) {
      Future.delayed(Duration.zero, () {
        navigatorPushAndRemoveUntil(context, const NewsFeedPage());
      });
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: [
                Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/c/cf/Mac_App_Store_logo.png",
                    height: 150,
                    width: double.infinity),
                FieldWidget(
                  controller: phoneController,
                  hintText: "Nhập số điện thoại",
                  labelText: "Số điện thoại",
                ),
                const SizedBox(
                  height: 16,
                ),
                FieldWidget(
                  controller: passwordController,
                  hintText: "Nhập mật khẩu",
                  labelText: "Mật khẩu",
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ButtonWidget(
                      width: double.infinity,
                      onPressed: () {
                        navigatorPush(context, const RegisterPage());
                      },
                      colorBackGround: Colors.white,
                      colorText: Colors.black,
                      text: "Đăng ký",
                    )),
                    Expanded(
                        child: ButtonWidget(
                      width: double.infinity,
                      onPressed: loginUser,
                      text: "Đăng nhập",
                    )),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 16),
              child: RichText(
                text: const TextSpan(
                  text: "Hotline: ",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                        text: "0393923233",
                        style: TextStyle(color: Colors.blue))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future loginUser() async {
    if (phoneController.text.isEmpty || passwordController.text.isEmpty) {
      print("Thiếu thông tin !");
      return;
    }
    final uri = Uri.parse("http://api.quynhtao.com/api/accounts/login");
    final param = {
      "PhoneNumber": phoneController.text,
      "Password": passwordController.text,
    };
    final response = await http.post(
      uri,
      body: param,
      encoding: utf8,
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final json = jsonDecode(response.body);
      dataResponse = UserResponse.fromJson(json);
      if (dataResponse?.code == 0) {
        SharedPreferences pres = await SharedPreferences.getInstance();
        pres.setString("token", dataResponse?.data?.token ?? "");
        token = dataResponse?.data?.token ?? "";
        Future.delayed(Duration.zero, () {
          navigatorPushAndRemoveUntil(context, const NewsFeedPage());
        });
      } else {
        print("${dataResponse?.message} - ${dataResponse?.code}");
      }
      return;
    }
    throw Exception("Lỗi ${response.statusCode}");
  }
}
