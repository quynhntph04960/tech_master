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
  final _controller = TextEditingController();
  final _noteCubit = NoteCubit();
  int number = 0;
  int runBlocListener = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              number++;
              _controller.text = number.toString();
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
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
            ),
            const SizedBox(
              height: 16,
            ),
            BlocListener<NoteCubit, NoteState>(
              bloc: _noteCubit,
              listener: (context, state) {
                runBlocListener++;
                print("BlocListener chạy lần $runBlocListener");
              },
              child: const SizedBox(),
            ),
            Expanded(
              child: BlocBuilder<NoteCubit, NoteState>(
                bloc: _noteCubit,
                buildWhen: (context, state) {
                  if (_noteCubit.listNote.length > 5) {
                    print(_noteCubit.listNote.length);
                    return false;
                  }
                  return true;
                },
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: _noteCubit.listNote.length,
                    itemBuilder: (context, index) {
                      final data = _noteCubit.listNote[index];
                      return _buildItem(data, index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(final data, int index) {
    return GestureDetector(
      onTap: () {
        _noteCubit.isClickItem(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: data.isCheck == true ? Colors.red : Colors.grey,
        ),
        child: Column(
          children: [
            Text(data.name ?? ""),
            Text(data.time ?? ""),
          ],
        ),
      ),
    );
  }
}
