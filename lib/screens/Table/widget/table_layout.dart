import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/common/utils/socket.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Table/table_layout.dart';
import 'package:pos_res_android/screens/Table/table_layout_bloc.dart';
import 'package:pos_res_android/screens/Table/table_layout_event.dart';
import 'package:pos_res_android/screens/Table/utils/selected_mode_enum.dart';
import 'package:pos_res_android/screens/Table/widget/table_item.dart';

class TableLayout extends StatelessWidget {
  // const TableLayout({Key? key, required this.context, required this.socket})
  //     : super(key: key);
  const TableLayout({Key? key, required this.context}) : super(key: key);

  final BuildContext context;
  // final Socket socket;

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
        listener: (context, state) {
          if (state.currentSelectedMode == SelectedMode.CHANGE_TABLE) {
            if (state.secondSelectedTableName.isNotEmpty) {
              showChangeTableDialog(context, state.firstSelectedTableName,
                  state.secondSelectedTableName);
            }
          }
          if (state.currentSelectedMode == SelectedMode.CHANGE_ORDER) {
            showChangeOrderDialog(context, state.firstSelectedTableName,
                state.secondSelectedTableName);
          }
        },
        child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              // crossAxisCount: 5,
              crossAxisCount: 6,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding * 0.5,
              // childAspectRatio: 1.55,
              childAspectRatio: 1.55,
            ),
            children: list),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TableLayoutBloc tableBloc = BlocProvider.of<TableLayoutBloc>(context);
    // socket.socket.on('update-pos-tableOverview', (data) {
    //   tableBloc.add(LoadData(locationID: '0'));
    // });
    return Scaffold(
      backgroundColor: textLightColor,
      body: getTextWidgets(tableBloc.state.tableOverview.listTable.length),
    );
  }

  showChangeTableDialog(
      BuildContext context, String firstTable, String secondTable) {
    Widget cancelButton = TextButton(
      child: Text("dialog.cancel".tr()),
      onPressed: () {},
    );
    Widget continueButton = TextButton(
      child: Text("dialog.agree".tr()),
      onPressed: () {},
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Xác nhận chuyển bàn"),
      content: Text("Bạn có đồng ý chuyển tất cả hóa đơn của bàn #" +
          firstTable +
          " sang bàn #" +
          secondTable +
          " ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showChangeOrderDialog(
      BuildContext context, String firstTable, String secondTable) {
    Widget cancelButton = TextButton(
      child: Text("dialog.cancel".tr()),
      onPressed: () {},
    );
    Widget continueButton = TextButton(
      child: Text("dialog.agree".tr()),
      onPressed: () {},
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Xác nhận chuyển đơn"),
      content: Text('Bạn có đồng ý chuyển hóa đơn này'
              " sang bàn #" +
          secondTable +
          " ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
