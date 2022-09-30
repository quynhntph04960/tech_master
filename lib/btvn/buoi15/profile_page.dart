import 'package:flutter/material.dart';

import '../../base/ui/button_widget.dart';
import '../../base/ui/field_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateBirdController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tài khoản của tôi"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: Image.network(
                        "https://data.designervn.net/2022/04/14386_socail-messenger-app-logo.jpg",
                        height: 100,
                        width: 100),
                  ),
                  const Positioned(
                    bottom: 0,
                    right: 0,
                    child: Icon(Icons.camera_alt_outlined, size: 28),
                  )
                ],
              ),
            ),
            _buildSizeBox(),
            _buildSizeBox(),
            FieldWidget(
              controller: nameController,
              hintText: "Nhập họ và tên",
              labelText: "Họ tên",
            ),
            _buildSizeBox(),
            FieldWidget(
              controller: dateBirdController,
              hintText: "Nhập ngày sinh",
              labelText: "Ngày sinh",
            ),
            _buildSizeBox(),
            FieldWidget(
              controller: addressController,
              hintText: "Nhập địa chỉ",
              labelText: "Địa chỉ",
            ),
            _buildSizeBox(),
            FieldWidget(
              controller: phoneController,
              hintText: "Nhập số điện thoại",
              labelText: "Số điện thoại",
            ),
            _buildSizeBox(),
            FieldWidget(
              controller: emailController,
              hintText: "Nhập Email",
              labelText: "Email",
            ),
            _buildSizeBox(),
            ButtonWidget(
              alignment: Alignment.center,
              onPressed: () {},
              text: "Lưu",
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSizeBox() {
    return const SizedBox(
      height: 16,
    );
  }
}
