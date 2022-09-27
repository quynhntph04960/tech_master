import 'package:flutter/material.dart';

import 'tab_bar_page.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        enableFeedback: true,
        type: BottomNavigationBarType.fixed,
        // selectedFontSize: 0,
        // unselectedFontSize: 0,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        elevation: 10,
        items: [
          _buildIcon(image: "tab_account", name: "account"),
          _buildIcon(image: "tab_history", name: "history"),
          _buildIcon(image: "tab_home", name: "home"),
          _buildIcon(image: "tab_notify", name: "notify"),
          _buildIcon(image: "tab_wallet", name: "wallet"),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildIcon({String? image, String? name}) {
    String image2 = "assets/icon/${image ?? ""}_on.png";
    String image3 = "assets/icon/${image ?? ""}.png";
    return BottomNavigationBarItem(
      icon: Image.asset(image3),
      activeIcon: Image.asset(image2),
      tooltip: name,
      label: '12312312',
    );
  }
}
