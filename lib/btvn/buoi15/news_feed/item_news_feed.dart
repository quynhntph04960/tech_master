import 'package:flutter/material.dart';

import '../../../base/ui/gridview_widget.dart';

class ItemNewsFeed extends StatelessWidget {
  const ItemNewsFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.network(
                    "https://data.designervn.net/2022/04/14386_socail-messenger-app-logo.jpg",
                    height: 48,
                    width: 48),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Nguyễn Trọng Quỳnh",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "0393923233",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Text(
                  "Không duyệt",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ],
          ),
          const Divider(),
          const Text(
            "Hầm B bị ngập nước",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Sau 15 năm hoạt động, kênh truyền hình Thanh thiếu niên VTV6 của Đài Truyền hình Việt Nam sẽ chính thức giải thể vào ngày 14/10 tới. Từ 15/10/2022, và sẽ được thay thế bằng kênh truyền hình VTV Cần Thơ.",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          _gridviewWidget(),
        ],
      ),
    );
  }

  Widget _gridviewWidget() {
    List<int> listData = [1, 2, 3];
    List<int> listNew = [];
    for (var element in listData) {
      if (listNew.length == 2) {
        listNew.add(0);
      }
      if (listNew.length < 2) {
        listNew.add(element);
      }
    }
    return GridviewWidget(
      listData: listNew,
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.5,
      crossAxisSpacing: 16,
      crossAxisCount: listData.length == 1
          ? 1
          : listData.length == 2
              ? 2
              : 3,
      itemBuilder: (data, index) {
        if (data == 0) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: const Icon(Icons.add, size: 32, color: Colors.black),
          );
        }
        return Container(
          height: 50,
          color: Colors.blue,
          alignment: Alignment.topCenter,
          child: Image.network(
            width: double.infinity,
            fit: BoxFit.cover,
            "https://thumbs.dreamstime.com/z/colorful-world-famous-rubik-s-cube-background-colorful-world-famous-rubik-s-cube-background-brain-game-rubik-cube-173241206.jpg",
          ),
        );
      },
    );
  }
}
