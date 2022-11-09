import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/table.dart';
import 'package:pos_res_android/screens/Order/order_screen.dart';
import 'package:pos_res_android/screens/Table/table_layout_bloc.dart';
import 'package:pos_res_android/screens/Table/table_layout_event.dart';
import 'package:pos_res_android/screens/Table/table_layout_state.dart';
import 'package:pos_res_android/screens/Table/utils/selected_mode_enum.dart';

final currencyFormat = NumberFormat("#,##0", "en_US");

class TableItem extends StatelessWidget {
  const TableItem({Key? key, required this.tableDetail}) : super(key: key);
  final TableDetail tableDetail;

  @override
  Widget build(BuildContext context) {
    final TableLayoutBloc counterBloc =
        BlocProvider.of<TableLayoutBloc>(context);
    return BlocBuilder<TableLayoutBloc, TableLayoutState>(
        builder: (context, state) {
      return Hero(
        tag: "table_demo_btn",
        child: GestureDetector(
          onLongPress: () {
            counterBloc.add(counterBloc.state.firstSelectedTableName.isEmpty
                ? FirstSelectTable(firstTableName: tableDetail.id.toString())
                : SecondSelectTable(
                    secondTableName: tableDetail.id.toString()));
          },
          onDoubleTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return OrderScreen(
                    table: tableDetail,
                  );
                },
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: deactiveColor,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                  width: defaultSize * 0.5,
                  color: state.currentSelectedMode == SelectedMode.NONE
                      ? deactiveColor
                      : (counterBloc.state.firstSelectedTableName ==
                                  tableDetail.id.toString() ||
                              counterBloc.state.secondSelectedTableName ==
                                  tableDetail.id.toString()
                          ? Colors.blue
                          : deactiveColor)),
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
                width: defaultPadding * 11,
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
                width: defaultPadding * 11,
                height: defaultPadding * 5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: textLightColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0)),
                      side: BorderSide(color: primaryColor),
                    ),
                    // maximumSize:
                    //     const Size(defaultPadding * 8, defaultPadding * 8),
                  ),
                  onPressed: () {},
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
                                        .format(tableDetail.totalamount)
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
                          ? SizedBox()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                !tableDetail.isready
                                    ? SizedBox()
                                    : SizedBox(
                                        width: defaultPadding * 2.5,
                                        height: defaultPadding * 2.5,
                                        child: TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            backgroundColor: warningColor,
                                          ),
                                          child: const Icon(
                                            Icons.dining,
                                            size: defaultPadding * 1.5,
                                            color: textLightColor,
                                          ),
                                        ),
                                      ),
                                Container(
                                  width: defaultPadding * 0.3,
                                ),
                                !tableDetail.isrecall
                                    ? SizedBox()
                                    : SizedBox(
                                        width: defaultPadding * 2.5,
                                        height: defaultPadding * 2.5,
                                        child: TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            backgroundColor: voidColor,
                                          ),
                                          child: const Icon(
                                            Icons.cancel,
                                            size: defaultPadding * 1.5,
                                            color: textLightColor,
                                          ),
                                        ),
                                      ),
                                Container(
                                  width: defaultPadding * 0.3,
                                ),
                                !tableDetail.iswaiting
                                    ? SizedBox()
                                    : SizedBox(
                                        width: defaultPadding * 2.5,
                                        height: defaultPadding * 2.5,
                                        child: TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            backgroundColor: shadowColor,
                                          ),
                                          child: const Icon(
                                            Icons.timelapse_rounded,
                                            size: defaultPadding * 1.5,
                                            color: textLightColor,
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      );
    });
  }
}
