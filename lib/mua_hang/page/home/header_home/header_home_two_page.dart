import 'package:flutter/material.dart';

class HeaderHomeTwoPage extends StatelessWidget {
  const HeaderHomeTwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.crop_square_outlined,
            color: Colors.grey,
            size: 30,
          ),
          _buildDivider(),
          _buildItemPayment(
              context: context,
              title: "Ví shoppePay",
              subTitle: "Voucher giảm đến 30K",
              icon: Icons.payments,
              color: Colors.orange),
          _buildDivider(),
          _buildItemPayment(
              context: context,
              title: "Shoppe Xu",
              subTitle: "Đổi xu lấy mã giảm giá",
              icon: Icons.currency_bitcoin,
              color: Colors.yellow),
        ],
      ),
    );
  }

  Widget _buildItemPayment(
      {String? title,
      String? subTitle,
      IconData? icon,
      Color? color,
      BuildContext? context}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 16,
                color: color,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                title ?? "",
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            subTitle ?? "",
            style: Theme.of(context!).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 0.5,
      height: 40,
      // height: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.grey,
      alignment: Alignment.center,
    );
  }
}
