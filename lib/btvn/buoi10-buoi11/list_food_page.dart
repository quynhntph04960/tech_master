import 'package:btvn_techmaster/base/ui/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'food_model.dart';
import 'item_food/item_food_widget.dart';
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
                  callBack: (index) => _listFoodCubit.updateListFood(index),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
