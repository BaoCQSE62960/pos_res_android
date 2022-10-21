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
        SizedBox(
          child: TableItem(
            id: i.toString(),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(
        left: defaultPadding * 0.5,
        right: defaultPadding * 0.5,
      ),
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding * 0.5,
            childAspectRatio: 1.55,
          ),
          children: list),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textLightColor,
      body: getTextWidgets(7),
    );
  }
}
