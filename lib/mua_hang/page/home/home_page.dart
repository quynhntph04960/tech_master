import 'package:flutter/material.dart';

import 'body_home/body_home_page.dart';
import 'footer_home/footer_home_page.dart';
import 'header_home/header_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double dX = 0.0;
  double dY = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // extendBodyBehindAppBar: true,
      body: LayoutBuilder(builder: (context, sizeBox) {
        return InkWell(
          onTap: () {
            print("---------------------------------");
            print(sizeBox.maxHeight);
            print(sizeBox.maxWidth);
          },
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                children: const [
                  HeaderHomePage(),
                  BodyHomePage(),
                  FooterHomePage(),
                ],
              ),
              // Positioned(
              //   top: dX,
              //   left: 0,
              //   child: Draggable(
              //     onDraggableCanceled: (velocity, Offset offset) {
              //       print(velocity);
              //       print(offset);
              //       // print(MediaQuery.of(context).size.width);
              //       // print(MediaQuery.of(context).size.height);
              //
              //       // dX = velocity.pixelsPerSecond.dx;
              //       // dY = velocity.pixelsPerSecond.dy;
              //
              //       dX = offset.dx - 40;
              //       dY = offset.dy;
              //       setState(() {});
              //     },
              //     feedback: _boxWidget(),
              //     child: _boxWidget(),
              //   ),
              // )
            ],
          ),
        );
      }),
    );
  }

  Widget _boxWidget() {
    return Container(
      height: 80,
      width: 80,
      child: Image.asset("name"),
    );
  }
}
