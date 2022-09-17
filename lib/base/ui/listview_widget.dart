import 'package:flutter/material.dart';

class ListviewWidget<T> extends StatelessWidget {
  final List<T> listData;
  final Function(T data, int index) itemBuilder;
  final Function(T data, int index)? onTap;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final Axis scrollDirection;
  final ScrollPhysics? physics;

  const ListviewWidget({
    Key? key,
    required this.listData,
    required this.itemBuilder,
    this.physics,
    this.onTap,
    this.padding,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listData.length,
      physics: physics,
      padding: padding ?? const EdgeInsets.all(0),
      shrinkWrap: shrinkWrap,
      scrollDirection: scrollDirection,
      itemBuilder: (context, index) {
        T data = listData[index];
        return GestureDetector(
          onTap: () => onTap != null ? onTap! : null,
          child: itemBuilder(data, index),
        );
      },
    );
  }
}
