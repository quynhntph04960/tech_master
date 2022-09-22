import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../food_model.dart';

class BuyFoodCubit extends Cubit<BuyFoodState> {
  BuyFoodCubit() : super(BuyFoodInitState());
  List<FoodModel> listBuyFood = [];
  int sunMoney = 0;

  void addLisBuyFood({required List<FoodModel> listFood}) {
    listBuyFood.addAll(listFood);
    sumMoneyFood();
    emit(BuyFoodState());

    saveListFoodLocal();
  }

  saveListFoodLocal() async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    List<String> listString = [];
    for (var element in listBuyFood) {
      String data = FoodModel().convertModelToString(element);
      listString.add(data);
    }
    await pres.setStringList("ListFood", listString);
  }

  void sumMoneyFood() {
    sunMoney = 0;
    for (var element in listBuyFood) {
      sunMoney = sunMoney + (element.price ?? 0);
    }
  }

  void removeFood(int index) {
    listBuyFood.removeAt(index);
    sumMoneyFood();
    emit(BuyFoodState());

    saveListFoodLocal();
  }
}

class BuyFoodState {}

class BuyFoodInitState extends BuyFoodState {}
