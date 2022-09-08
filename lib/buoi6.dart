import 'package:flutter/material.dart';

class GVPage extends StatefulWidget {
  const GVPage({Key? key}) : super(key: key);

  @override
  State<GVPage> createState() => _GVPageState();
}

class _GVPageState extends State<GVPage> {
  int size = 8;
  List<CaroModel> listData = [];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listData.clear();
    for (int k = 1; k <= size; k++) {
      for (int i = 0; i < size; i++) {
        if (k % 2 != 0) {
          listData.add(
            CaroModel(
                id: listData.length + 1,
                isColorWhite: i % 2 == 0,
                col: i + 1,
                ro: k),
          );
        } else {
          listData.add(
            CaroModel(
                id: listData.length + 1,
                isColorWhite: i % 2 != 0,
                col: i + 1,
                ro: k),
          );
        }
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 2),
          child: Center(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: size),
                padding: const EdgeInsets.all(8),
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  CaroModel data = listData[index];
                  return InkWell(
                    onTap: () {
                      print(
                          "${data.id.toString()}\ncol:${data.col ?? ""}\nro:${data.ro ?? ""}");
                    },
                    child: Container(
                      color: data.isColorWhite != true
                          ? Colors.black
                          : Colors.white,
                      alignment: Alignment.center,
                      child: Text(
                        "${data.id.toString()}",
                        style: const TextStyle(color: Colors.red, fontSize: 9),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

class CaroModel {
  final int? id;
  final bool? isColorWhite;
  final int? col;
  final int? ro;

  CaroModel({this.id, this.isColorWhite, this.col, this.ro});
}
