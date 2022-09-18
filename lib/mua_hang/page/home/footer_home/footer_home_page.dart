import 'package:btvn_techmaster/base/ui/image/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/ui/gridview_widget.dart';
import '../../../cubit/footer_home_cubit.dart';
import '../../../model/product_model.dart';

class FooterHomePage extends StatefulWidget {
  const FooterHomePage({Key? key}) : super(key: key);

  @override
  State<FooterHomePage> createState() => _FooterHomePageState();
}

class _FooterHomePageState extends State<FooterHomePage> {
  final _footerHomeCubit = FooterHomeCubit();

  @override
  initState() {
    _footerHomeCubit.addProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          BlocBuilder<FooterHomeCubit, FooterHomeState>(
              bloc: _footerHomeCubit,
              builder: (context, state) {
                return GridviewWidget<ProductModel>(
                  crossAxisCount: 2,
                  listData: _footerHomeCubit.listProduct,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 290,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  itemBuilder: (data, int index) {
                    return _buildProductItem(data);
                  },
                );
              }),
          GestureDetector(
            onTap: _footerHomeCubit.addProduct,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Xem thêm",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(ProductModel data) {
    return LayoutBuilder(
      builder: (context, constrainBox) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NetworkWidget(
                width: constrainBox.maxWidth,
                height: constrainBox.maxWidth,
                url: data.image,
              ),
              Container(
                height: constrainBox.maxHeight -
                    constrainBox.maxWidth -
                    2, // trừ 2 do có viền trên dưới = 2
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          // data.id! % 3 != 0
                          //     ? data.name ?? ""
                          //     : data.image ?? "",
                          data.name ?? "",
                          // style: TextStyle(overflow: TextOverflow.ellipsis),
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        "${data.offer}% Giảm",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "đ${data.price}",
                          style:
                              const TextStyle(color: Colors.red, fontSize: 16),
                        ),
                        Text(
                          "Đã bán ${data.sold}",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
