import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderHomeOneCubit extends Cubit<HeaderHomeOneState> {
  PageController controller = PageController();
  int positionPageView = 0;
  List<String> listData = [];
  bool isCheckLifeCycle = false;

  HeaderHomeOneCubit() : super(HeaderHomeOneInitState());

  void onChangePosition(int index) {
    positionPageView = index;
    emit(PageViewInitState());
  }

  callDurationAllTime() async {
    if (isCheckLifeCycle == true) return;
    await Future.delayed(const Duration(seconds: 10)).then((value) {});
    positionPageView == listData.length
        ? positionPageView = 0
        : positionPageView++;
    controller.jumpToPage(positionPageView);
    emit(PageViewInitState());
    callDurationAllTime();
  }

  void addListPageView() {
    listData = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdUsf1NY7Qdlu8893EbR53NzTuHCcI3XlVRA&usqp=CAU",
      "https://cf.shopee.vn/file/31ebf31c2f533d6420ff1c53425bcf8c_xxhdpi",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdUsf1NY7Qdlu8893EbR53NzTuHCcI3XlVRA&usqp=CAU",
      "https://cf.shopee.vn/file/31ebf31c2f533d6420ff1c53425bcf8c_xxhdpi",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdUsf1NY7Qdlu8893EbR53NzTuHCcI3XlVRA&usqp=CAU",
      "https://cf.shopee.vn/file/31ebf31c2f533d6420ff1c53425bcf8c_xxhdpi",
    ];
    emit(PageViewInitState());
  }
}

class HeaderHomeOneState {}

class HeaderHomeOneInitState extends HeaderHomeOneState {}

class PageViewInitState extends HeaderHomeOneState {}
