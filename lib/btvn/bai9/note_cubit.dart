import 'package:flutter_bloc/flutter_bloc.dart';

//Cubit là chỗ để truyền dữ liệu đến 1 class nào muốn nhận dữ liệu
//ví dụ class note_page.dart là nơi nhận dữ liệu
//Cubit<NoteState> có thể truyền bất kỳ kiểu dữ liệu nào
class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitState());

  List<NoteModel> listNote = [];

  void addNote(NoteModel data) {
    listNote.add(data);
    // emit(NoteState()) để truyền dữ liệu cho class,
    // và kiểu dữ liệu truyền đi ở đây là NoteState()
    emit(NoteState());
  }

  void isClickItem(int index) {
    listNote[index].isCheck = !(listNote[index].isCheck ?? false);
    // emit(NoteState()) để truyền dữ liệu cho class,
    // và kiểu dữ liệu truyền đi là NoteState()
    emit(NoteState());
  }

  void removeNote() {
    listNote.removeWhere((element) => element.isCheck == true);

    // emit(NoteState()) để truyền dữ liệu cho class,
    // và kiểu dữ liệu truyền đi là NoteState()
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
