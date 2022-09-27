import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  List<Widget> tabs = [];
  List<Widget> pages = [];

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    tabs = [
      const Text(
        "Tat ca",
        style: TextStyle(color: Colors.black),
      ),
      const Text(
        "Chuyen di",
        style: TextStyle(color: Colors.black),
      ),
      const Text(
        "Giao dich",
        style: TextStyle(color: Colors.black),
      ),
      const Text(
        "Tin tuc",
        style: TextStyle(color: Colors.black),
      ),
    ];
    pages = [
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.green,
      ),
      Container(
        color: Colors.orange,
      ),
    ];
    controller.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Demo Tab Bar"),
        centerTitle: true,
        bottom: TabBar(
          padding: EdgeInsets.all(8),
          indicatorColor: Colors.white,
          indicator: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 1),
          ),
          indicatorPadding: EdgeInsets.all(8),
          controller: controller,
          tabs: tabs,
        ),
      ),
      body: Column(
        children: [
          // Container(
          //   height: 40,
          //   child: TabBar(
          //     controller: controller,
          //     tabs: tabs,
          //   ),
          // ),
          Expanded(
              child: TabBarView(
            controller: controller,
            children: pages,
          ))
        ],
      ),
    );
  }
}
