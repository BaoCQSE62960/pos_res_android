import 'package:data_table_2/data_table_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/check.dart';
import 'package:pos_res_android/repos/services/check_service.dart';
import 'package:pos_res_android/screens/Check/check_detail_screen.dart';
import 'package:pos_res_android/screens/Transaction/widget/transaction_tab.dart';

class ViewListChecks extends StatefulWidget {
  final List<Check> list;
  const ViewListChecks({Key? key, required this.list}) : super(key: key);

  @override
  State<ViewListChecks> createState() => _ViewListChecksState();
}

class _ViewListChecksState extends State<ViewListChecks> {
  final List<bool> _selectedStatus = <bool>[false, false, false];
  final List<String> selectedStatus = <String>["ACTIVE", "INACTIVE", "CLOSED"];
  final CheckService service = Get.put(CheckService());

  List<Check> checks = [];
  List<Check> checkFilter = [];
  List<CheckItem> checkItem = [];
  String statusFilter = "";
  String msg = "";
  // int? sortColumnIndex;
  // bool isAscending = false;
  final newFormat = DateFormat('yyyy-MM-dd');

  List<Widget> status = <Widget>[
    const Text('Hoạt động'),
    const Text('Hủy'),
    const Text('Đóng'),
  ];

  // void convertFutureListToList(
  //     Future getCheckItem, List<CheckItem> checkItem) async {
  //   checkItem = await getCheckItem;
  // }

  Future getCheckItemDetail(int checkId) async {
    checkItem = await service.getCheckItem(checkId);
    return checkItem;
  }

  @override
  void initState() {
    super.initState();
    checks = widget.list;
    checkFilter = checks;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: textLightColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: defaultPadding * 3,
                // width: defaultPadding * 2,
                // color: deactiveLightColor,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: defaultPadding * 0.25,
                    right: defaultPadding * 0.25,
                  ),
                  child: TransactionTab(),
                ),
                // decoration: const BoxDecoration(
                //   border: Border(
                //     right: BorderSide(color: primaryColor),
                //   ),
                // ),
              ),
              SizedBox(
                // width: MediaQuery.of(context).size.width / 5 +
                //     defaultPadding * 5.55,
                width: MediaQuery.of(context).size.width / 3,
                height: defaultPadding * 3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: defaultPadding * 0.25,
                    left: defaultPadding * 0.5,
                    top: defaultPadding * 0.25,
                    bottom: defaultPadding * 0.25,
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
                      hintText: "Mã đơn hàng",
                      // prefixIcon: Padding(
                      //   padding: EdgeInsets.all(defaultPadding),
                      //   child: Icon(Icons.lock),
                      // ),
                    ),
                    onChanged: (String input) {
                      setState(
                        () {
                          checkFilter = checks
                              .where(
                                  (element) => element.checkno.contains(input))
                              .toList();
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: defaultPadding * 0.5,
                  left: defaultPadding * 0.25,
                ),
                child: ToggleButtons(
                  //       for (int i = 0; i < _selectedFruits.length; i++) {
                  //         _selectedFruits[i] = i == index;
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < _selectedStatus.length; i++) {
                        _selectedStatus[i] = i == index;
                        statusFilter = selectedStatus[index];
                        // _selectedStatus[index] =
                        //     !_selectedStatus[index];
                        // if (index == 0 && _selectedStatus[index]) {
                        // } else if (index == 0 &&
                        //     !_selectedStatus[index]) {
                        checkFilter = checks
                            .where((element) =>
                                element.status.contains(statusFilter))
                            .toList();
                      }
                    });
                  },
                  selectedBorderColor: activeColor,
                  selectedColor: textColor,
                  fillColor: selectColor,
                  color: textColor,
                  borderColor: primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  constraints: const BoxConstraints(
                    minHeight: defaultPadding * 2,
                    // minWidth: defaultPadding * 6.5,
                    minWidth: defaultPadding * 9,
                  ),
                  isSelected: _selectedStatus,
                  children: status,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - defaultPadding * 8,
          width: MediaQuery.of(context).size.width - defaultPadding * 5,
          child: DataTable2(
              // sortAscending: isAscending,
              // sortColumnIndex: sortColumnIndex,
              columns: const [
                DataColumn(
                  label: Text(
                    'Ngày',
                    style: TextStyle(
                      // fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // onSort: onSort,
                ),
                DataColumn(
                  label: Text(
                    'Mã đơn hàng',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Bàn',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Khu vực',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Thuế',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  numeric: true,
                ),
                DataColumn(
                  label: Text(
                    'Thành tiền',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  numeric: true,
                ),
                DataColumn(
                  label: Text(
                    'Trạng thái',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
              rows: checkFilter.map((checkFilter) {
                String statusShow = checkFilter.status;
                String? tableNameShow = checkFilter.tablename;
                if (statusShow == 'ACTIVE') {
                  statusShow = 'Hoạt động';
                } else if (statusShow == 'INACTIVE') {
                  statusShow = 'Hủy';
                } else if (statusShow == 'CLOSED') {
                  statusShow = 'Đóng';
                }
                tableNameShow ??= "";

                return DataRow(
                  cells: [
                    DataCell(Text(newFormat.format(checkFilter.creationtime))),
                    DataCell(Text(checkFilter.checkno)),
                    DataCell(Text(tableNameShow)),
                    DataCell(Text(checkFilter.locationname)),
                    DataCell(Text(checkFilter.totaltax.toString())),
                    DataCell(Text(checkFilter.totalamount.toString())),
                    DataCell(Text(statusShow)),
                  ],
                  onLongPress: () async {
                    // if (statusShow == 'Hoạt động') {
                    //   //push checkOrder
                    // } else {
                    checkItem = await getCheckItemDetail(checkFilter.id);
                    // Navigator.of(context).pushNamed('/tableoverview');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CheckDetailScreen(listCheck: checkItem);
                        },
                      ),
                    );
                    // }
                  },
                );
              }).toList()),
        ),
      ],
    );
  }

  // void onSort(int columnIndex, bool ascending) {
  //   if (columnIndex == 0) {
  //     checkFilter.sort((check1, check2) => compareString(
  //         ascending, '${check1.creationtime}', '${check2.creationtime}'));
  //   } else if (columnIndex == 1) {
  //     checkFilter.sort((check1, check2) =>
  //         compareString(ascending, check1.checkno, check2.checkno));
  //   } else if (columnIndex == 6) {
  //     checkFilter.sort((check1, check2) =>
  //         compareString(ascending, check1.status, check2.status));
  //   }

  //   setState(() {
  //     this.sortColumnIndex = columnIndex;
  //     this.isAscending = ascending;
  //   });
  // }

  // int compareString(bool ascending, String value1, String value2) =>
  //     ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
