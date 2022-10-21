import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/screens/Order/order.dart';
import 'package:pos_res_android/screens/Table/table_layout.dart';
import 'package:pos_res_android/screens/Table/table_layout_bloc.dart';
import 'package:pos_res_android/screens/Table/table_layout_event.dart';
import 'package:pos_res_android/screens/Table/utils/selected_mode_enum.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../config/routes.dart';
import '../../../config/theme.dart';

class TableItem extends StatelessWidget {
  const TableItem({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    final TableLayoutBloc counterBloc =
        BlocProvider.of<TableLayoutBloc>(context);
    return BlocBuilder<TableLayoutBloc, TableLayoutState>(
      builder: (context, state) {
        return Hero(
          tag: "table_demo_btn",
          child: GestureDetector(
            onTap: () async {
              counterBloc.add(counterBloc.state.firstSelectedTableName.isEmpty
                  ? FirstSelectTable(firstTableName: id)
                  : SecondSelectTable(secondTableName: id));
              state.secondSelectedTableName != ""
                  ? showConfirmDialog(context, state.firstSelectedTableName,
                      state.secondSelectedTableName)
                  : null;
            },
            onDoubleTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const OrderScreen();
                  },
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: deactiveColor,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                    width: 2.0,
                    color: state.currentSelectedMode == SelectedMode.NONE
                        ? Colors.white
                        : (state.firstSelectedTableName == id ||
                                state.secondSelectedTableName == id
                            ? Colors.blue
                            : Colors.white)),
                boxShadow: const [
                  BoxShadow(
                    color: shadowColor,
                    blurRadius: 3,
                    offset: Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: activeColor,
                      borderRadius: BorderRadius.only(
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
                        const Text(
                          "Bàn 1",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: textLightColor),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "(0)",
                              style: TextStyle(
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
                                Text(
                                  "1.500.000".toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: textColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: defaultPadding * 2.5,
                                height: defaultPadding * 2.5,
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
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
                              SizedBox(
                                width: defaultPadding * 2.5,
                                height: defaultPadding * 2.5,
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
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
                              SizedBox(
                                width: defaultPadding * 2.5,
                                height: defaultPadding * 2.5,
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
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

                  // Container(
                  //   height: defaultPadding * 0.5,
                  // )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  showConfirmDialog(
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
}
