import 'package:btvn_techmaster/base/ui/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../buoi10-buoi11/food_model.dart';
import 'buy_shop_cubit.dart';

class BuyShopPage extends StatefulWidget {
  final List<FoodModel> listFood;
  const BuyShopPage({Key? key, required this.listFood}) : super(key: key);

  @override
  State<BuyShopPage> createState() => _BuyShopState();
}

class _BuyShopState extends State<BuyShopPage> {
  final _provider = BuyShopProvider();

  @override
  initState() {
    _provider.addLisBuyFood(listFood: widget.listFood);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ChangeNotifierProvider.value(
        value: _provider.buyShopNotifier,
        child: Consumer<BuyShopNotifierProvider>(builder: (_, __, ___) {
          return Column(
            children: [
              Expanded(
                flex: 3,
                child: ListviewWidget<FoodModel>(
                  listData: _provider.listBuyFood,
                  itemBuilder: (data, int index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                          Expanded(child: Text(data.name ?? "")),
                          IconButton(
                            onPressed: () => _provider.removeFood(index),
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.amberAccent,
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$${_provider.sunMoney.toString()}",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 40),
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Buy",
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
