import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/header_home_three_model.dart';

class HeaderHomeThreeCubit extends Cubit<HeaderHomeThreeState> {
  HeaderHomeThreeCubit() : super(HeaderHomeThreeInitState());

  List<HeaderHomeThreeModel> listData = [];

  void addListData() {
    listData.add(HeaderHomeThreeModel(id: 0, title: "Khung Giờ Săn Sale"));
    listData.add(HeaderHomeThreeModel(id: 1, title: "ShoppeeFood - 99K"));
    listData.add(
        HeaderHomeThreeModel(id: 1, title: "Gì Cũng Rẻ - Mua Là Freeship"));
    listData.add(HeaderHomeThreeModel(id: 1, title: "Nhận đến 1 triệu Xu"));
    listData.add(HeaderHomeThreeModel(id: 1, title: "Mã giảm giá"));
    listData.add(HeaderHomeThreeModel(id: 2, title: "Miễn Phí Vận Chuyển"));
    listData.add(HeaderHomeThreeModel(id: 3, title: "Bắt Trend - Giá Sốc"));
    listData.add(HeaderHomeThreeModel(id: 4, title: "Săn Xu mỗi ngày"));
    listData.add(HeaderHomeThreeModel(id: 5, title: "FreeShipp 30k đơn 0Đ"));
    listData.add(HeaderHomeThreeModel(id: 6, title: "Bắt trend - Giá sốc"));
    listData
        .add(HeaderHomeThreeModel(id: 7, title: "Hoàn Xu 10% - Lên Đến 200K"));
    listData.add(HeaderHomeThreeModel(id: 8, title: "Hàng Hiệu Giá Tốt"));
    listData.add(HeaderHomeThreeModel(id: 9, title: "Hàng Quốc Tế"));
    listData.add(HeaderHomeThreeModel(id: 9, title: "Shopee mail"));
    listData.add(HeaderHomeThreeModel(id: 10, title: "Nạp Thẻ & Dịch Vụ"));
    listData
        .add(HeaderHomeThreeModel(id: 11, title: "Ưu đãi thành viên tới 50%"));
    listData.add(HeaderHomeThreeModel(id: 12, title: "Deal Sốc Từ 1K"));
    listData.add(HeaderHomeThreeModel(id: 13, title: "Shopee Premium"));
    listData.add(
        HeaderHomeThreeModel(id: 14, title: "ShopeePay gần bạn - chỉ từ 1K"));
    listData.add(HeaderHomeThreeModel(id: 15, title: "Săn thưởng - 100k Xu"));
    listData.add(HeaderHomeThreeModel(id: 16, title: "Ưu đãi đối tác"));
    listData.add(HeaderHomeThreeModel(id: 17, title: "Shopee Mart"));
    listData.add(HeaderHomeThreeModel(id: 18, title: "Giới thiệu bạn bè"));
    listData.add(HeaderHomeThreeModel(id: 19, title: "Tech Zone"));
    emit(HeaderHomeThreeState());
  }
}

class HeaderHomeThreeState {}

class HeaderHomeThreeInitState extends HeaderHomeThreeState {}
