import 'package:flutter/material.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/transaction/models/bill.dart';
import 'package:pos_res_android/screens/Transaction/widget/bill_tab.dart';

class BillDatatable extends StatefulWidget {
  const BillDatatable({Key? key}) : super(key: key);

  @override
  State<BillDatatable> createState() => _BillDatatableState();
}

class _BillDatatableState extends State<BillDatatable> {
  final List<bool> _selectedStatus = <bool>[false, false];
  final List<String> selectedStatus = <String>["Đóng", "Hoàn tiền"];

  List billFilter = [];
  String statusFilter = "";
  List<Widget> status = <Widget>[
    // Text('Hoạt động'),
    // Text('Hủy'),
    const Text('Đóng'),
    const Text('Hoàn tiền'),
  ];

  @override
  void initState() {
    setState(() {
      billFilter = bills;
    });
    super.initState();
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
                  child: BillTab(),
                ),
                // decoration: const BoxDecoration(
                //   border: Border(
                //     right: BorderSide(color: primaryColor),
                //   ),
                // ),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width / 5 +
                    defaultPadding * 7.05,
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
                    obscureText: true,
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
                      hintText: "Mã hóa đơn",
                      // prefixIcon: Padding(
                      //   padding: EdgeInsets.all(defaultPadding),
                      //   child: Icon(Icons.lock),
                      // ),
                    ),
                    onChanged: (String input) {
                      setState(
                        () {
                          billFilter = bills
                              .where(
                                  (element) => element.billNo.contains(input))
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
                  onPressed: (int index) {
                    setState(
                      () {
                        for (int i = 0; i < _selectedStatus.length; i++) {
                          _selectedStatus[i] = i == index;
                          statusFilter = selectedStatus[index];
                          if (i == _selectedStatus.length) {
                            statusFilter = "";
                          }
                          print("_selectedStatus: $_selectedStatus");
                          print(_selectedStatus[i]);
                          print("statusFilter: $statusFilter");
                          print("index: $index");
                          print("i: $i");
                        }

                        billFilter = bills
                            .where((element) =>
                                element.status.contains(statusFilter))
                            .toList();
                      },
                    );
                  },
                  selectedBorderColor: activeColor,
                  selectedColor: textColor,
                  fillColor: selectColor,
                  color: textColor,
                  borderColor: primaryColor,
                  constraints: const BoxConstraints(
                    minHeight: defaultPadding * 2,
                    minWidth: defaultPadding * 9.75,
                  ),
                  isSelected: _selectedStatus,
                  children: status,
                ),
              ),

              // SizedBox(
              //   width: defaultPadding * 7,
              //   height: defaultPadding * 3,
              //   child: Padding(
              //     padding:
              //         const EdgeInsets.all(defaultPadding * 0.25),
              //     child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: selectColor,
              //         foregroundColor: textColor,
              //       ),
              //       onPressed: () {},
              //       child: const Text(
              //         "Hoạt động",
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - defaultPadding * 8,
          width: MediaQuery.of(context).size.width - defaultPadding * 5,
          child: DataTable(
              columns: const [
                DataColumn(
                  label: Text(
                    'Ngày',
                    style: TextStyle(
                      // fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Mã hóa đơn',
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
                    'Tổng thanh toán',
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
              rows: billFilter
                  .map((billFilter) => DataRow(cells: [
                        DataCell(Text(billFilter.date)),
                        DataCell(Text(billFilter.billNo)),
                        DataCell(Text(billFilter.tableName)),
                        DataCell(Text(billFilter.locationName)),
                        DataCell(Text(billFilter.tax.toString())),
                        DataCell(Text(billFilter.total.toString())),
                        DataCell(Text(billFilter.status)),
                      ]))
                  .toList()),
        ),
      ],
    );
  }
}
