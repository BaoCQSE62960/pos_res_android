import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/common/utils/navigation_service.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/table.dart';
import 'package:pos_res_android/repos/models/waiter/tabledetail.dart';
import 'package:pos_res_android/repos/services/login_service.dart';
import 'package:pos_res_android/screens/Order/order.dart';
import 'package:pos_res_android/screens/Table/table_layout_bloc.dart';
import 'package:pos_res_android/screens/Table/table_layout_event.dart';
import 'package:pos_res_android/screens/Table/table_layout_state.dart';
import 'package:pos_res_android/screens/Table/utils/selected_mode_enum.dart';

final currencyFormat = NumberFormat("#,##0", "en_US");

class TableItem extends StatefulWidget {
  const TableItem({Key? key, required this.tableDetail}) : super(key: key);
  final TableDetail tableDetail;

  @override
  State<TableItem> createState() => _TableItemState();
}

class _TableItemState extends State<TableItem> {
  late TableDetail tableDetail;
  String loginMsg = "";
  List currentUserRole = [];

  Future getCurrentUserRole() async {
    LoginService service = LoginService();
    currentUserRole = await service.getRole();
    return currentUserRole;
  }

  @override
  void initState() {
    super.initState();
    tableDetail = widget.tableDetail;
  }

  @override
  Widget build(BuildContext context) {
    final TableLayoutBloc tableBloc = BlocProvider.of<TableLayoutBloc>(context);
    return BlocBuilder<TableLayoutBloc, TableLayoutState>(
        builder: (context, state) {
      return tableBloc.state.tableItemStatus.isLoading &&
              tableDetail.id == tableBloc.state.currentProcessTableID
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GestureDetector(
              onTap: () async {
                currentUserRole = await getCurrentUserRole();
                loginMsg = currentUserRole[1];
                if (tableBloc.state.currentSelectedMode ==
                    SelectedMode.CHANGE_ORDER) {
                  Navigator.of(context).pop();
                  showChangeOrderDialog(
                      context, tableDetail.tablename, tableDetail.id);
                }
                if (tableBloc.state.currentSelectedMode ==
                    SelectedMode.CHANGE_TABLE) {
                  Navigator.of(context).pop();
                  showChangeTableDialog(
                      context, tableDetail.tablename, tableDetail.id);
                }
                if (tableBloc.state.currentSelectedMode ==
                    SelectedMode.SPLIT_ORDER) {
                  Navigator.of(context).pop();
                  showSplitOrderDialog(
                      context, tableDetail.tablename, tableDetail.id);
                }
                if (tableBloc.state.currentSelectedMode == SelectedMode.NONE) {
                  if (tableDetail.checkid == 0) {
                    tableBloc.add(OpenTable(tableID: tableDetail.id));
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return OrderScreen(
                            checkid: tableDetail.checkid == 0
                                ? tableBloc.state.currentTableOpenID
                                : tableDetail.checkid,
                            loginMsg: loginMsg,
                          );
                        },
                      ),
                    );
                  }
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: deactiveColor,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                      width: defaultSize * 0.25, color: deactiveColor),
                  boxShadow: const [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: 3,
                      offset: Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                      color: tableDetail.status == 'NOT_USE'
                          ? deactiveColor
                          : activeColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                    ),
                    height: defaultPadding * 2,
                    width: defaultPadding * 12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: defaultPadding * 2,
                        ),
                        Text(
                          tableDetail.tablename,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: textLightColor),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "(" + tableDetail.cover.toString() + ")",
                              style: const TextStyle(
                                  fontSize: 12, color: textLightColor),
                            ),
                            Container(
                              width: defaultPadding * 0.5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: defaultPadding * 12,
                    height: defaultPadding * 5,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0)),
                          color: textLightColor),
                      child: Column(
                        children: [
                          Container(
                            color: textLightColor,
                            height: defaultPadding * 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                tableDetail.status == 'NOT_USE'
                                    ? const SizedBox()
                                    : Text(
                                        currencyFormat
                                            .format(int.parse(
                                                tableDetail.totalamount))
                                            .toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: textColor,
                                        ),
                                      ),
                              ],
                            ),
                          ),
                          tableDetail.status == 'NOT_USE'
                              ? const SizedBox()
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    !tableDetail.isready
                                        ? const SizedBox()
                                        : const Icon(
                                            Icons.dinner_dining_rounded,
                                            size: defaultPadding * 2.5,
                                            color: warningColor,
                                          ),
                                    Container(
                                      width: defaultPadding * 0.3,
                                    ),
                                    !tableDetail.isrecall
                                        ? const SizedBox()
                                        : const Icon(
                                            Icons.cancel_outlined,
                                            size: defaultPadding * 2.5,
                                            color: voidColor,
                                          ),
                                    Container(
                                      width: defaultPadding * 0.3,
                                    ),
                                    !tableDetail.iswaiting
                                        ? const SizedBox()
                                        : const Icon(
                                            Icons.timelapse_rounded,
                                            size: defaultPadding * 2.5,
                                            color: deactiveColor,
                                          ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            );
    });
  }

  showChangeOrderDialog(BuildContext context, String tableName, int tableid) {
    final TableLayoutBloc tableBloc = BlocProvider.of<TableLayoutBloc>(context);
    final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
    Widget cancelButton = TextButton(
      child: Text("dialog.cancel".tr(), style: TextStyle(color: activeColor)),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("dialog.agree".tr(), style: TextStyle(color: activeColor)),
      onPressed: () {
        tableBloc.add(ChangeOrderProcess(
            listCheckDetail: orderBloc.state.listSelectedCheckDetail,
            currentCheckID: orderBloc.state.checkId,
            targatTableID: tableid));
        Navigator.of(NavigationService.navigatorKey.currentContext!)
            .pushNamed('/tableoverview');
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text('change_order.change_order_dialog_title'.tr()),
      content: Text(
          'change_order.change_order_dialog_message'.tr(args: [tableName])),
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

  showSplitOrderDialog(BuildContext context, String tableName, int tableid) {
    final TableLayoutBloc tableBloc = BlocProvider.of<TableLayoutBloc>(context);
    final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
    Widget cancelButton = TextButton(
      child: Text("dialog.cancel".tr(), style: TextStyle(color: activeColor)),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("dialog.agree".tr(), style: TextStyle(color: activeColor)),
      onPressed: () {
        tableBloc.add(SplitOrderProcess(
            percent: orderBloc.state.percent,
            currentCheckID: orderBloc.state.checkId,
            targetTableID: tableid));
        Navigator.of(NavigationService.navigatorKey.currentContext!)
            .pushNamed('/tableoverview');
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text('change_order.change_order_dialog_title'.tr()),
      content: Text(
          'change_order.change_order_dialog_message'.tr(args: [tableName])),
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

  showChangeTableDialog(BuildContext context, String tableName, int tableid) {
    final TableLayoutBloc tableBloc = BlocProvider.of<TableLayoutBloc>(context);
    final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
    Widget cancelButton = TextButton(
      child: Text("dialog.cancel".tr(), style: TextStyle(color: activeColor)),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("dialog.agree".tr(), style: TextStyle(color: activeColor)),
      onPressed: () {
        tableBloc.add(ChangeTableProcess(
            currentCheckID: orderBloc.state.checkId, targetTableID: tableid));
        Navigator.of(NavigationService.navigatorKey.currentContext!)
            .pushNamed('/tableoverview');
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text('change_table.change_table_dialog_title'.tr()),
      content: Text(
          'change_table.change_table_dialog_message'.tr(args: [tableName])),
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
