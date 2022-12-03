import 'package:data_table_2/data_table_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/log.dart';
import 'package:pos_res_android/repos/services/cashier/log_service.dart';
import 'package:pos_res_android/screens/Cashier/widget/update_amount_popup.dart';

class ViewListCashierLog extends StatefulWidget {
  final List<CashierLog> list;
  const ViewListCashierLog({Key? key, required this.list}) : super(key: key);

  @override
  State<ViewListCashierLog> createState() => _ViewListCashierLogState();
}

class _ViewListCashierLogState extends State<ViewListCashierLog> {
  final CashierLogService service = Get.put(CashierLogService());

  List<CashierLog> logs = [];
  List<CashierLog> logFilter = [];
  List<CashierLogItem> logItem = [];
  late int logId;
  String msg = "";
  int? sortColumnIndex;
  bool isAscending = false;
  final newFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  final moneyFormat = NumberFormat.decimalPattern('vi_VN');

  Future<void> _updateAmount(CashierLog log) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AmountPopup(log: log);
      },
    );
  }

  Future getCashierLogItem(logId) async {
    logItem = await service.getCashierLogAmount(logId);
    return logItem;
  }

  //check isVerify
  // checkVerify(bool verify) {
  //   setState(() {
  //     if (verify == true) {
  //       isVisible = false;
  //     } else {
  //       isVisible = true;
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
    logs = widget.list;
    logFilter = logs;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              // width: MediaQuery.of(context).size.width / 5 +
              //     defaultPadding * 5.55,
              width: MediaQuery.of(context).size.width / 3,
              height: defaultPadding * 3,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: defaultPadding * 0.5,
                  top: defaultPadding * 0.5,
                ),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  cursorColor: textColor,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: deactiveLightColor,
                    prefixIconColor: primaryColor,
                    contentPadding:
                        EdgeInsets.fromLTRB(defaultSize * 4, 0, 0, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Tên thu ngân",
                    // prefixIcon: Padding(
                    //   padding: EdgeInsets.all(defaultPadding),
                    //   child: Icon(Icons.lock),
                    // ),
                  ),
                  onChanged: (String input) {
                    setState(
                      () {
                        logFilter = logs
                            .where(
                                (element) => element.fullname.contains(input))
                            .toList();
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - defaultPadding * 5,
          width: MediaQuery.of(context).size.width - defaultPadding * 5,
          child: DataTable2(
              // PaginatedDataTable
              sortAscending: isAscending,
              sortColumnIndex: sortColumnIndex,
              columns: [
                const DataColumn(
                  label: Text(
                    'Tên thu ngân',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const DataColumn(
                  label: Text(
                    'Ca làm việc',
                    style: TextStyle(
                      // fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: const Text(
                    'Thời gian tạo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onSort: onSort,
                ),
                DataColumn(
                  label: const Text(
                    'Loại',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onSort: onSort,
                ),
                const DataColumn(
                  label: Text(
                    'Tổng tiền',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  numeric: true,
                ),
                const DataColumn(
                  label: Text(
                    'Hành động',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  numeric: true,
                ),
              ],
              rows: logFilter.map(
                (logFilter) {
                  String typeShow = logFilter.type;
                  if (typeShow == 'OPEN') {
                    typeShow = 'Mở ca';
                  } else if (typeShow == 'CLOSED') {
                    typeShow = 'Đóng ca';
                  }
                  return DataRow(
                    cells: [
                      DataCell(Text(logFilter.fullname)),
                      DataCell(Text(logFilter.shiftname)),
                      DataCell(Text(newFormat.format(logFilter.creationtime))),
                      DataCell(Text(typeShow)),
                      DataCell(Text(moneyFormat.format(logFilter.amount))),
                      DataCell(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Visibility(
                              visible: !logFilter.isverify,
                              child: TextButton(
                                onPressed: () async {
                                  logItem =
                                      await getCashierLogItem(logFilter.id);
                                  await _updateAmount(logFilter);
                                  setState(() {});
                                },
                                style: TextButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  backgroundColor: activeColor,
                                ),
                                child: Row(
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: defaultPadding * 0.25),
                                      child: Icon(
                                        Icons.edit,
                                        size: defaultSize * 5,
                                        color: textLightColor,
                                      ),
                                    ),
                                    Text(
                                      'Cập nhật',
                                      style: TextStyle(
                                        color: textLightColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ).toList()),
        ),
      ],
    );
  }

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 2) {
      logFilter.sort((log1, log2) => compareString(
          ascending, '${log1.creationtime}', '${log2.creationtime}'));
    } else if (columnIndex == 3) {
      logFilter
          .sort((log1, log2) => compareString(ascending, log1.type, log2.type));
    }

    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
