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
    return Scaffold(
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
        bloc: _listFoodCubit,
        builder: (context, state) {
          return ListviewWidget<FoodModel>(
            listData: _listFoodCubit.listFood,
            itemBuilder: (data, int index) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      color: data.color,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          data.name ?? "",
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _listFoodCubit.updateListFood(index),
                      child: Visibility(
                        visible: data.isCheck == true,
                        replacement: const Text(
                          "Thêm",
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
