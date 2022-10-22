import 'package:flutter/material.dart';

class CustomBottomSheetWidget {
  BuildContext context;
  Widget subWidget;
  bool isShowWrap;

  CustomBottomSheetWidget(
      {required this.context, required this.subWidget, this.isShowWrap = true});

  Future<dynamic> showBottomSheetDialog() async {
    return await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return isShowWrap == true
            ? Wrap(
                children: [
                  subWidget,
                ],
              )
            : subWidget;
      },
    );
  }
}
