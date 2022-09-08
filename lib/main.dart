import 'package:flutter/material.dart';

import 'buoi6.dart';

void main() {
  // mainBTVNBuoi2();
  // mainBTVNBuoi3();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GVPage(),
    );
  }
}
