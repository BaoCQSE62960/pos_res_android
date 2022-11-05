import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/check.dart';
import 'package:pos_res_android/repos/services/check_service.dart';
import 'package:pos_res_android/screens/Check/check_detail_screen.dart';
import 'package:pos_res_android/screens/Transaction/widget/transaction_tab.dart';

class CheckDatatable extends StatefulWidget {
  const CheckDatatable({Key? key}) : super(key: key);

  @override
  State<CheckDatatable> createState() => _CheckDatatableState();
}

class _CheckDatatableState extends State<CheckDatatable> {
  final List<bool> _selectedStatus = <bool>[false, false, false];
  final List<String> selectedStatus = <String>["Hoạt động", "Hủy", "Đóng"];
  final CheckController controller = Get.put(CheckController());
  List checkFilter = [];
  String statusFilter = "";
  final newFormat = DateFormat('yyyy-MM-dd');

  List<Widget> status = <Widget>[
    const Text('Hoạt động'),
    const Text('Hủy'),
    const Text('Đóng'),
    // Text('Hoàn tiền'),
  ];

  @override
  void initState() {
    setState(() {
      checkFilter = checks;
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
                    setState(
                      () {
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
                    // minWidth: defaultPadding * 6.5,
                    minWidth: defaultPadding * 9,
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
              rows: checkFilter
                  .map(
                    (checkFilter) => DataRow(
                      cells: [
                        DataCell(Text(newFormat.format(checkFilter.date))),
                        DataCell(Text(checkFilter.checkno)),
                        DataCell(Text(checkFilter.tablename)),
                        DataCell(Text(checkFilter.locationname)),
                        DataCell(Text(checkFilter.totaltax.toString())),
                        DataCell(Text(checkFilter.totalamount.toString())),
                        DataCell(Text(checkFilter.status)),
                      ],
                      onLongPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const CheckDetailScreen();
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
