import 'package:flutter/material.dart';

import '../../base/ui/button_widget.dart';
import '../../base/ui/field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                      onPressed: () {},
                      colorBackGround: Colors.white,
                      colorText: Colors.black,
                      text: "Đăng ký",
                    )),
                    Expanded(
                        child: ButtonWidget(
                      width: double.infinity,
                      onPressed: () {},
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
