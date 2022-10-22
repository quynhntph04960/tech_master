import 'package:btvn_techmaster/base/navigator.dart';
import 'package:btvn_techmaster/btvn/buoi15/page/register/register_page.dart';
import 'package:flutter/material.dart';

import '../../../../base/ui/button_widget.dart';
import '../../../../base/ui/field_widget.dart';
import '../../../../base/ui/loading_dialog.dart';
import '../../../../main.dart';
import 'login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneController = TextEditingController(text: "0393923233");
  final passwordController = TextEditingController(text: "123123");
  final _cubit = LoginCubit();

  @override
  void initState() {
    // TODO: implement initState
    _cubit.checkLogin(context);
    loadingDialog = LoadingDialog(keyMaterial.currentContext!);
    super.initState();
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
                      onPressed: () => _cubit.loginUser(phoneController.text,
                          passwordController.text, context),
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
}
