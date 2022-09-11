import 'package:flutter/material.dart';

PreferredSizeWidget buildAppbar({String? title, List<Widget>? action}) {
  return AppBar(
    title: Text(title ?? ""),
    // backgroundColor: Colors.black,
    centerTitle: true,
    actions: action,
  );
}
