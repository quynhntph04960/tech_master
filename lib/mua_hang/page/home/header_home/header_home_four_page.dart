import 'package:btvn_techmaster/base/ui/image/image_network.dart';
import 'package:flutter/material.dart';

class HeaderHomeFourPage extends StatelessWidget {
  const HeaderHomeFourPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 100,
      child: Row(
        children: [
          _buildEspecially(
              flex: 1,
              image:
                  'https://cf.shopee.vn/file/0912cb283629e6f838b301ab340cd3d0'),
          const SizedBox(
            width: 8,
          ),
          _buildEspecially(
              flex: 2,
              image:
                  'https://cf.shopee.vn/file/fe54cd7fecedfeaa74964a63c2d78a7f'),
          const SizedBox(
            width: 8,
          ),
          _buildEspecially(
              flex: 1,
              image:
                  'https://cf.shopee.vn/file/c05f7bf9aaea4f2fc08ed73e0a3785d6'),
        ],
      ),
    );
  }

  Widget _buildEspecially({String? image, int? flex}) {
    return Expanded(
      flex: flex ?? 1,
      child: NetworkWidget(
        url: image,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
