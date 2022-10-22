import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/service/api_service.dart';
import '../model/list_issues_response.dart';

class NewsFeedCubit extends Cubit<NewsFeedState> {
  int offset = 0;
  NewsFeedCubit() : super(NewsFeedState());

  Future listIssues() async {
    final json = await apiService.request(
        path: "issues?limit=5&offset=$offset", method: Method.get);
    final response = ListIssuesResponse.fromJson(json);
    if (response.code == 0) {
      offset = offset + 5;
      if (state.listIssues == null) {
        // state.copyWith(listIssues: []);
        emit(NewsFeedState(listIssues: response.data ?? []));
      } else {
        state.listIssues?.addAll(response.data ?? []);
        emit(state.copyWith(listIssues: state.listIssues));
      }
    }
  }
}

class NewsFeedState {
  final List<DataIssues>? listIssues;

  NewsFeedState({this.listIssues});

  NewsFeedState copyWith({
    List<DataIssues>? listIssues,
  }) {
    return NewsFeedState(
      listIssues: listIssues ?? this.listIssues,
    );
  }
}
