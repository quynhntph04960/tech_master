import 'package:flutter/material.dart';

import '../../base/ui/button_widget.dart';
import '../../base/ui/field_widget.dart';
import '../../base/ui/gridview_widget.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController describeController = TextEditingController();
  List<int> listData = [0];
  int tang = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Báo cáo"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            FieldWidget(
              controller: titleController,
              hintText: "Nhập tiêu đề",
              labelText: "Tiêu đề",
            ),
            const SizedBox(
              height: 16,
            ),
            FieldWidget(
              controller: describeController,
              maxLines: 5,
              minLines: 3,
              hintText: "Nhập nội dung",
              labelText: "Nội dung",
            ),
            const SizedBox(
              height: 16,
            ),
            _gridviewWidget(),
            const SizedBox(
              height: 16,
            ),
            ButtonWidget(
              alignment: Alignment.center,
              onPressed: () {},
              text: "Lưu",
            )
          ],
        ),
      ),
    );
  }

  Widget _gridviewWidget() {
    return GridviewWidget(
      listData: listData,
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.5,
      crossAxisSpacing: 16,
      crossAxisCount: 3,
      itemBuilder: (data, index) {
        if (data == 0) {
          return GestureDetector(
            onTap: () {
              tang++;
              listData.insert(listData.length - 1, tang);
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey, width: 2),
              ),
              child: const Icon(Icons.add, size: 32, color: Colors.black),
            ),
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
