import 'package:flutter/material.dart';

class GridviewWidget<T> extends StatelessWidget {
  final List<T> listData;
  final Function(T data, int index) itemBuilder;
  final Function(T data, int index)? onTap;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final Axis scrollDirection;
  final ScrollPhysics? physics;
  final int crossAxisCount;
  final double? crossAxisSpacing, mainAxisSpacing, mainAxisExtent;

  const GridviewWidget({
    Key? key,
    required this.crossAxisCount,
    required this.listData,
    required this.itemBuilder,
    this.physics,
    this.onTap,
    this.padding,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.mainAxisExtent,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: padding,
      itemCount: listData.length,
      shrinkWrap: true,
      primary: true,
      scrollDirection: scrollDirection,
      physics: physics,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing ?? 0.0,
        mainAxisSpacing: mainAxisSpacing ?? 0.0,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: (context, index) {
        T data = listData[index];
        return GestureDetector(
          onTap: () => onTap != null ? onTap!(data, index) : null,
          child: itemBuilder(data, index),
        );
      },
    );
  }
}
