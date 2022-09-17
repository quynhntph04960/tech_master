import 'package:flutter/material.dart';

import '../../../base/ui/button_widget.dart';
import '../../../base/ui/field_widget.dart';
import '../../../base/utils/common_function.dart';
import '../../../base/utils/style.dart';
import '../home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final accountController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          children: [
            Container(
              decoration: Style.decorationFrame,
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.all(16.0),
              child: _buildBody(),
            ),
          ],
        ),
      ),
    );
  }

  bool isCheckClick = true;

  Widget _buildBody() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Đăng nhập",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 32),
          FieldWidget(
            controller: accountController,
            validator: validateAccount,
            suffixIcon: GestureDetector(
              child: const Icon(Icons.clear),
              onTap: () => accountController.text = "",
            ),
            hintText: "Nhập tài khoản",
            prefixIcon: const Icon(Icons.person),
            textInputAction: TextInputAction.next,
            maxLines: 1,
            maxLength: 50,
          ),
          const SizedBox(height: 16),
          FieldWidget(
            controller: passwordController,
            validator: validateAccount,
            typeField: typeFieldPassword,
            hintText: "Nhập mật khẩu",
            maxLines: 1,
            maxLength: 50,
          ),
          const SizedBox(height: 32),
          ButtonWidget(
            text: "Đăng nhập",
            alignment: Alignment.center,
            onPressed: () async {
              if (!validateAndSave(_formKey)) {
                return;
              }
              print("đăng nhập thành công");
              navigatorPushReplacement(context, const HomePage());
            },
          ),
        ],
      ),
    );
  }

  int number = 0;

  String? validateAccount(String? value) {
    if (value == null || value.isEmpty) {
      return "Tài khoản không được để trống!";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Mật khẩu không được để trống!";
    }
    return null;
  }
}
