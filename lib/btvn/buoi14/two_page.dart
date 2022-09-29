import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottombar_page/bottom_cubit.dart';

class TwoPage extends StatefulWidget {
  const TwoPage({Key? key}) : super(key: key);

  @override
  State<TwoPage> createState() => _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {
  @override
  Widget build(BuildContext context) {
    print("build: TwoPage");
    return BlocBuilder<BottomCubit, BottomState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<BottomCubit>(context);
        return Center(
          child: Text(
            cubit.number.toString(),
          ),
        );
      },
    );
  }
}
