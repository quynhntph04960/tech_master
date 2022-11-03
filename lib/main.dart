import 'package:btvn_techmaster/base/service/localtion_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'base/ui/loading_dialog.dart';

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
      home: const GPSpage(),
    );
  }
}

class GPSpage extends StatefulWidget {
  const GPSpage({Key? key}) : super(key: key);

  @override
  State<GPSpage> createState() => _GPSpageState();
}

class _GPSpageState extends State<GPSpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (value) {
                locationManager.searchByText(value);
              },
            ),
            TextButton(
              child: Text("Location"),
              onPressed: () {
                locationManager.getCurrentPosition().then((value) {
                  print(value.latitude);
                  print(value.longitude);
                }).catchError((e) {
                  print(e);
                });
              },
            ),
            TextButton(
              child: Text("get detail current position"),
              onPressed: () {
                locationManager.getCurrentPosition().then((value) {
                  print(value.latitude);
                  print(value.longitude);
                  locationManager.getDetailsPosition(
                      value.latitude, value.longitude);
                }).catchError((e) {
                  print(e);
                });
              },
            ),
            TextButton(
              child: Text("listener"),
              onPressed: () {
                locationManager.listen();
              },
            ),
            TextButton(
              child: Text("stop"),
              onPressed: () {
                locationManager.stop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
