import 'package:btvn_techmaster/base/ui/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../buoi10-buoi11/food_model.dart';
import 'mini_shop_provider.dart';

class MiniShopPage extends StatefulWidget {
  const MiniShopPage({Key? key}) : super(key: key);

  @override
  State<MiniShopPage> createState() => _MiniShopPageState();
}

class _MiniShopPageState extends State<MiniShopPage> {
  final _provider = MiniShopProvider();

  @override
  void initState() {
    // TODO: implement initState
    _provider.getDataShop();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mini Shop"),
      ),
      body: ChangeNotifierProvider.value(
        value: _provider.notifierProvider,
        child: Consumer<ShopNotifierProvider>(builder: (_, __, ___) {
          return ListviewWidget<FoodModel>(
            listData: _provider.listShop,
            itemBuilder: (data, index) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      color: data.color,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          data.name ?? "",
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _provider.updateItem(index: index),
                      child: Visibility(
                        visible: data.isCheck == true,
                        replacement: const Text(
                          "Thêm",
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
