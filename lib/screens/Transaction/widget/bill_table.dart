import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/bill.dart';
import 'package:pos_res_android/screens/Bill/bill_detail_screen.dart';
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
  final newFormat = DateFormat('yyyy-MM-dd');

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
                      hintText: "Mã thanh toán",
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
                          // ignore: avoid_print
                          print("_selectedStatus: $_selectedStatus");
                          // ignore: avoid_print
                          print(_selectedStatus[i]);
                          // ignore: avoid_print
                          print("statusFilter: $statusFilter");
                          // ignore: avoid_print
                          print("index: $index");
                          // ignore: avoid_print
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
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  constraints: const BoxConstraints(
                    minHeight: defaultPadding * 2,
                    // minWidth: defaultPadding * 9.75,
                    minWidth: defaultPadding * 13.5,
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
                    'Mã thanh toán',
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
              rows: billFilter
                  .map(
                    (billFilter) => DataRow(
                      cells: [
                        DataCell(Text(newFormat.format(billFilter.date))),
                        DataCell(Text(billFilter.billNo)),
                        DataCell(Text(billFilter.tableName)),
                        DataCell(Text(billFilter.locationName)),
                        DataCell(Text(billFilter.totaltax.toString())),
                        DataCell(Text(billFilter.totalamount.toString())),
                        DataCell(Text(billFilter.status)),
                      ],
                      onLongPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const BillDetailScreen();
                            },
                          ),
                        );
                      },
                    ),
                  )
                  .toList()),
        ),
      ],
    );
  }
}
