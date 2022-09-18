import 'package:flutter/material.dart';

import 'body_home/body_home_page.dart';
import 'footer_home/footer_home_page.dart';
import 'header_home/header_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: const [
          HeaderHomePage(),
          BodyHomePage(),
          FooterHomePage(),
        ],
      ),
    );
  }
}
