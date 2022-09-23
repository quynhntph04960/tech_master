import 'package:btvn_techmaster/base/ui/listview_widget.dart';
import 'package:flutter/material.dart';

class BodyHomePage extends StatelessWidget {
  const BodyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListviewWidget(
        listData: [],
        itemBuilder: (data, index) {
          return Container();
        },
      ),
    );
  }
}
