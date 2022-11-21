import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/common/utils/socket.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Table/table_layout.dart';
import 'package:pos_res_android/screens/Table/table_layout_bloc.dart';
import 'package:pos_res_android/screens/Table/table_layout_event.dart';
import 'package:pos_res_android/screens/Table/widget/table_layout.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class TableSection extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  TableSection({Key? key, this.socket});

  Socket? socket;

  @override
  Widget build(BuildContext context) {
    final TableLayoutBloc tableBloc = BlocProvider.of<TableLayoutBloc>(context);
    if (socket != null) {
      socket!.socket.on('update-pos-tableOverview', (data) {
        tableBloc.add(
            LoadData(locationID: tableBloc.state.currentLocationID.toString()));
      });
    } else {
      tableBloc.add(
          LoadData(locationID: tableBloc.state.currentLocationID.toString()));
    }
    return Container(
        color: textLightColor,
        height: MediaQuery.of(context).size.height - defaultPadding * 5,
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<TableLayoutBloc, TableLayoutState>(
          builder: (context, state) {
            return tableBloc.state.tableLayoutStatus.isLoading
                ? const Center(child: CircularProgressIndicator())
                : (tableBloc.state.tableLayoutStatus.isError
                    ? showErrorDialog(context)
                    : TableLayout(
                        context: context,
                      ));
          },
        ));
  }

  showErrorDialog(BuildContext context) {
    final TableLayoutBloc tableBloc = BlocProvider.of<TableLayoutBloc>(context);
    Widget continueButton = TextButton(
      child: Text("dialog.agree".tr(), style: TextStyle(color: activeColor)),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text('change_order.change_order_dialog_title'.tr()),
      content: Text(tableBloc.state.message),
      actions: [
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
