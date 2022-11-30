import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:btvn_techmaster/socket/model/message.dart';

class SocketManage {
  static final _service = SocketManage._internal();

  factory SocketManage() => _service;

  SocketManage._internal();

  final socketUrl = "ws://api.quynhtao.com/ws/";

  final _streamController = StreamController<Message>.broadcast();
  Stream<Message> get stream => _streamController.stream;

  WebSocket? _socket;
  StreamSubscription? _socketListen;
  String name = '';

  Future connect(String name) async {
    this.name = name;
    try {
      print("connecting...");
      _socket = await WebSocket.connect(socketUrl + name, headers: {});
      on();
      print("connected!");
    } catch (e) {
      print("ERROR connect");
      await reconnect();
    }
  }

  Future reconnect() async {
    await Future.delayed(const Duration(seconds: 3));
    await connect(name);
  }

  Future disconnect() async {
    _socketListen?.cancel();
    _socketListen = null;
  }

  Future emit(String data) async {
    _socket?.add(data);
  }

  Future on() async {
    _socketListen?.cancel();
    _socketListen = _socket?.listen((event) {
      print("listen - event");
      final json = jsonDecode(event);
      final message = Message.fromJson(json);
      print("event: ${event}");
      if (message.error == null) {
        _streamController.sink.add(message);
      } else {
        _streamController.sink.addError(message.error ?? "");
      }
    }, onDone: () {
      print("onDONE");
    }, onError: (e) {
      print(e);
    });
  }
}

final socket = SocketManage();
