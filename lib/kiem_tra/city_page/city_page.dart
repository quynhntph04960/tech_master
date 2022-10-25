import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/district_response.dart';
import 'city_cubit.dart';

class CityPage extends StatefulWidget {
  final bool isCity;
  final Function(DataDistrict? data)? callBack;

  const CityPage({Key? key, this.isCity = true, this.callBack})
      : super(key: key);

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  final controller = TextEditingController();
  final _cubit = CityCubit();
  bool isCity = false;

  @override
  void initState() {
    isCity = widget.isCity;
    _cubit.getListCity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    );
    return BlocBuilder<CityCubit, CityState>(
      bloc: _cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            centerTitle: true,
            title: Text(isCity ? "Chọn tỉnh/thành phố" : "Chọn quận/huyện"),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Tìm kiếm",
                    enabledBorder: border,
                    errorBorder: border,
                    border: border,
                    disabledBorder: border,
                    focusedBorder: border,
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {
                    _cubit.search(value, isCity);
                  },
                ),
                const SizedBox(height: 16),
                if (isCity == true) ...{
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.listCity?.length ?? 0,
                      itemBuilder: (context, index) {
                        final data = state.listCity?[index];
                        return GestureDetector(
                          onTap: () {
                            isCity = false;
                            _cubit.onClickCity(data);
                            controller.text = "";
                          },
                          behavior: HitTestBehavior.translucent,
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Text(data?.name ?? ""),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                    ),
                  )
                } else ...{
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.listDistrict?.length ?? 0,
                      itemBuilder: (context, index) {
                        final data = state.listDistrict?[index];
                        return GestureDetector(
                          onTap: () {
                            widget.callBack!(data);
                            Navigator.pop(context);
                          },
                          behavior: HitTestBehavior.translucent,
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Text(data?.name ?? ""),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                    ),
                  )
                }
              ],
            ),
          ),
        );
      },
    );
  }
}
