import 'package:btvn_techmaster/base/ui/listview_widget.dart';
import 'package:flutter/material.dart';

import '../left_menu_page.dart';
import 'item_news_feed.dart';

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({Key? key}) : super(key: key);

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sự cố"),
      ),
      drawer: const Drawer(
        // width: MediaQuery.of(context).size.width / 1.5,
        child: LeftMenuPage(),
      ),
      body: ListviewWidget(
        listData: [1, 2, 3, 4, 5, 6, 7, 8, 9, 0],
        itemBuilder: (data, index) {
          return const ItemNewsFeed();
        },
      ),
    );
  }
}
