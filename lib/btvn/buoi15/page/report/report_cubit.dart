import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/service/api_service.dart';
import '../../../../base/ui/custom_bottom_sheet.dart';
import '../../picker_image/picker_image.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportState()) {
    emit(ReportState(listPhoto: [""]));
  }

  Future saveReport(
      {required String title,
      required String content,
      required BuildContext context}) async {
    final param = {
      "Title": title,
      "Content": content,
      "Photos": "",
    };
    final json = await apiService.request(
        path: "issues?limit=20&offset=0", method: Method.post, body: param);
    Navigator.pop(context);
  }

  void pickerImage(BuildContext context) {
    CustomBottomSheetWidget(
      context: context,
      subWidget: PickerImagePage(callback: (file) {
        state.listPhoto?.insert(0, file.path ?? "");
        emit(state.copyWith(listPhoto: state.listPhoto));
      }),
    ).showBottomSheetDialog();
  }
}

class ReportState {
  final List<String>? listPhoto;

  ReportState({this.listPhoto});

  ReportState copyWith({
    List<String>? listPhoto,
  }) {
    return ReportState(
      listPhoto: listPhoto ?? this.listPhoto,
    );
  }
}
