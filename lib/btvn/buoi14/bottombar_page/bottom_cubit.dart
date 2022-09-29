import 'package:flutter_bloc/flutter_bloc.dart';

class BottomCubit extends Cubit<BottomState> {
  BottomCubit() : super(BottomInitState());

  int number = 0;

  void tang() {
    number++;
    emit(BottomState());
  }

  void giam() {
    number--;
    emit(BottomState());
  }
}

class BottomState {}

class BottomInitState extends BottomState {}
