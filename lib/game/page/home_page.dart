import 'package:flutter/material.dart';

import '../../base/navigator.dart';
import 'cards_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg/bg_pokemon_one.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(
                text: "Dễ",
                onTap: () {
                  navigatorPush(context, const CardsPage());
                }),
            _buildButton(text: "Trung Bình", onTap: () {}),
            _buildButton(text: "Khó", onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({required String text, required Function() onTap}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.grey, width: 1),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 22,
                offset: Offset(0, 1),
              ),
            ]),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
