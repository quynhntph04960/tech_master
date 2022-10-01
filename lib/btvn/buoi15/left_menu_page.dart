import 'package:btvn_techmaster/base/utils/common_function.dart';
import 'package:flutter/material.dart';

import 'report_page.dart';

class LeftMenuPage extends StatefulWidget {
  const LeftMenuPage({Key? key}) : super(key: key);

  @override
  State<LeftMenuPage> createState() => _LeftMenuPageState();
}

class _LeftMenuPageState extends State<LeftMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 15,
                  bottom: 16,
                  left: 16,
                  right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: Image.network(
                        "https://data.designervn.net/2022/04/14386_socail-messenger-app-logo.jpg",
                        height: 48,
                        width: 48),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Nguyễn Trọng Quỳnh",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "0393923233",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            _buildItem(text: "Sự cố", iconData: Icons.error_outline),
            const Divider(),
            _buildItem(
                text: "Báo cáo",
                iconData: Icons.bug_report_rounded,
                callback: () {
                  Navigator.pop(context);
                  navigatorPush(context, ReportPage());
                }),
            const Divider(),
            _buildItem(text: "Đổi mật khẩu", iconData: Icons.password_sharp),
            const Divider(),
            _buildItem(text: "Điều khoản", iconData: Icons.add_chart_rounded),
            const Divider(),
            _buildItem(text: "Liên hệ", iconData: Icons.phone),
            const Divider(),
            _buildItem(text: "Đăng xuất", iconData: Icons.logout),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(
      {String? text, IconData? iconData, VoidCallback? callback}) {
    return GestureDetector(
      onTap: () {
        if (callback != null) callback();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              iconData,
              size: 28,
              color: Colors.black,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              text ?? "",
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
