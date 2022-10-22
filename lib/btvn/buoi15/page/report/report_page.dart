import 'package:btvn_techmaster/btvn/buoi15/page/report/report_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/ui/button_widget.dart';
import '../../../../base/ui/field_widget.dart';
import '../../../../base/ui/gridview_widget.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController describeController = TextEditingController();
  final _cubit = ReportCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Báo cáo"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            FieldWidget(
              controller: titleController,
              hintText: "Nhập tiêu đề",
              labelText: "Tiêu đề",
            ),
            const SizedBox(
              height: 16,
            ),
            FieldWidget(
              controller: describeController,
              maxLines: 5,
              minLines: 3,
              hintText: "Nhập nội dung",
              labelText: "Nội dung",
            ),
            const SizedBox(
              height: 16,
            ),
            _gridviewWidget(),
            const SizedBox(
              height: 16,
            ),
            ButtonWidget(
              alignment: Alignment.center,
              onPressed: () => _cubit.saveReport(
                title: titleController.text,
                content: describeController.text,
                context: context,
              ),
              text: "Lưu",
            )
          ],
        ),
      ),
    );
  }

  Widget _gridviewWidget() {
    return BlocBuilder<ReportCubit, ReportState>(
      bloc: _cubit,
      builder: (context, state) {
        print("state.listPhoto ${state.listPhoto}");
        return GridviewWidget<String>(
          listData: state.listPhoto ?? [],
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 1.5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          crossAxisCount: 3,
          itemBuilder: (data, index) {
            if (index == (state.listPhoto?.length ?? 0) - 1) {
              return GestureDetector(
                onTap: () => _cubit.pickerImage(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: const Icon(Icons.add, size: 32, color: Colors.black),
                ),
              );
            }
            return Image.network(
              data,
              width: double.infinity,
              fit: BoxFit.cover,
            );
          },
        );
      },
    );
  }
}
