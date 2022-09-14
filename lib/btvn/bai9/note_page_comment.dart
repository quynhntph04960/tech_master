import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'note_cubit.dart';

class NotePageComment extends StatefulWidget {
  final String title;
  const NotePageComment({Key? key, required this.title}) : super(key: key);

  @override
  State<NotePageComment> createState() => _NotePageCommentState();
}

class _NotePageCommentState extends State<NotePageComment> {
  final _controller = TextEditingController();
  //Khởi tạo NoteCubit, có thể hiểu nó là nơi chứa dữ liệu hoặc tạo 1 nơi để chứa các dữ liệu
  final _noteCubit = NoteCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NoteCubit>(
      // chỉ là khởi tạo bình thường
      create: (BuildContext context) => _noteCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              onPressed: () {
                if (_controller.text.isEmpty) {
                  print('Chưa nhập text');
                  return;
                }
                final data = NoteModel(
                  name: _controller.text,
                  time: DateTime.now().toString(),
                );
                _noteCubit.addNote(data);
                _controller.text = "";
              },
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {
                _noteCubit.removeNote();
              },
              icon: const Icon(Icons.delete_forever),
            ),
          ],
        ),
        // BlocListener sẽ chạy trước BlocBuilder
        // BlocListener chỉ lắng nghe dữ liệu mà nó muốn
        // BlocListener dc chạy bắt đầu từ lần thứ 2 khi hàm build state
        /// không tạo BlocListener trong hoặc sau BlocBuilder (nó không lỗi, nhưng sai luồng hoặc login code)
        body: BlocListener(
          // bloc của BlocListener tương tự như bloc của BlocBuilder
          bloc: _noteCubit,

          /// sẽ không cần dòng này nếu dùng BlocProvider là widget cha
          listener: (context, state) {
            // state cũng tương tự như state của builder trong BlocBuilder
            // hàm listener này sẽ chạy trước BlocBuilder
            print("Lucky");
          },
          /*
          khởi tạo widget BlocBuilder
          BlocBuilder<NoteCubit, NoteState>
          BlocBuilder có thể hiểu là nơi để lắng nghe sự thay đổi và cập nhật lại UI,
          BlocBuilder lắng nghe từ class NoteCubit
          NoteCubit có thể hiểu là nơi nhận dữ liệu từ Cubit nào
          NoteState là kiểu dữ liệu, khi setState thay đổi để NoteState biết được là kiểu dữ liệu gì
          */
          child: BlocBuilder<NoteCubit, NoteState>(
            // bloc: _noteCubit, là nơi để xác nhận xem nhận dữ liệu ở đâu
            bloc: _noteCubit,

            /// sẽ không cần dòng này nếu dùng BlocProvider là widget cha
            // Widget BlocListener chạy trước buildWhen
            // buildWhen chạy trước hàm builder
            buildWhen: (context, state) {
              // ví dụ return false; thì sẽ dừng lại không chạy tiếp nữa
              // return true thì sẽ chạy tiếp đến hàm builder
              // buildWhen dc chạy bắt đầu từ lần thứ 2 khi hàm build state
              /// bắt buộc phải return về kiểu dữ liệu bool
              return true;
            },
            builder: (context, state) {
              // mỗi lần có sự thay đổi builder sẽ được gọi lại
              // state có kiểu dữ liệu là NoteState,
              // state là dữ liệu dược nhận về khi NoteCubit có sự thay đổi
              /// khi có sự thay đổi thì có thể dùng _noteCubit hoặc state để nhận dữ liệu
              /// ví dụ: nên dùng cách 1 dùng cách 2.0 khi thuộc 4 kiểu dữ liệu kia
              /// 1) _noteCubit.listNote
              /// 2.0) state có dữ liệu hoặc là kiểu dữ liệu khi là kiểu int, String, double, bool
              /// 2.1) state khác 4 kiểu dữ liệu trên chỉ là kiểu dữ liệu bình thường, không lấy được dữ liệu từ state
              return Column(
                children: [
                  TextField(
                    controller: _controller,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _noteCubit.listNote.length,
                      itemBuilder: (context, index) {
                        final data = _noteCubit.listNote[index];
                        return GestureDetector(
                          onTap: () {
                            _noteCubit.isClickItem(index);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: data.isCheck == true
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                            child: Column(
                              children: [
                                Text(data.name ?? ""),
                                Text(data.time ?? ""),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

//Các bước UI + Bloc
//1) Tạo giao diện
//VD: Kiểu dữ liệu = int
//tạo Class = NoteCubit
//2) class NoteCubit extends Cubit<int> {
//   NoteCubit() : super(0);
// }
//3) trong class UI
//Tạo 1 biến NoteCubit _noteCubit = NoteCubit();
//Thêm Widget BlocBuilder<NoteCubit, int>(yêu cầu 2 thuộc tính bắt buộc là bloc, builder)
//BlocBuilder<NoteCubit, int>(
//  bloc: _noteCubit,
//  builder: (context, state) {
//    return Container(); Widget ở tự custom, muốn thay đổi gì thì làm trong này
//  },
//)
//class NoteCubit extends Cubit<int> {
//   NoteCubit() : super(0);
//
//   List<NoteModel> listNote = [];
//
//   void addNote(NoteModel data) {
//     listNote.add(data);
//     // emit(0) để truyền dữ liệu cho class,
//     // và kiểu dữ liệu truyền đi ở đây là 0 (đang là int)
//     emit(0);
//   }
// }
//Tạo thêm 1 button, khi bấm vào button thì gọi 1 _noteCubit.addNote(data);
//Để thêm dữ liệu vào listview

//1) Dùng BlocListener để check điều kiện của dữ liệu trước khi BlocBuilder có sự thay đổi
//2) Trong BlocBuilder có thể dùng buildWhen để check điều kiện của dữ liệu trước khi builder có sự thay đổi
/// Không tạo BlocListener trong hoặc sau BlocBuilder
/// (nó không lỗi, nhưng sai luồng hoặc login code)
/// Không bắt buộc dùng BlocProvider.
/// Nếu dùng BlocProvider thì thuộc tính bloc của 2 widget BlocListener và BlocBuilder có không cần khai báo
/// buildWhen trong widget BlocBuilder bắt buộc phải return về kiểu dữ liệu bool
