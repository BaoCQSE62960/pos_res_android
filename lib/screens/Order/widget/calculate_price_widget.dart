import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/waiter/specialrequests.dart';
import 'package:pos_res_android/repos/models/waiter/voidreason.dart';
import 'package:pos_res_android/screens/Order/order.dart';
import 'package:pos_res_android/screens/Order/widget/buttons/custom_elevated_button.dart';
import 'package:pos_res_android/screens/Order/widget/buttons/custom_outlined_button.dart';
import 'package:pos_res_android/screens/Order/widget/buttons/custom_tool_button.dart';
import 'package:pos_res_android/screens/Order/widget/listview_item.dart';
import 'package:pos_res_android/screens/Table/table_layout_bloc.dart';
import 'package:pos_res_android/screens/Table/table_layout_event.dart'
    as TableEvent;
import 'package:pos_res_android/screens/Table/widget/table_layout_table.dart';
import 'package:pos_res_android/screens/Order/widget/buttons/payment_btn.dart';

final currencyFormat = NumberFormat("#,##0", "en_US");

Container calculatePriceWidget(BuildContext context) {
  final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
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
        const Padding(
          padding: EdgeInsets.only(top: defaultPadding),
          child: ChargeBtn(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomToolButton(
              onPressed: () {
                voidReasonDialog(context, orderBloc.state.checkId);
              },
              icons: const Icon(
                Icons.delete,
                color: voidColor,
              ),
              text: 'order.void'.tr(),
              textColors: voidColor,
              color: voidColorBackground,
            ),
            CustomToolButton(
              onPressed: () {
                showChangeBottomSheet(context);
              },
              icons: const Icon(
                Icons.notifications,
                color: warningColor,
              ),
              text: 'order.change'.tr(),
              textColors: warningColor,
              color: warningColorBackground,
            ),
            CustomToolButton(
              onPressed: () {
                orderBloc.add(SendOrder());
                orderBloc.add(LoadData(
                    tableid: orderBloc.state.tableId,
                    checkid: orderBloc.state.checkId));
              },
              icons: const Icon(
                Icons.send,
                color: activeColor,
              ),
              text: 'order.send'.tr(),
              textColors: activeColor,
              color: activeColorBackground,
            )
          ]),
        )
      ],
    ),
  );
}

Future<dynamic> showChangeBottomSheet(BuildContext context) {
  final TableLayoutBloc tableBloc = BlocProvider.of<TableLayoutBloc>(context);
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
    builder: (context2) {
      return Container(
        height: 200,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomOutlinedButton(
                textColors: textColor2!,
                isOutlined: false,
                icons: Icon(Icons.pivot_table_chart, color: textColor2!),
                text: 'order.change_table'.tr(),
                function: () {
                  tableBloc.add(TableEvent.ChangeTable());
                  showTableBottomModal(context);
                }),
            const Divider(color: deactiveColor),
            CustomOutlinedButton(
              textColors: textColor2!,
              isOutlined: false,
              icons: Icon(
                Icons.low_priority,
                color: textColor2!,
              ),
              text: 'order.change_order'.tr(),
              function: () {
                tableBloc.add(TableEvent.ChangeOrder());
                changeOrderDialog(context);
              },
            ),
            const Divider(color: deactiveColor),
            CustomOutlinedButton(
              textColors: textColor2!,
              isOutlined: false,
              icons: Icon(
                Icons.close,
                color: textColor2!,
              ),
              text: 'order.close'.tr(),
              function: () {
                Navigator.of(context).pop();
              },
            )
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
      result = result + " ," + value.name;
    }
  });
  return result;
}

Future<dynamic> changeOrderDialog(BuildContext context) {
  final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
  final TableLayoutBloc tableBloc = BlocProvider.of<TableLayoutBloc>(context);
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
                insetPadding:
                    EdgeInsets.symmetric(vertical: 100.0, horizontal: 400.0),
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
                                itemCount:
                                    orderBloc.state.check.checkDetail.length,
                                itemBuilder: (context, index) {
                                  return ActionItemList(
                                      checkDetail: orderBloc
                                          .state.check.checkDetail[index],
                                      currentMode: Mode.changeorder,
                                      name: orderBloc.state.check
                                          .checkDetail[index].itemname,
                                      sepcialRequest: specialRequestProcess(
                                          orderBloc
                                              .state
                                              .check
                                              .checkDetail[index]
                                              .specialRequest),
                                      price: currencyFormat.format(orderBloc
                                          .state
                                          .check
                                          .checkDetail[index]
                                          .amount),
                                      isDone: false);
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: CustomElevatedButton(
                              text: 'order.confirm'.tr(),
                              callback: () {
                                Navigator.of(context).pop();
                                showTableBottomModal(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
                child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TableSection(),
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
                  EdgeInsets.symmetric(vertical: 50.0, horizontal: 400.0),
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
