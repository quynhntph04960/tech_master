import 'package:flutter/material.dart';

class DemoBai15Page extends StatefulWidget {
  const DemoBai15Page({Key? key}) : super(key: key);

  @override
  State<DemoBai15Page> createState() => _DemoBai15PageState();
}

class _DemoBai15PageState extends State<DemoBai15Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: GestureDetector(
          onTap: () => showOverPlay(ToastType.warning),
          child: Container(
            padding: const EdgeInsets.all(16),
            color: Colors.red,
            child: Text("show dialog"),
          ),
        ),
      ),
    );
  }

  OverlayEntry? overPlayWidget;
  void showOverPlay(ToastType type) {
    if (overPlayWidget != null) {
      overPlayWidget?.remove();
      overPlayWidget = null;
    }

    overPlayWidget = OverlayEntry(builder: (context) {
      Color cl = Colors.red;
      switch (type) {
        case ToastType.success:
          cl = Colors.green;
          break;
        case ToastType.error:
          cl = Colors.black;
          break;
        case ToastType.info:
          cl = Colors.white;
          break;
        case ToastType.warning:
          cl = Colors.yellow;
          break;
        default:
          cl = Colors.pink;
          break;
      }

      return Positioned(
        top: 50,
        left: 16,
        right: 16,
        child: Material(
          child: Container(
            color: cl,
            child: Row(
              children: [
                Expanded(child: Text("Thông báo")),
                IconButton(
                    onPressed: () {
                      overPlayWidget?.remove();
                    },
                    icon: Icon(Icons.close))
              ],
            ),
          ),
        ),
      );
    });
    if (overPlayWidget != null) Overlay.of(context)!.insert(overPlayWidget!);
    Future.delayed(Duration(seconds: 5), () {
      if (overPlayWidget != null) {
        overPlayWidget?.remove();
        overPlayWidget = null;
      }
    });
  }

  void showCustomDialog() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        pageBuilder: (_, __, ___) {
          return Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                height: 100,
                width: 200,
                color: Colors.white,
                child: Column(
                  children: [
                    const Text("NoiBai Taxi"),
                    const Text("Xác nhận đăng xuất"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("hủy")),
                        TextButton(onPressed: () {}, child: Text("Xác nhận")),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return _buildForm();
      },
    );
  }

  Widget _buildForm() {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: Colors.red,
      ),
    );
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            "Cập nhật thông tin hóa đơn",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "Mã số thuế",
                hintText: "Nhập mã số thuế",
                border: border,
                errorBorder: border,
                focusedBorder: border,
                disabledBorder: border,
                enabledBorder: border),
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "Mã số thuế",
                hintText: "Nhập mã số thuế",
                border: border,
                errorBorder: border,
                focusedBorder: border,
                disabledBorder: border,
                enabledBorder: border),
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "Mã số thuế",
                hintText: "Nhập mã số thuế",
                border: border,
                errorBorder: border,
                focusedBorder: border,
                disabledBorder: border,
                enabledBorder: border),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

enum ToastType { success, error, info, warning }
