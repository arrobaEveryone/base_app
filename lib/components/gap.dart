import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Gap extends StatelessWidget {

  final double size;

  const Gap(this.size,{super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isInRow(context) ? size : null,
      height: isInColumn(context) ? size : null,
    );
  }


  bool isInColumn(BuildContext context) {
    final parent = context.findAncestorWidgetOfExactType<Column>();
    return parent != null;
  }

  bool isInRow(BuildContext context) {
    final parent = context.findAncestorWidgetOfExactType<Row>();
    return parent != null;
  }
}