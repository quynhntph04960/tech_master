import 'package:btvn_techmaster/base/navigator.dart';
import 'package:flutter/material.dart';

import '../city_page/city_page.dart';
import '../model/district_response.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final cityController = TextEditingController();
  final districtController = TextEditingController();
  final otherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: const Text("Địa chỉ"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                navigatorPush(
                    context,
                    CityPage(
                      isCity: true,
                      callBack: (DataDistrict? data) {
                        cityController.text = data?.city?.name ?? "";
                        districtController.text = data?.name ?? "";

                        setState(() {});
                      },
                    ));
              },
              child: _buildTextField(
                controller: cityController,
                hintText: "Chọn tỉnh/thành phố",
                labelText: "Tỉnh/thành phố",
                iconsData: Icons.arrow_drop_down,
              ),
            ),
            GestureDetector(
              onTap: () {
                navigatorPush(
                  context,
                  CityPage(
                    isCity: true,
                    callBack: (DataDistrict? data) {
                      cityController.text = data?.city?.name ?? "";
                      districtController.text = data?.name ?? "";
                      setState(() {});
                    },
                  ),
                );
              },
              child: _buildTextField(
                controller: districtController,
                hintText: "Chọn quận/huyện",
                labelText: "Quận/huyện",
                iconsData: Icons.arrow_drop_down,
              ),
            ),
            _buildTextField(
              controller: otherController,
              hintText: "Chọn tỉnh/thành phố",
              labelText: "Tỉnh/thành phố",
              enabled: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    TextEditingController? controller,
    String? labelText,
    String? hintText,
    IconData? iconsData,
    bool? enabled,
  }) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            labelText ?? "",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: border,
              errorBorder: border,
              enabled: enabled ?? false,
              border: border,
              disabledBorder: border,
              focusedBorder: border,
              suffixIcon: /*iconsData == null ? null :*/ Icon(
                iconsData,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
