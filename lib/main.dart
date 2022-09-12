import 'package:flutter/material.dart';

<<<<<<< HEAD
import 'buoi6.dart';
=======
import 'test_page.dart';
>>>>>>> game

void main() {
  // mainBTVNBuoi2();
  // mainBTVNBuoi3();
  runApp(const MyApp());
}

final keyMaterial = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
<<<<<<< HEAD
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GVPage(),
=======
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.lightBlue,
      // ),
      // themeMode: ThemeMode.dark,
      // darkTheme: ThemeData.dark(),
      // home: const HomePage(),
      // home: const CardsPage(),
      navigatorKey: keyMaterial,
      home: const TestPage(page: 0),
>>>>>>> game
    );
  }
}
