import 'package:btvn_techmaster/base/navigator.dart';
import 'package:btvn_techmaster/socket/chat_page.dart';
import 'package:flutter/material.dart';

import 'socket_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = TextEditingController(text: "QuynhNT");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                if (controller.text.length > 1) {
                  socket.connect(controller.text);

                  navigatorPushReplacement(
                      context, ChatPage(name: controller.text));
                }
              },
              child: const Text(
                "Chat",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
