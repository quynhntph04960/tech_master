import 'dart:convert';

import 'package:btvn_techmaster/base/ui/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../base/ui/MyTextField.dart';
import 'model/user_response.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  UserResponse? dataResponse;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextField(
                controller: nameController,
                hintText: "Nhập tên",
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 16,
              ),
              MyTextField(
                controller: emailController,
                hintText: "Nhập email",
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 16,
              ),
              MyTextField(
                controller: phoneController,
                hintText: "Nhập số điện thoại",
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 16,
              ),
              MyTextField(
                controller: passwordController,
                hintText: "Nhập mật khẩu",
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 16,
              ),
              MyTextField(
                controller: addressController,
                hintText: "Nhập địa chỉ",
                textInputAction: TextInputAction.done,
                onSubmitted: (p0) => registerUser(),
              ),
              const SizedBox(
                height: 16,
              ),
              ButtonWidget(
                onPressed: registerUser,
                text: "Đăng ký",
              )
            ],
          ),
        ),
      ),
    );
  }

  bool isValidate() {
    if (phoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        nameController.text.isEmpty ||
        emailController.text.isEmpty) return false;

    return true;
  }

  Future registerUser() async {
    if (phoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        nameController.text.isEmpty ||
        emailController.text.isEmpty) {
      print("Thiếu thông tin !");
      return;
    }
    final uri = Uri.parse("http://api.quynhtao.com/api/accounts/register");
    final param = {
      "PhoneNumber": phoneController.text,
      "Password": passwordController.text,
      "Email": emailController.text,
      "Address": addressController.text,
      "Name": nameController.text,
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
        Navigator.pop(context);
      } else {
        print("${dataResponse?.message} - ${dataResponse?.code}");
      }
      return;
    }
    throw Exception("Lỗi ${response.statusCode}");
  }
}
