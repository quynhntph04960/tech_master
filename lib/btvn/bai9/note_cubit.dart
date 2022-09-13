import 'package:flutter_bloc/flutter_bloc.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitState());

  List<NoteModel> listNote = [];

  void addNote(NoteModel data) {
    listNote.add(data);
    emit(NoteState());
  }

  void isClickItem(int index) {
    listNote[index].isCheck = !(listNote[index].isCheck ?? false);
    emit(NoteState());
  }

  void removeNote() {
    for (var element in listNote) {
      if (element.isCheck == true) {
        listNote.remove(element);
      }
    }
    emit(NoteState());
  }
}

class NoteState {}

class NoteInitState extends NoteState {}

class NoteModel {
  String? name;
  String? time;
  bool? isCheck;

  NoteModel({this.name, this.time, this.isCheck});
}
