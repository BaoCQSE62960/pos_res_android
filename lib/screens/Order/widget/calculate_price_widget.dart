// ignore_for_file: library_prefixes, sized_box_for_whitespace

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pos_res_android/common/widgets/warning_popup.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/waiter/checkdetail.dart';
import 'package:pos_res_android/repos/models/waiter/specialrequests.dart';
import 'package:pos_res_android/repos/models/waiter/voidreason.dart';
import 'package:pos_res_android/screens/Order/order.dart';
import 'package:pos_res_android/screens/Order/widget/buttons/custom_elevated_button.dart';
import 'package:pos_res_android/screens/Order/widget/buttons/custom_tool_button.dart';
import 'package:pos_res_android/screens/Order/widget/listview_item.dart';
import 'package:pos_res_android/screens/Order/widget/number_picker.dart';
import 'package:pos_res_android/screens/Table/table_layout_bloc.dart';
import 'package:pos_res_android/screens/Table/table_layout_event.dart'
    as TableEvent;
import 'package:pos_res_android/screens/Table/widget/table_layout_filter.dart';
import 'package:pos_res_android/screens/Table/widget/table_layout_table.dart';
import 'package:pos_res_android/screens/Order/widget/buttons/payment_btn.dart';

final currencyFormat = NumberFormat("#,##0", "en_US");

String msg = "";

Future<void> _simpleFailDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return WarningPopUp(msg: msg);
    },
  );
}

Container calculatePriceWidget(
    BuildContext context, String loginMsg, String status) {
  final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
  bool btnVisible = true;
  bool paymentVisible = true;

  if (status != "ACTIVE") {
    btnVisible = false;
    paymentVisible = false;
  } else {
    btnVisible = true;
    if (loginMsg.toString().contains("CASHIER")) {
      paymentVisible = true;
    } else {
      paymentVisible = false;
    }
  }

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'order.subtotal'.tr(),
            style: TextStyle(color: textColor2),
          ),
          const Spacer(),
          Text(
            currencyFormat.format(orderBloc.state.check.subtotal),
            style: TextStyle(color: textColor2, fontWeight: FontWeight.bold),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Text(
                'order.tax'.tr(),
                style: TextStyle(color: textColor2),
              ),
              const Spacer(),
              Text(
                currencyFormat.format(orderBloc.state.check.totaltax),
                style:
                    TextStyle(color: textColor2, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Text(
                'order.total'.tr(),
                style: TextStyle(
                    color: textColor2,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const Spacer(),
              Text(
                currencyFormat.format(orderBloc.state.check.totalamount),
                style: TextStyle(
                    color: textColor2,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: defaultPadding),
          child: Visibility(
            visible: paymentVisible,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: ChargeBtn(status: status),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            //
            Visibility(
              visible: btnVisible,
              child: CustomToolButton(
                onPressed: () {
                  if (status == "ACTIVE") {
                    voidReasonDialog(context, orderBloc.state.checkId);
                  } else {
                    msg = "Không thể cập nhật";
                    _simpleFailDialog(context);
                  }
                },
                icons: const Icon(
                  Icons.delete,
                  color: voidColor,
                ),
                text: 'order.void'.tr(),
                textColors: voidColor,
                color: voidColorBackground,
              ),
            ),
            Visibility(
              visible: btnVisible,
              child: CustomToolButton(
                onPressed: () {
                  if (status == "ACTIVE") {
                    showChangeBottomSheet(context);
                  } else {
                    msg = "Không thể cập nhật";
                    _simpleFailDialog(context);
                  }
                },
                icons: const Icon(
                  Icons.notifications,
                  color: warningColor,
                ),
                text: 'order.change'.tr(),
                textColors: warningColor,
                color: warningColorBackground,
              ),
            ),
            Visibility(
              visible: btnVisible,
              child: CustomToolButton(
                onPressed: () {
                  if (status == "ACTIVE") {
                    orderBloc.add(SendOrder());
                    orderBloc.add(LoadData(
                        // tableid: orderBloc.state.tableId,
                        checkid: orderBloc.state.checkId));
                  } else {
                    msg = "Không thể cập nhật";
                    _simpleFailDialog(context);
                  }
                },
                icons: const Icon(
                  Icons.send,
                  color: activeColor,
                ),
                text: 'order.send'.tr(),
                textColors: activeColor,
                color: activeColorBackground,
              ),
            ),
          ]),
        )
      ],
    ),
  );
}

Future<dynamic> showChangeBottomSheet(BuildContext context) {
  final TableLayoutBloc tableBloc = BlocProvider.of<TableLayoutBloc>(context);
  final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
    builder: (context2) {
      return Container(
        height: 250,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  tableBloc.add(TableEvent.ChangeTable());
                  showTableBottomModal(context);
                },
                child: ListTile(
                    title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.pivot_table_chart,
                        color: textColor2!,
                      ),
                    ),
                    Text(
                      'order.change_table'.tr(),
                      style: TextStyle(color: textColor2!),
                    )
                  ],
                ))),
            GestureDetector(
                onTap: () {
                  tableBloc.add(TableEvent.ChangeOrder());
                  changeOrderDialog(context);
                },
                child: ListTile(
                    title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.low_priority,
                        color: textColor2!,
                      ),
                    ),
                    Text(
                      'order.change_order'.tr(),
                      style: TextStyle(color: textColor2!),
                    )
                  ],
                ))),
            GestureDetector(
                onTap: () {
                  if (orderBloc.state.check.checkDetail
                      .any((element) => element.status != 'SERVED')) {
                    msg = "Có lỗi trong quá trình chia đơn.";
                    _simpleFailDialog(context);
                  } else {
                    tableBloc.add(TableEvent.SplitOrder());
                    splitOrderDialog(context);
                  }
                },
                child: ListTile(
                    title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.splitscreen,
                        color: textColor2!,
                      ),
                    ),
                    Text(
                      'order.split_order'.tr(),
                      style: TextStyle(color: textColor2!),
                    )
                  ],
                ))),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: ListTile(
                    title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.close,
                        color: textColor2!,
                      ),
                    ),
                    Text(
                      'order.close'.tr(),
                      style: TextStyle(color: textColor2!),
                    )
                  ],
                ))),
          ],
        ),
      );
    },
  );
}

String specialRequestProcess(List<SpecialRequests> specialRequests) {
  String result = '';
  specialRequests.asMap().forEach((key, value) {
    if (key == 0) {
      result = value.name;
    } else {
      result = result + ", " + value.name;
    }
  });
  return result;
}

Future<dynamic> changeOrderDialog(BuildContext context) {
  final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
  final TableLayoutBloc tableBloc = BlocProvider.of<TableLayoutBloc>(context);
  List<CheckDetail> list =
      List<CheckDetail>.from(orderBloc.state.check.checkDetail);
  list.retainWhere((element) => !element.isLocal || element.status != 'RECALL');
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: tableBloc),
              BlocProvider.value(value: orderBloc)
            ],
            child: BlocBuilder<OrderLayoutBloc, OrderLayoutState>(
                builder: (context, state) {
              return Dialog(
                insetPadding: const EdgeInsets.symmetric(
                    vertical: 100.0, horizontal: 400.0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  children: <Widget>[
                    Column(
                      children: [
                        Container(
                          height: 80,
                          child: Center(
                            child: Text(
                              'order.change_order'.tr().toUpperCase(),
                              style: const TextStyle(
                                  color: activeColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: 350,
                            width: double.infinity,
                            child: Scrollbar(
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    color: dividerColor,
                                  );
                                },
                                itemCount: list.length,
                                itemBuilder: (context, index) {
                                  return ActionItemList(
                                      checkDetail: list[index],
                                      currentMode: Mode.changeorder,
                                      name: list[index].itemname,
                                      sepcialRequest: specialRequestProcess(
                                          list[index].specialRequest),
                                      price: currencyFormat
                                          .format(list[index].amount),
                                      isDone: false);
                                },
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SizedBox(
                                width: 200,
                                child: CustomElevatedButton(
                                  text: 'order.confirm'.tr(),
                                  callback: () {
                                    Navigator.of(context).pop();
                                    showTableBottomModal(context);
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SizedBox(
                                width: 200,
                                child: CustomElevatedButton(
                                  buttonColors: voidColor,
                                  text: 'order.close'.tr(),
                                  callback: () {
                                    Navigator.of(context).pop();
                                    tableBloc.add(TableEvent.ResetAction());
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }));
      });
}

Future<dynamic> splitOrderDialog(BuildContext context) {
  final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
  final TableLayoutBloc tableBloc = BlocProvider.of<TableLayoutBloc>(context);
  TextEditingController percentController = TextEditingController();
  final _formKeyNote = GlobalKey<FormState>();
  // List<CheckDetail> list =
  //     List<CheckDetail>.from(orderBloc.state.check.checkDetail);
  // list.retainWhere((element) => !element.isLocal);
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: tableBloc),
              BlocProvider.value(value: orderBloc)
            ],
            child: BlocBuilder<OrderLayoutBloc, OrderLayoutState>(
                builder: (context, state) {
              return Dialog(
                insetPadding: const EdgeInsets.symmetric(
                    vertical: 80.0, horizontal: 400.0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                    children: <Widget>[
                      Form(
                        key: _formKeyNote,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text(
                                'order.split_order'.tr().toUpperCase(),
                                style: const TextStyle(
                                    color: activeColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: percentController,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null ||
                                      int.parse(value) < 1 ||
                                      int.parse(value) > 100) {
                                    return 'order.error.split_order_error'.tr();
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey[100]!),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    fillColor: Colors.grey[100],
                                    filled: true,
                                    prefixIcon: const Icon(Icons.percent)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: CustomElevatedButton(
                                  text: 'order.confirm'.tr(),
                                  callback: () {
                                    if (_formKeyNote.currentState!.validate()) {
                                      orderBloc.add(SelectPercentForSplitOrder(
                                          percent: int.parse(
                                              percentController.text)));
                                      Navigator.of(context).pop();
                                      showTableBottomModal(context);
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
      });
}

Future<dynamic> showTableBottomModal(
  BuildContext context,
) {
  final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
  final TableLayoutBloc tableBloc = BlocProvider.of<TableLayoutBloc>(context);
  return showCupertinoModalBottomSheet(
    context: context,
    builder: (_) {
      return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: tableBloc),
          BlocProvider.value(value: orderBloc)
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const FilterSection(),
                  TableSection(),
                ],
              ),
            )),
          ],
        ),
      );
    },
  );
}

Future<dynamic> voidReasonDialog(BuildContext context, int checkdetailid) {
  final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider<OrderLayoutBloc>.value(
          value: orderBloc,
          child: BlocBuilder<OrderLayoutBloc, OrderLayoutState>(
              builder: (context, state) {
            return Dialog(
              insetPadding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 400.0),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Column(
                      children: [
                        Container(
                          height: 80,
                          child: Center(
                            child: Text(
                              'order.void_reason_title'.tr().toUpperCase(),
                              style: const TextStyle(
                                  color: activeColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5.0),
                          child: state.orderLayoutStatus.isLoading
                              ? const CircularProgressIndicator()
                              : Container(
                                  height: 350,
                                  width: double.infinity,
                                  child: Scrollbar(
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return const Divider(
                                          color: dividerColor,
                                        );
                                      },
                                      itemCount:
                                          orderBloc.state.listVoidReason.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(orderBloc.state
                                              .listVoidReason[index].name),
                                          trailing: Radio<VoidReason>(
                                            groupValue: orderBloc
                                                .state.selectedVoidReason,
                                            value: orderBloc
                                                .state.listVoidReason[index],
                                            onChanged: (value) {
                                              orderBloc.add(SelectVoidReason(
                                                  voidReason: value!));
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: CustomElevatedButton(
                              text: 'order.confirm'.tr(),
                              callback: () {
                                orderBloc.add(VoidACheck(
                                    checkid: orderBloc.state.checkId));
                                Navigator.of(context)
                                    .pushNamed('/tableoverview');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      });
}
