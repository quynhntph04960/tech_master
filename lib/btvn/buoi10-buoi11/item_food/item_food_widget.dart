import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../food_model.dart';
import 'item_food_cubit.dart';

class ItemFoodWidget extends StatelessWidget {
  final FoodModel data;
  final int index;
  final Function(int index) callBack;

  ItemFoodWidget(
      {Key? key,
      required this.index,
      required this.data,
      required this.callBack})
      : super(key: key);

  ItemFoodCubit? itemFoodCubit;

  @override
  Widget build(BuildContext context) {
    itemFoodCubit ??= ItemFoodCubit();
    itemFoodCubit?.addFood(data);

    return BlocBuilder<ItemFoodCubit, ItemFoodState>(
      bloc: itemFoodCubit,
      // buildWhen: (context, state) {
      //   if (widget.data.id != listFoodCubit?.listFood[widget.index].id) {
      //     print("buildWhen ${listFoodCubit?.listFood[widget.index].name}");
      //     return false;
      //   }
      //   print("TRUEEEEE");
      //   return true;
      // },
      builder: (context, state) {
        print('On Item Run ${itemFoodCubit?.data.name}');
        print('isCheck =  ${itemFoodCubit?.data.isCheck}');
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                color: itemFoodCubit?.data.color,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    itemFoodCubit?.data.name ?? "",
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  itemFoodCubit?.updateItem();
                  callBack(index);
                },
                child: Visibility(
                  visible: itemFoodCubit?.data.isCheck == true,
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
  }
}

// class ItemFoodWidget extends StatefulWidget {
//   final FoodModel data;
//   final int index;
//   final Function(int index) callBack;
//
//   const ItemFoodWidget(
//       {Key? key,
//       required this.index,
//       required this.data,
//       required this.callBack})
//       : super(key: key);
//
//   @override
//   State<ItemFoodWidget> createState() => _ItemFoodWidgetState();
// }
//
// class _ItemFoodWidgetState extends State<ItemFoodWidget> {
//   ItemFoodCubit itemFoodCubit = ItemFoodCubit();
//
//   @override
//   void initState() {
//     itemFoodCubit.addFood(widget.data);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ItemFoodCubit, ItemFoodState>(
//       bloc: itemFoodCubit,
//       // buildWhen: (context, state) {
//       //   if (widget.data.id != listFoodCubit?.listFood[widget.index].id) {
//       //     print("buildWhen ${listFoodCubit?.listFood[widget.index].name}");
//       //     return false;
//       //   }
//       //   print("TRUEEEEE");
//       //   return true;
//       // },
//       builder: (context, state) {
//         print('On Item Run ${itemFoodCubit.data.name}');
//         print('isCheck =  ${itemFoodCubit.data.isCheck}');
//         return Container(
//           padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//           child: Row(
//             children: [
//               Container(
//                 height: 40,
//                 width: 40,
//                 color: itemFoodCubit.data.color,
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Text(
//                     itemFoodCubit.data.name ?? "",
//                   ),
//                 ),
//               ),
//               // BlocBuilder<ListFoodCubit, ListFoodState>(
//               //     bloc: _listFoodCubit,
//               //     builder: (context, state) {
//               //       print('On Item Run');
//               GestureDetector(
//                 onTap: () {
//                   itemFoodCubit.updateItem();
//                   widget.callBack(widget.index);
//                 },
//                 child: Visibility(
//                   visible: itemFoodCubit.data.isCheck == true,
//                   replacement: const Text(
//                     "Thêm",
//                   ),
//                   child: const Icon(
//                     Icons.check,
//                     color: Colors.green,
//                   ),
//                 ),
//               ),
//               // })
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
