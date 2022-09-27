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
    // final borderTexField = OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(8),
    //   borderSide: BorderSide(
    //     color: Colors.red,
    //     width: 2,
    //   ),
    // );
    final borderTexField = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: Colors.white,
        width: 2,
      ),
    );
    return Scaffold(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    focusedBorder: borderTexField,
                    disabledBorder: borderTexField,
                    errorBorder: borderTexField,
                    enabledBorder: borderTexField,
                    border: borderTexField,
                    focusedErrorBorder: borderTexField,
                    constraints: const BoxConstraints(maxHeight: 40),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    filled: true,
                    prefixIconColor: Colors.red,
                    iconColor: Colors.black,
                    suffixIconColor: Colors.orange,
                    // prefixIconConstraints: ,
                    suffixIcon: Icon(Icons.camera_alt_outlined),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              _buildIconAppbar(icon: Icons.store, number: 4),
              const SizedBox(width: 8),
              _buildIconAppbar(icon: Icons.message_outlined, number: 0),
            ],
          ),
        ),
        elevation: 0,
      ),
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

  Widget _buildIconAppbar({required IconData icon, required int number}) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Visibility(
            visible: number > 0,
            child: Container(
              height: 18,
              width: 18,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 0),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.white, width: 1)),
              child: Text(
                number > 99 ? "99+" : number.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: number > 99 ? 9 : 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        )
      ],
    );
  }
}
