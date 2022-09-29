import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottombar_page/bottom_cubit.dart';

class OnePage extends StatefulWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  @override
  Widget build(BuildContext context) {
    print("build: OnePage");
    return BlocBuilder<BottomCubit, BottomState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  BlocProvider.of<BottomCubit>(context).tang();
                },
                child: Text("Thêm"),
              ),
              Text(BlocProvider.of<BottomCubit>(context).number.toString()),
              TextButton(
                onPressed: () {
                  BlocProvider.of<BottomCubit>(context).giam();
                },
                child: Text("Bớt"),
              ),
            ],
          ),
        );
      },
    );
  }
}
