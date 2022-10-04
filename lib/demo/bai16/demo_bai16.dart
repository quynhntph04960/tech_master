import 'dart:convert';

import 'package:btvn_techmaster/base/ui/listview_widget.dart';
import 'package:btvn_techmaster/demo/bai16/Contract.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DemoBai16 extends StatefulWidget {
  const DemoBai16({Key? key}) : super(key: key);

  @override
  State<DemoBai16> createState() => _DemoBai16State();
}

class _DemoBai16State extends State<DemoBai16> {
  List<Contract> listContract = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Call Api"),
      ),
      body: FutureBuilder<List<Contract>>(
          future: getData(),
          builder: (context, snapshot) {
            listContract = snapshot.data ?? [];
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return ListviewWidget<Contract>(
              listData: listContract,
              itemBuilder: (data, index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    children: [
                      Text(data.id.toString()),
                      const SizedBox(
                        width: 16,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          data.avatar ?? "",
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(data.name.toString()),
                    ],
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getData();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<List<Contract>> getData() async {
    final uri = Uri.parse("http://api.quynhtao.com/api/users");
    final response = await http.get(uri);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final json = jsonDecode(response.body);

      return List<Contract>.from(json.map((e) => Contract.fromJson(e)));
    }
    throw Exception("Lỗi ${response.statusCode}");
  }
}
