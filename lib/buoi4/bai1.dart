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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 20,
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text("Hotline"),
              Text(
                "19002888      ",
                style:
                TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 24),
            child: const Text(
              "Số điện thoại",
              style: TextStyle(fontSize: 24),
            ),
          ),
          const Text("Nhập số điện thoại để bắt đầu"),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)))),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: const [
                Text("Bằng việc tiếp tục, tôi đã đọc và đồng ý với "),
                Text(
                  "Chính sách &",
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                Text(
                  "điều khoản",
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                ),
                Text(" của Luckyball"),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    blurStyle: BlurStyle.solid,
                    offset: Offset(1,4)
                )
              ],
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Text("Tiếp tục", style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600
            ),
            ),
          )
        ],
      ),
    );
  }
}
