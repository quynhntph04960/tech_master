import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:synchronized/synchronized.dart';

class LoadingDialog {
  static late LoadingDialog _instance;

  final _lock = Lock();
  bool _isShowing = false;

  static LoadingDialog getInstance(BuildContext context) {
    if (context != _instance.context) {
      _instance = LoadingDialog(context);
    }
    return _instance;
  }

  int totalLoading = 0;

  late BuildContext context;

  LoadingDialog(this.context);

  show({bool isShowImmediate = false}) async {
    await _lock.synchronized(() async {
      totalLoading++;
      if (isShowImmediate == true) {
        if (!_isShowing) {
          _showLoading();
          _isShowing = true;
        }
      } else if (totalLoading == 1 && !_isShowing) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (totalLoading > 0 && !_isShowing) {
            // print("showloading show() real $totalLoading");
            //
            // showErrorToast("show loading ||hhhhhhh $totalLoading");
            _showLoading();
            _isShowing = true;
          }
        });
      }
      // }
    });
  }

  hide() async {
    await _lock.synchronized(() async {
      if (totalLoading == 0) return;
      totalLoading--;
      // print("showloading hide() start $totalLoading");
      if (totalLoading == 0 && _isShowing) {
        _hideLoading();
        _isShowing = false;
      }
    });
  }

  clear() {
    while (totalLoading > 0) {
      hide();
    }
  }

  _showLoading() async {
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Theme(
              data: Theme.of(context).copyWith(
                dialogBackgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  content: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Lottie.asset(
                          'assets/json_image/loading.json',
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ],
                  )));
        }).then((value) {
      totalLoading = 0;
      _isShowing = false;
    });
  }

  _hideLoading() {
    Navigator.of(context, rootNavigator: true).pop(); //close the dialoge
  }
}
