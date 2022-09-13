import 'package:flutter/material.dart';

import 'btvn/bai9/note_page.dart';

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
      // theme: ThemeData(
      //   primarySwatch: Colors.lightBlue,
      // ),
      // themeMode: ThemeMode.dark,
      // darkTheme: ThemeData.dark(),
      // home: const HomePage(),
      // home: const CardsPage(),
      navigatorKey: keyMaterial,
      home: const NotePage(title: "Bloc"),
      // home: const TestPage(page: 0),
    );
  }
}
