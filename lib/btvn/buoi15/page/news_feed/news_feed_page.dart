import 'package:btvn_techmaster/base/ui/listview_widget.dart';
import 'package:btvn_techmaster/btvn/buoi15/model/list_issues_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../fcm/fcm_manager.dart';
import '../menu/left_menu_page.dart';
import 'item_news_feed.dart';
import 'news_feed_cubit.dart';

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({Key? key}) : super(key: key);

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  final _cubit = NewsFeedCubit();

  @override
  void initState() {
    // TODO: implement initState
    _cubit.listIssues();
    fcm.requestPermission();
    super.initState();
  }

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
      body: BlocBuilder<NewsFeedCubit, NewsFeedState>(
        bloc: _cubit,
        builder: (context, state) {
          return ListviewWidget<DataIssues>(
            listData: state.listIssues ?? [],
            itemBuilder: (data, index) {
              if (index == ((state.listIssues?.length ?? 0) - 1)) {
                _cubit.listIssues();
              }
              return ItemNewsFeed(data: data);
            },
          );
        },
      ),
    );
  }
}
