import 'package:flutter/material.dart';

import '../../buoi10-buoi11/food_model.dart';

class BuyShopProvider {
  final buyShopNotifier = BuyShopNotifierProvider();
  List<FoodModel> listBuyFood = [];
  int sunMoney = 0;

  BuyShopProvider();

  void addLisBuyFood({required List<FoodModel> listFood}) {
    listBuyFood.addAll(listFood);
    sumMoneyFood();
  }

  void sumMoneyFood() {
    sunMoney = 0;
    for (var element in listBuyFood) {
      sunMoney = sunMoney + (element.price ?? 0);
    }
    notifyListeners();
  }

  void removeFood(int index) {
    listBuyFood.removeAt(index);
    sumMoneyFood();
  }

  void notifyListeners() {
    buyShopNotifier.notifyListeners();
  }
}

class BuyShopNotifierProvider extends ChangeNotifier {}
