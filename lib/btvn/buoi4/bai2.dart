import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text("Sửa tài khoản"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.red,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildAvatar(),
            _buildInfo(),
            _buildBody(),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Text(
          "Lưu",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
//asjkdhaskhdas
  Widget _buildBody() {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Thông tin xuất hóa đơn".toUpperCase(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 16,
          ),
          TextField(
            controller: TextEditingController(),
            decoration: const InputDecoration(
                hintText: "Tên công ty", border: OutlineInputBorder()),
          ),
          Container(
            height: 16,
          ),
          TextField(
            controller: TextEditingController(),
            decoration: const InputDecoration(
                hintText: "Mã số thuế", border: OutlineInputBorder()),
          ),
          Container(
            height: 16,
          ),
          TextField(
            controller: TextEditingController(),
            autofocus: true,
            decoration: const InputDecoration(
                labelText: "Địa chỉ công ty",
                hintText: "",
                border: OutlineInputBorder()),
          ),
          Container(
            height: 16,
          ),
          TextField(
            controller: TextEditingController(),
            decoration: const InputDecoration(
                hintText: "Ghi chú", border: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Thông tin cá nhân".toUpperCase(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 16,
          ),
          TextField(
            controller: TextEditingController(text: "0393923233"),
            decoration: const InputDecoration(
                labelText: "Số điện thoại", border: OutlineInputBorder()),
          ),
          Container(
            height: 16,
          ),
          TextField(
            controller: TextEditingController(text: "Nguyễn Trọng Quỳnh"),
            decoration: const InputDecoration(
                labelText: "Họ & tên", border: OutlineInputBorder()),
          ),
          Container(
            height: 16,
          ),
          TextField(
            controller: TextEditingController(),
            decoration: const InputDecoration(
                labelText: "", hintText: "Email", border: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 24),
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              "https://hanoispiritofplace.com/wp-content/uploads/2017/10/anh-bua-11.jpg",
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child:  const Text("Đổi ảnh đại diện", style: TextStyle(fontSize: 16),),
          ),
        ],
      ),
    );
  }
}
