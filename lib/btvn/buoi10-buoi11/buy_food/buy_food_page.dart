import 'package:btvn_techmaster/base/ui/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../list_food_cubit.dart';
import 'buy_food_cubit.dart';

class BuyFoodPage extends StatefulWidget {
  final List<FoodModel> listFood;
  const BuyFoodPage({Key? key, required this.listFood}) : super(key: key);

  @override
  State<BuyFoodPage> createState() => _BuyFoodState();
}

class _BuyFoodState extends State<BuyFoodPage> {
  final _buyFoodCubit = BuyFoodCubit();

  @override
  initState() {
    _buyFoodCubit.addLisBuyFood(listFood: widget.listFood);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: BlocConsumer<BuyFoodCubit, BuyFoodState>(
          bloc: _buyFoodCubit,
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  flex: 3,
                  child: ListviewWidget<FoodModel>(
                    listData: _buyFoodCubit.listBuyFood,
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
                              onPressed: () => _buyFoodCubit.removeFood(index),
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
                          "\$${_buyFoodCubit.sunMoney.toString()}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 40),
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
    );
  }
}
