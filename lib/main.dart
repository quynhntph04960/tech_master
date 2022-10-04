import 'package:flutter/material.dart';

import 'demo/bai16/demo_bai16.dart';

void main() {
  runApp(const MyApp());
}

final keyMaterial = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.withOpacity(0.4),
        ),
      ),
      // themeMode: ThemeMode.dark,
      navigatorKey: keyMaterial,
      home: const DemoBai16(),
    );
  }
}
