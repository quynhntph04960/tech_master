import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

class FoodModel {
  int? id;
  int? price;
  String? name;
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
