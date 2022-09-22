import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../base/navigator.dart';
import 'buy_food/buy_food_page.dart';

class ListFoodCubit extends Cubit<ListFoodState> {
  ListFoodCubit() : super(ListFoodInitState());
  List<FoodModel> listFood = [];
  List<FoodModel> listLocal = [];

  void addListFood() async {
    await getListFoodLocal();

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

    for (var dataFood in listFood) {
      for (var dataLocal in listLocal) {
        if (dataFood.id == dataLocal.id) dataFood.isCheck = true;
      }
    }

    emit(ListFoodState());
  }

  getListFoodLocal() async {
    SharedPreferences? pres;
    pres ??= await SharedPreferences.getInstance();
    List<String>? listString = pres.getStringList("ListFood");
    listString?.forEach((element) {
      listLocal.add(FoodModel().convertStringToModel(element));
    });
    print(listLocal.length);
  }

  void updateListFood(int index) {
    listFood[index].isCheck = !listFood[index].isCheck;
    emit(ListFoodItemState());
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

class ListFoodItemState extends ListFoodState {}

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

  String convertModelToString(FoodModel model) {
    Map<String, dynamic> dataJson = {};
    dataJson["id"] = model.id;
    dataJson["name"] = model.name;
    return jsonEncode(dataJson);
  }

  FoodModel convertStringToModel(String model) {
    Map<String, dynamic> params = jsonDecode(model);
    int id = params["id"];
    String name = params["name"];
    return FoodModel(
      id: id,
      name: name,
    );
  }
}
