import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderHomeOneCubit extends Cubit<HeaderHomeOneState> {
  HeaderHomeOneCubit() : super(HeaderHomeOneInitState());

  int positionPageView = 0;
  List<String> listData = [];

  void onChangePosition(int index) {
    positionPageView = index;
    emit(PageViewInitState());
  }

  void addListPageView() {
    listData = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdUsf1NY7Qdlu8893EbR53NzTuHCcI3XlVRA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdUsf1NY7Qdlu8893EbR53NzTuHCcI3XlVRA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdUsf1NY7Qdlu8893EbR53NzTuHCcI3XlVRA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdUsf1NY7Qdlu8893EbR53NzTuHCcI3XlVRA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdUsf1NY7Qdlu8893EbR53NzTuHCcI3XlVRA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdUsf1NY7Qdlu8893EbR53NzTuHCcI3XlVRA&usqp=CAU",
    ];
    emit(PageViewInitState());
  }
}

class HeaderHomeOneState {}

class HeaderHomeOneInitState extends HeaderHomeOneState {}

class PageViewInitState extends HeaderHomeOneState {}
