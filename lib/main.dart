import 'package:flutter/material.dart';

import 'game/page/cards_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(111111);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.lightBlue,
      // ),
      // themeMode: ThemeMode.dark,
      // darkTheme: ThemeData.dark(),
      // home: const HomePage(),
      home: const CardsPage(),
    );
  }
}
