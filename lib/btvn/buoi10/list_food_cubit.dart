import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/navigator.dart';
import 'buy_food/buy_food_page.dart';

class ListFoodCubit extends Cubit<ListFoodState> {
  ListFoodCubit() : super(ListFoodInitState());
  List<FoodModel> listFood = [];

  void addListFood() {
    List<String> itemNames = [
      "Gà KFC",
      "Trà sữa",
      "Vịt quay bắc kinh",
      "Sữa chua hạ long",
      "Gà ủ muối",
      "Bia Tiger",
      "Spaghetti",
      "Pizza",
      "Bánh mì hội an",
      "Phở thìn",
      "Chân gà",
      "Coffee",
      "Trà",
      "Xôi",
      "Cơm",
    ];

    for (int i = 0; i < itemNames.length; i++) {
      listFood.add(
        FoodModel(
          id: i,
          name: itemNames[i],
        ),
      );
    }
    emit(ListFoodState());
  }

  void updateListFood(int index) {
    listFood[index].isCheck = !listFood[index].isCheck;
    emit(ListFoodState());
  }

  nextPage(BuildContext context) {
    final listNew = <FoodModel>[];
    for (var element in listFood) {
      if (element.isCheck == true) listNew.add(element);
    }
    if (listNew.isEmpty) return;
    navigatorPush(context, BuyFoodPage(listFood: listNew));
  }
}

class ListFoodState {}

class ListFoodInitState extends ListFoodState {}

class FoodModel {
  final int? id;
  int? price;
  final String? name;
  Color? color;
  bool isCheck;

  FoodModel(
      {this.id, this.price, this.name, this.color, this.isCheck = false}) {
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    price = Random().nextInt(200);
  }
}
