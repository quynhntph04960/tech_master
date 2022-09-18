import 'package:btvn_techmaster/base/ui/image/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/header_home_three_cubit.dart';

class HeaderHomeThree extends StatefulWidget {
  const HeaderHomeThree({Key? key}) : super(key: key);

  @override
  State<HeaderHomeThree> createState() => _HeaderHomeThreeState();
}

class _HeaderHomeThreeState extends State<HeaderHomeThree> {
  final _headerHomeThreeCubit = HeaderHomeThreeCubit();

  @override
  void initState() {
    _headerHomeThreeCubit.addListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:Theme.of(context).appBarTheme.backgroundColor
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      height: 180,
      alignment: Alignment.center,
      child: BlocBuilder<HeaderHomeThreeCubit, HeaderHomeThreeState>(
        bloc: _headerHomeThreeCubit,
        builder: (context, state) {
          if (state is HeaderHomeThreeState) {
            return GridView.builder(
              itemCount: _headerHomeThreeCubit.listData.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final data = _headerHomeThreeCubit.listData[index];
                return LayoutBuilder(
                  builder: (context, contain) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: NetworkWidget(
                            width: contain.maxWidth / 2,
                            height: contain.maxWidth / 2,
                            url:
                                "https://i.pinimg.com/originals/d1/47/93/d14793ac55dd01ebae55488e209c8441.gif",
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Flexible(
                          child: Text(
                            data.title ?? "",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 10),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          }
          return const Center(
            child: Text("Loading PageViewInitState"),
          );
        },
      ),
    );
  }
}
