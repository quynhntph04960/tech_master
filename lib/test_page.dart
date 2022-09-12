import 'package:btvn_techmaster/base/navigator.dart';
import 'package:btvn_techmaster/main.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  final int page;
  const TestPage({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(page.toString()),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                var number = page + 1;
                navigatorPush(
                    keyMaterial.currentContext!,
                    TestPage(
                      page: number,
                    ));
              },
              child: Text("Test Page")),
          SizedBox(
            height: 16,
            width: double.infinity,
          ),
          TextButton(
              onPressed: () {
                if (Navigator.of(keyMaterial.currentContext!).canPop()) {
                  Navigator.of(keyMaterial.currentContext!).pop();
                } else {
                  print("Trang đầu tiên không back lại dc nữa!!!!!!");
                }
              },
              child: Text("Back Page")),
        ],
      ),
    );
  }
}
