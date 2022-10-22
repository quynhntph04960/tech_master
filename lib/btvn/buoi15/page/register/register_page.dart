import 'package:btvn_techmaster/base/ui/button_widget.dart';
import 'package:btvn_techmaster/btvn/buoi15/page/register/register_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../base/ui/MyTextField.dart';

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
  final _cubit = RegisterCubit();

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
                onSubmitted: (p0) => _cubit.registerUser(
                    phone: phoneController.text,
                    password: passwordController.text,
                    name: nameController.text,
                    address: addressController.text,
                    email: emailController.text,
                    context: context),
              ),
              const SizedBox(
                height: 16,
              ),
              ButtonWidget(
                onPressed: () => _cubit.registerUser(
                    phone: phoneController.text,
                    password: passwordController.text,
                    name: nameController.text,
                    address: addressController.text,
                    email: emailController.text,
                    context: context),
                text: "Đăng ký",
              )
            ],
          ),
        ),
      ),
    );
  }
}
