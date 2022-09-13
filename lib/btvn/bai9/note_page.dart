import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'note_cubit.dart';

class NotePage extends StatefulWidget {
  final String title;
  const NotePage({Key? key, required this.title}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  TextEditingController? controller = TextEditingController();
  NoteCubit _noteCubit = NoteCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
        bloc: _noteCubit,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              actions: [
                IconButton(
                  onPressed: () {
                    final data = NoteModel(
                      name: controller?.text ?? "",
                      time: DateTime.now().toString(),
                    );
                    _noteCubit.addNote(data);
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
            body: Column(
              children: [
                TextField(
                  controller: controller,
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
                            color:
                                data.isCheck == true ? Colors.red : Colors.grey,
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
            ),
          );
        });
  }
}
