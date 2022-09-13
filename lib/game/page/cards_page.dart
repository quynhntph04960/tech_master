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
  var selectedItem = '';

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
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
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

  bool isClick = false;

  void onClickQuestion(Item data) async {
    if (isClick == true) return;
    final count = items.where(
        (element) => element.isFlip == false && selectedItem == element.code);

    data.isFlip = !data.isFlip!;

    if (count.isEmpty || selectedItem == data.code) {
      selectedItem = data.code;
      isClick = false;
      setState(() {});
    } else {
      selectedItem = "";
      setState(() {});
      isClick = true;
      await Future.delayed(
        const Duration(seconds: 1),
        () {
          isClick = false;
          _refreshList();
        },
      );
    }
  }

  void _refreshList() {
    for (var element in items) {
      element.isFlip = false;
    }
    items.shuffle();

    setState(() {});
  }
}