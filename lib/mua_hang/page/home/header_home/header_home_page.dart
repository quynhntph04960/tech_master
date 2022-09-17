import 'package:flutter/material.dart';

import 'header_home_four_page.dart';
import 'header_home_one_page.dart';
import 'header_home_three_page.dart';
import 'header_home_two_page.dart';

class HeaderHomePage extends StatefulWidget {
  const HeaderHomePage({Key? key}) : super(key: key);

  @override
  State<HeaderHomePage> createState() => _HeaderHomePageState();
}

class _HeaderHomePageState extends State<HeaderHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        HeaderHomeOnePage(),
        HeaderHomeTwoPage(),
        Divider(),
        HeaderHomeThree(),
        HeaderHomeFourPage()
      ],
    );
  }
}
