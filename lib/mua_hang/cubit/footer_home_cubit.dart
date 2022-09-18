import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/product_model.dart';

class FooterHomeCubit extends Cubit<FooterHomeState> {
  FooterHomeCubit() : super(FooterHomeInitState());
  List<ProductModel> listProduct = [];
  // int

  int pageProduct = 0; // số lần hiển thị dữ liệu
  int idProductBestHigh = 0; // lấy id cao nhất

  void addProduct() {
    pageProduct += 10;
    for (int i = 1; i <= 10; i++) {
      listProduct.add(ProductModel(
        id: idProductBestHigh + i,
        name: (idProductBestHigh + i).toString(),
        offer: Random().nextInt(100),
        price: Random().nextInt(50000) * 1000,
        sold: Random().nextInt(500),
        image:
            "https://lzd-img-global.slatic.net/g/p/982c0b4d2f4f5a1157e3eb3036fd9f09.jpg_240x240q80.jpg",
      ));
      if (i == 10) {
        // cuối for mới vào đây
        idProductBestHigh = idProductBestHigh + 10;
      }
    }
    emit(FooterHomeState());
  }
}

class FooterHomeState {}

class FooterHomeInitState extends FooterHomeState {}
