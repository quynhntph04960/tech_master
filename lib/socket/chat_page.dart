import 'dart:async';

import 'package:btvn_techmaster/socket/model/message.dart';
import 'package:btvn_techmaster/socket/socket_manager.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String name;
  const ChatPage({Key? key, required this.name}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final controller = TextEditingController();
  final listMessage = <Message>[];
  StreamSubscription? _socketListen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketListen = socket.stream.listen((message) {
      listMessage.add(message);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildListMessage(),
          ),
          _buildSendChat(),
        ],
      ),
    );
  }

  Widget _buildListMessage() {
    return ListView.builder(
      itemCount: listMessage.length,
      reverse: true,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) {
        final message = listMessage[index];
        bool isMain = !(message.name == widget.name);
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
              isMain ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                message.name ?? "",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Container(
              decoration: BoxDecoration(
                color: isMain ? Colors.blue.shade400 : Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                  bottomLeft: isMain
                      ? const Radius.circular(0)
                      : const Radius.circular(10),
                  bottomRight: !isMain
                      ? const Radius.circular(0)
                      : const Radius.circular(10),
                ),
              ),
              margin: EdgeInsets.only(
                // top: 12,
                // bottom: 12,
                left: isMain ? 16 : 120,
                right: !isMain ? 16 : 120,
              ),
              padding: const EdgeInsets.all(16),
              child: Text(
                message.text ?? "",
                textAlign: isMain ? TextAlign.left : TextAlign.right,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSendChat() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: controller,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Nhập nội dung",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              socket.emit(controller.text);
              controller.text = "";
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(8)),
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
