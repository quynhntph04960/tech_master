import 'package:btvn_techmaster/base/ui/image/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/ui/listview_widget.dart';
import '../../../cubit/header_home_one_cubit.dart';

class HeaderHomeOnePage extends StatefulWidget {
  const HeaderHomeOnePage({Key? key}) : super(key: key);

  @override
  State<HeaderHomeOnePage> createState() => _HeaderHomeOnePageState();
}

class _HeaderHomeOnePageState extends State<HeaderHomeOnePage> {
  final heightItem = 10.0;
  final marginItem = 2.5;
  final marginList = 50.0;
  double widthList = 0.0;

  final _heardHomeCubit = HeaderHomeOneCubit();

  @override
  void initState() {
    _heardHomeCubit.addListPageView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    widthList =
        (_heardHomeCubit.listData.length + 1) * (heightItem + marginItem) >
                (size.width - marginList)
            ? size.width - marginList
            : (_heardHomeCubit.listData.length + 1) * (heightItem + marginItem);
    return BlocBuilder<HeaderHomeOneCubit, HeaderHomeOneState>(
      bloc: _heardHomeCubit,
      builder: (context, state) {
        if (state is PageViewInitState) {
          return Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 170,
                child: PageView.builder(
                  itemCount: _heardHomeCubit.listData.length,
                  onPageChanged: _heardHomeCubit.onChangePosition,
                  itemBuilder: (context, index) {
                    return NetworkWidget(
                      url: _heardHomeCubit.listData[index],
                      width: double.infinity,
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 10,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: marginList),
                  height: heightItem,
                  width: widthList,
                  child: ListviewWidget<String>(
                    listData: _heardHomeCubit.listData,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (data, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: marginItem),
                        decoration: BoxDecoration(
                          color: _heardHomeCubit.positionPageView == index
                              ? Colors.blue
                              : Colors.grey.shade500,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: heightItem,
                        width: heightItem,
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }
        return const Center(
          child: Text("Loading PageViewInitState"),
        );
      },
    );
  }
}
