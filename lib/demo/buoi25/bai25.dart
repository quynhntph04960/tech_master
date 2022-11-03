import 'package:btvn_techmaster/base/navigator.dart';
import 'package:flutter/material.dart';

class HeroDemoPage extends StatelessWidget {
  final String photo;
  final int index;
  const HeroDemoPage({
    Key? key,
    required this.index,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          child: Material(
            child: Text("abccc"),
            color: Colors.transparent,
          ),
          tag: "title",
        ),
      ),
      body: InteractiveViewer(
        child: Center(
          child: Hero(
            tag: index,
            child: Image.network(
              photo,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

class Bai25Page extends StatefulWidget {
  const Bai25Page({Key? key}) : super(key: key);

  @override
  State<Bai25Page> createState() => _Bai25PageState();
}

class _Bai25PageState extends State<Bai25Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("abcccc"),
            actions: const [Icon(Icons.notification_add)],
            flexibleSpace: FlexibleSpaceBar(
              title: Hero(
                child: const Text("Title"),
                tag: "title",
              ),
              centerTitle: true,
              background: Image.network(
                fit: BoxFit.cover,
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuHH8JQsE5xEyr4sX8nzfdWpgu78HpkKxFzA&usqp=CAU",
              ),
            ),
            floating: true,
            expandedHeight: 200,

            pinned: true, // để giữ lại appbar
          ),
          // SliverList(
          //   delegate: SliverChildListDelegate([
          //     _buildItem(),
          //     _buildItem(),
          //     _buildItem(),
          //     _buildItem(),
          //   ]),
          // ),

          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //       (context, index) => _buildItem(),
          //       childCount: 30),
          // ),

          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildItem(index,
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuHH8JQsE5xEyr4sX8nzfdWpgu78HpkKxFzA&usqp=CAU"),
                childCount: 30,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ))
        ],
      ),
    );
  }

  Widget _buildItem(int index, String photo) {
    return GestureDetector(
      onTap: () {
        navigatorPush(context, HeroDemoPage(index: index, photo: photo));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        color: Colors.blue,
        alignment: Alignment.center,
        child: Hero(
          tag: index,
          child: Image.network(
            fit: BoxFit.fill,
            photo,
          ),
        ),
      ),
    );
  }
}
