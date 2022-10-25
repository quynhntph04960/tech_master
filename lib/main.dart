import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'base/ui/loading_dialog.dart';
import 'kiem_tra/address/address_page.dart';

LoadingDialog? loadingDialog;
String? token = "";
final keyMaterial = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

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
      home: const AddressPage(),
    );
  }
}
