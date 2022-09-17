import 'package:btvn_techmaster/base/navigator.dart';
import 'package:flutter/material.dart';

import '../../../base/utils/style.dart';
import '../../../base/utils/text_style.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: Style.decorationFrame,
              child: const Icon(
                Icons.local_grocery_store,
                size: 200,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Mua dùng hàng nhanh",
              style: FormText.titleLinearGradient,
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      navigatorPushReplacement(context, const LoginPage());
    });
  }
}
