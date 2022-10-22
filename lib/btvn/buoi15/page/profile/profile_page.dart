import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/ui/button_widget.dart';
import '../../../../base/ui/field_widget.dart';
import 'profile_cubit.dart';

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

  final _cubit = ProfileCubit();

  @override
  void initState() {
    _cubit.infoUser();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tài khoản của tôi"),
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
          bloc: _cubit,
          buildWhen: (context, state) {
            nameController.text = state.dataUser?.name ?? "";
            dateBirdController.text = state.dataUser?.dateOfBirth ?? "";
            addressController.text = state.dataUser?.address ?? "";
            phoneController.text = state.dataUser?.phoneNumber ?? "";
            emailController.text = state.dataUser?.email ?? "";
            return true;
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildAvatar(state),
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
                    enabled: false,
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
                    onPressed: () => _cubit.updateUser(
                        name: nameController.text,
                        dateOfBirth: dateBirdController.text,
                        address: addressController.text,
                        email: emailController.text,
                        gender: true),
                    text: "Lưu",
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget _buildAvatar(ProfileState state) {
    print(state.avatar);
    return GestureDetector(
      onTap: () => _cubit.pickerImage(context),
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: state.avatar != null
                  ? Image.file(
                      File(state.avatar ?? ""),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      state.dataUser?.avatar ?? "",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(500),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.person,
                            size: 32,
                            color: Colors.blue,
                          ),
                        );
                      },
                    ),
            ),
            const Positioned(
              bottom: 0,
              right: 0,
              child: Icon(Icons.camera_alt_outlined, size: 28),
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
