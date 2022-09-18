import 'package:flutter/material.dart';

import '../base/ui/listview_widget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<String> listData = [
    "Giao dịch",
    " ưu đãi",
    "Cập nhật",
    "Tất cả",
    "Đã xem",
    "Chưa đọc",
    "Tin cũ",
  ];

  List<NotificationModel> listNotification = [];

  int position = 0;

  @override
  initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      listNotification.add(NotificationModel(
          content: "content$i",
          image: "image$i",
          name: "name$i",
          time: "time$i",
          title: "title$i"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(child: _buildListBody()),
        ],
      ),
    );
  }

  Widget _buildListBody() {
    return ListviewWidget<NotificationModel>(
      listData: listNotification,
      itemBuilder: (data, int index) {
        return Container(
          padding: const EdgeInsets.only(right: 16, bottom: 8, top: 8),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    const Icon(Icons.phone_android),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(data.title ?? ""),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("${data.time}"),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(Icons.abc)
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("${data.name}"),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("${data.content}"),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 50,
      child: ListviewWidget<String>(
        scrollDirection: Axis.horizontal,
        listData: listData,
        onTap: (data, int index) {
          position = index;
          setState(() {});
        },
        itemBuilder: (data, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: position == index ? Colors.pink : Colors.grey.shade200,
            ),
            child: Text(
              data,
              style: TextStyle(
                color: position == index ? Colors.white : Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text("Thông báo 17"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.check_circle_outline_sharp,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.check_circle_outline_sharp,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class NotificationModel {
  final String? image;
  final String? name;
  final String? time;
  final String? title;
  final String? content;

  NotificationModel(
      {this.image, this.name, this.time, this.title, this.content});
}
