import 'package:flutter/material.dart';

import '../../base/ui/app_bar.dart';
import '../model/item.dart';
import 'asnwer_widget.dart';
import 'question_widget.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  List<Item> items = [];
  Item? selectedItem;

  @override
  void initState() {
    items = Item.getLevelOne();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(title: "Dễ", action: [
        IconButton(
            onPressed: () {
              _refreshList();
            },
            icon: const Icon(Icons.refresh))
      ]),
      // backgroundColor: Colors.black.withOpacity(0.8),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg/bg_pokemon_one.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: GridView.builder(
            itemCount: items.length,
            // physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              Item data = items[index];
              return data.isFlip == true
                  ? AnswerWidget(data: data)
                  : GestureDetector(
                      onTap: () => onClickQuestion(data),
                      child: const QuestionWidget(),
                    );
            },
          ),
        ),
      ),
    );
  }

  bool isClick = false; // ngăn không cho bấm nhiều lần
  int numberClick = 0;
  int? currentClick;

  void onClickQuestion(Item data) async {
    if (isClick == true) return;
    final count = items.where((element) =>
        element.isFlip == false && selectedItem?.code == element.code);

    data.isFlip = !data.isFlip!;
    Item? selectedOld = selectedItem;

    if (count.isEmpty || selectedItem?.code == data.code) {
      if (selectedItem?.code == data.code) {
        numberClick++;
        currentClick = null;
        print(numberClick);
        selectedItem = null;
      } else {
        print("${selectedItem?.code}-${data.code}");
        selectedItem = data;
      }

      isClick = false;
      setState(() {});

      // hàm này nửa giây sau ẩn item
      await Future.delayed(const Duration(milliseconds: 500), () {
        if (selectedOld?.code == data.code) {
          for (var element in items) {
            if (element.code == selectedOld?.code) {
              element.isEnable = true;
            }
          }
        }
        setState(() {});
      });
    } else {
      selectedItem = null;
      setState(() {});
      isClick = true;
      // hàm này sẽ đóng widget khi chọn sai
      await Future.delayed(const Duration(milliseconds: 500), () {
        isClick = false;
        for (var element in items) {
          if (element.code == data.code ||
              selectedOld?.code == element.code && element.isFlip == true) {
            element.isFlip = false;
            element.isEnable = false;
          }
        }
        setState(() {});
      });
    }
  }

  void _refreshList() {
    for (var element in items) {
      element.isFlip = false;
      element.isEnable = false;
    }
    items.shuffle();

    setState(() {});
  }
}
