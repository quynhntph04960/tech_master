import 'package:flutter/material.dart';

import '../../base/utils/common_function.dart';
import '../buoi10-buoi11/food_model.dart';
import 'buy_shop/buy_shop_page.dart';

class MiniShopProvider {
  ShopNotifierProvider notifierProvider = ShopNotifierProvider();
  List<FoodModel> listShop = [];
  MiniShopProvider();

  void getDataShop() {
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
      listShop.add(
        FoodModel(
          id: i,
          name: itemNames[i],
        ),
      );
    }
    notifyListeners();
  }

  void updateItem({required int index}) {
    print(index);
    listShop[index].isCheck = !listShop[index].isCheck;
    notifyListeners();
  }

  void notifyListeners() {
    notifierProvider.notifyListeners();
  }

  nextPage(BuildContext context) {
    final listNew = <FoodModel>[];
    for (var element in listShop) {
      if (element.isCheck == true) listNew.add(element);
    }
    if (listNew.isEmpty) return;
    navigatorPush(context, BuyShopPage(listFood: listNew));
  }
}

class ShopNotifierProvider extends ChangeNotifier {}
