// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/waiter/checkdetail.dart';
import 'package:pos_res_android/repos/models/waiter/specialrequests.dart';
import 'package:pos_res_android/repos/models/waiter/voidreason.dart';
import 'package:pos_res_android/screens/Order/order.dart';
import 'package:pos_res_android/screens/Order/widget/buttons/custom_elevated_button.dart';
import 'package:pos_res_android/screens/Order/widget/listview_item.dart';
import 'package:easy_localization/easy_localization.dart';

final currencyFormat = NumberFormat("#,##0", "en_US");

class OrderDetailInfo extends StatelessWidget {
  OrderDetailInfo({
    Key? key,
  }) : super(key: key);
  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
    return Scrollbar(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            color: dividerColor,
          );
        },
        itemCount: orderBloc.state.check.checkDetail.length,
        itemBuilder: (context, index) {
          return Slidable(
            child: ActionItemList(
                checkDetail: orderBloc.state.check.checkDetail[index],
                name: orderBloc.state.check.checkDetail[index].itemname,
                sepcialRequest: specialRequestProcess(
                    orderBloc.state.check.checkDetail[index].specialRequest),
                price: orderBloc.state.check.checkDetail[index].isLocal
                    ? currencyFormat.format(
                        orderBloc.state.check.checkDetail[index].amount *
                            orderBloc.state.check.checkDetail[index].quantity)
                    : currencyFormat.format(
                        orderBloc.state.check.checkDetail[index].amount),
                isDone: false),
            startActionPane: startActionPaneBuilder(
                orderBloc.state.check.checkDetail[index].status,
                orderBloc.state.check.checkDetail[index],
                orderBloc),
            endActionPane: RemindOrderActionPane(
                context, orderBloc.state.check.checkDetail[index], orderBloc),
          );
        },
      ),
    );
  }

  ActionPane? startActionPaneBuilder(
      String status, CheckDetail checkDetail, OrderLayoutBloc orderBloc) {
    switch (status) {
      case 'READY':
        return WaitingOrderActionPane(checkDetail, orderBloc);
      case 'LOCAL':
        return LocalOrderActionPane(checkDetail, orderBloc);
      case 'RECALL':
        return DoneOrderActionPane(checkDetail, orderBloc);
      case 'WAITING':
        return DoneOrderActionPane(checkDetail, orderBloc);
      default:
        return null;
    }
  }

  // ignore: non_constant_identifier_names
  ActionPane WaitingOrderActionPane(
      CheckDetail checkDetail, OrderLayoutBloc orderBloc) {
    return ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (context) {
            orderBloc.add(
                ServedACheckDetail(checkdetailid: checkDetail.checkdetailid));
            orderBloc.add(LoadData(
                tableid: orderBloc.state.tableId,
                checkid: orderBloc.state.checkId));
          },
          backgroundColor: activeColor,
          foregroundColor: Colors.white,
          icon: Icons.done,
        )
      ],
      extentRatio: 0.2,
    );
  }

  // ignore: non_constant_identifier_names
  ActionPane LocalOrderActionPane(
      CheckDetail checkDetail, OrderLayoutBloc orderBloc) {
    return ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (context) {
            orderBloc.add(LoadSpecialRequestsForItem(
                itemid: checkDetail.itemid,
                checkdetailid: checkDetail.checkdetailidLocal));
            specialRequestDialog(context, checkDetail.checkdetailidLocal);
          },
          backgroundColor: warningColor,
          foregroundColor: Colors.white,
          icon: Icons.note_alt,
          // label: 'order.special_request'.tr(),
        )
      ],
      extentRatio: 0.2,
    );
  }

  // ignore: non_constant_identifier_names
  ActionPane DoneOrderActionPane(
      CheckDetail checkDetail, OrderLayoutBloc orderBloc) {
    return ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (context) {
            voidReasonDialog(context, checkDetail.checkdetailid);
          },
          backgroundColor: voidColor,
          foregroundColor: Colors.white,
          icon: Icons.delete,
        ),
      ],
      extentRatio: 0.2,
    );
  }

  // ignore: non_constant_identifier_names
  ActionPane RemindOrderActionPane(BuildContext context,
      CheckDetail checkDetail, OrderLayoutBloc orderBloc) {
    return ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (context) {
            orderBloc.add(
                RemindACheckDetail(checkdetailid: checkDetail.checkdetailid));
          },
          backgroundColor: warningColor,
          foregroundColor: Colors.white,
          icon: Icons.notification_important_sharp,
          // label: 'order.void'.tr(),
        ),
      ],
      extentRatio: 0.2,
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

  Future<dynamic> specialRequestDialog(
      BuildContext context, int checkdetailid) {
    final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return BlocProvider<OrderLayoutBloc>.value(
            value: orderBloc,
            child: BlocBuilder<OrderLayoutBloc, OrderLayoutState>(
                builder: (context, state) {
              return Dialog(
                insetPadding: const EdgeInsets.symmetric(
                    vertical: 50.0, horizontal: 400.0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: [
                          SizedBox(
                            height: 80,
                            child: Center(
                              child: Text(
                                'order.special_request_title'
                                    .tr()
                                    .toUpperCase(),
                                style: const TextStyle(
                                    color: activeColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, left: 10, right: 10),
                            child: SizedBox(
                              height: 100,
                              width: double.infinity,
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                minLines: 4,
                                decoration: InputDecoration(
                                    hintText: 'order.check_note_hint'.tr(),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey[100]!),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    fillColor: Colors.grey[100],
                                    filled: true),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5.0),
                            child: state.orderLayoutStatus.isLoading
                                ? const CircularProgressIndicator()
                                : SizedBox(
                                    height: 350,
                                    width: double.infinity,
                                    child: Scrollbar(
                                      child: ListView.separated(
                                        separatorBuilder: (context, index) {
                                          return const Divider(
                                            color: dividerColor,
                                          );
                                        },
                                        itemCount: orderBloc
                                            .state.listSpecialRequest.length,
                                        itemBuilder: (context, index) {
                                          return CheckboxListTile(
                                            title: Text(orderBloc
                                                .state
                                                .listSpecialRequest[index]
                                                .name),
                                            value: state
                                                    .listSelectedSpecialRequest
                                                    .isEmpty
                                                ? false
                                                : state
                                                    .listSelectedSpecialRequest
                                                    .any((element) =>
                                                        element.id ==
                                                        orderBloc
                                                            .state
                                                            .listSpecialRequest[
                                                                index]
                                                            .id),
                                            onChanged: (value) {
                                              orderBloc.add(
                                                  SelectSpecialRequestForItem(
                                                      specialRequests: orderBloc
                                                              .state
                                                              .listSpecialRequest[
                                                          index]));
                                            },
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
                                  orderBloc.add(UpdateSpecialRequestForItem(
                                      checkdetailid: checkdetailid));
                                  Navigator.of(context).pop();
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
                insetPadding: const EdgeInsets.symmetric(
                    vertical: 50.0, horizontal: 400.0),
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
                                        itemCount: orderBloc
                                            .state.listVoidReason.length,
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
                                  orderBloc.add(VoidACheckDetail(
                                      checkdetailid: checkdetailid));
                                  orderBloc.add(LoadData(
                                      tableid: orderBloc.state.tableId,
                                      checkid: orderBloc.state.checkId));
                                  Navigator.pop(context);
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
}
