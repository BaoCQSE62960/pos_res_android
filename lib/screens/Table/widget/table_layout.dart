import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Table/table_layout.dart';
import 'package:pos_res_android/screens/Table/table_layout_bloc.dart';
import 'package:pos_res_android/screens/Table/widget/table_item.dart';

class TableLayout extends StatelessWidget {
  const TableLayout({Key? key, required this.context}) : super(key: key);

  final BuildContext context;

  Widget getTextWidgets(int num) {
    final TableLayoutBloc tableBloc = BlocProvider.of<TableLayoutBloc>(context);
    List<Widget> list = <Widget>[];
    for (var i = 0; i < num; i++) {
      list.add(
        SizedBox(
          child: TableItem(
            tableDetail: tableBloc.state.tableOverview.listTable[i],
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(
        left: defaultPadding * 0.5,
        right: defaultPadding * 0.5,
      ),
      child: BlocListener<TableLayoutBloc, TableLayoutState>(
        listener: (context, state) {},
        child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding * 0.5,
              childAspectRatio: 1.62,
            ),
            children: list),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TableLayoutBloc tableBloc = BlocProvider.of<TableLayoutBloc>(context);
    return Scaffold(
      backgroundColor: textLightColor,
      body: getTextWidgets(tableBloc.state.tableOverview.listTable.length),
    );
  }
}
