import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../page_one.dart';
import '../two_page.dart';
import 'bottom_cubit.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({Key? key}) : super(key: key);

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomCubit()),
      ],
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: const [
            OnePage(),
            TwoPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          enableFeedback: true,
          type: BottomNavigationBarType.fixed,
          // selectedFontSize: 0,
          // unselectedFontSize: 0,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          elevation: 10,
          items: [
            _buildIcon(data: Icons.add),
            _buildIcon(data: Icons.ac_unit_outlined),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildIcon({required IconData data}) {
    return BottomNavigationBarItem(
      icon: Icon(data),
      tooltip: data.toString(),
      label: data.toString(),
    );
  }
}
