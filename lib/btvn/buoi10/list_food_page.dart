import 'package:btvn_techmaster/base/ui/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_food_cubit.dart';

class ListFoodPage extends StatefulWidget {
  const ListFoodPage({Key? key}) : super(key: key);

  @override
  State<ListFoodPage> createState() => _ListFoodState();
}

class _ListFoodState extends State<ListFoodPage> {
  final _listFoodCubit = ListFoodCubit();

  @override
  initState() {
    _listFoodCubit.addListFood();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('On build Run');
    return BlocProvider<ListFoodCubit>(
      create: (context) => _listFoodCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Danh mục"),
          actions: [
            IconButton(
              onPressed: () => _listFoodCubit.nextPage(context),
              icon: const Icon(Icons.local_grocery_store, color: Colors.white),
            )
          ],
        ),
        body: BlocBuilder<ListFoodCubit, ListFoodState>(
          // bloc: _listFoodCubit,
          builder: (context, state) {
            print('On List Run');
            return ListviewWidget<FoodModel>(
              listData: _listFoodCubit.listFood,
              itemBuilder: (data, int index) {
                return ItemFoodWidget(
                  data: data,
                  index: index,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ItemFoodWidget extends StatefulWidget {
  final FoodModel data;
  final int index;

  const ItemFoodWidget({Key? key, required this.index, required this.data})
      : super(key: key);

  @override
  State<ItemFoodWidget> createState() => _ItemFoodWidgetState();
}

class _ItemFoodWidgetState extends State<ItemFoodWidget> {
  bool isFirst = true;
  ListFoodCubit? listFoodCubit;

  @override
  Widget build(BuildContext context) {
    if (isFirst == true) {
      isFirst = false;
      listFoodCubit = BlocProvider.of<ListFoodCubit>(context);
    }
    return BlocBuilder<ListFoodCubit, ListFoodState>(
        // bloc: widget.listFoodCubit,
        buildWhen: (context, state) {
      if (widget.data.id != listFoodCubit?.listFood[widget.index].id) {
        print("buildWhen ${listFoodCubit?.listFood[widget.index].name}");
        return false;
      }
      print("TRUEEEEE");
      return true;
    }, builder: (context, state) {
      print('On Item Run ${widget.data.name}');
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              color: widget.data.color,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.data.name ?? "",
                ),
              ),
            ),
            // BlocBuilder<ListFoodCubit, ListFoodState>(
            //     bloc: _listFoodCubit,
            //     builder: (context, state) {
            //       print('On Item Run');
            GestureDetector(
              onTap: () => listFoodCubit?.updateListFood(widget.index),
              child: Visibility(
                visible: widget.data.isCheck == true,
                replacement: const Text(
                  "Thêm",
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.green,
                ),
              ),
            ),
            // })
          ],
        ),
      );
    });
  }
}
