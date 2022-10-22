import 'package:flutter/material.dart';

import '../../../base/ui/gridview_widget.dart';
import '../model/list_issues_response.dart';

class ItemNewsFeed extends StatelessWidget {
  final DataIssues data;
  const ItemNewsFeed({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.network(
                  data.accountPublic?.avatar ?? "",
                  height: 48,
                  width: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(500),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        Icons.person,
                        size: 32,
                        color: Colors.blue,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      data.accountPublic?.name ?? "",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      data.createdAt ?? "",
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  data.status.toString() ?? "",
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ],
          ),
          const Divider(),
          Text(
            data.title ?? "",
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            data.content ?? "",
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          if ((data.photos?.length ?? 0) > 0) ...{
            _gridviewWidget(),
          }
        ],
      ),
    );
  }

  Widget _gridviewWidget() {
    List<String> listNew = [];
    for (var element in data.photos ?? []) {
      if (listNew.length < 2) {
        listNew.add(element);
      }
    }
    return GridviewWidget<String>(
      listData: listNew,
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.5,
      crossAxisSpacing: 16,
      crossAxisCount: data.photos?.length == 1
          ? 1
          : data.photos?.length == 2
              ? 2
              : 3,
      itemBuilder: (data, index) {
        if (index == 2) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: const Icon(Icons.add, size: 32, color: Colors.black),
          );
        }
        return Image.network(
          width: double.infinity,
          fit: BoxFit.cover,
          data,
          errorBuilder: (_, __, ___) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
