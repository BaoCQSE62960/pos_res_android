import 'package:flutter/material.dart';

import '../../../config/routes.dart';
import '../../../config/theme.dart';
import 'table_item.dart';

class TableLayout extends StatelessWidget {
  const TableLayout({Key? key}) : super(key: key);
  Widget getTextWidgets(int num) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < num; i++) {
      list.add(
        const SizedBox(
          child: TableItem(),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(defaultPadding * 0.5),
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: defaultPadding * 0.5,
            mainAxisSpacing: defaultPadding * 0.5,
            childAspectRatio: 1.571428,
          ),
          children: list),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textLightColor,
      body: getTextWidgets(1),
    );
  }
}
