import 'package:btvn_techmaster/btvn/buoi10-buoi11/food_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemFoodCubit extends Cubit<ItemFoodState> {
  ItemFoodCubit() : super(ItemFoodInitState());

  FoodModel data = FoodModel();

  void addFood(FoodModel data) {
    this.data.id = data.id;
    this.data.name = data.name;
    this.data.isCheck = data.isCheck;
    this.data.color = data.color;
    this.data.price = data.price;
    emit(ItemFoodState());
  }

  void updateItem() {
    bool check = data.isCheck;
    bool check2 = !check;
    data.isCheck = check2;
    emit(ItemFoodState());
  }
}

class ItemFoodState {}

class ItemFoodInitState extends ItemFoodState {}
