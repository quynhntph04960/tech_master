import 'package:flutter_bloc/flutter_bloc.dart';

import '../list_food_cubit.dart';

class BuyFoodCubit extends Cubit<BuyFoodState> {
  BuyFoodCubit() : super(BuyFoodInitState());
  List<FoodModel> listBuyFood = [];
  int sunMoney = 0;

  void addLisBuyFood({required List<FoodModel> listFood}) {
    listBuyFood.addAll(listFood);
    sumMoneyFood();
    emit(BuyFoodState());
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
  }
}

class BuyFoodState {}

class BuyFoodInitState extends BuyFoodState {}
