import 'package:flutter/material.dart';
import 'package:pos_res_android/screens/Transaction/widget/check_detail_btn.dart';
import 'package:pos_res_android/screens/Transaction/widget/transaction_action_button.dart';
import 'package:pos_res_android/screens/Transaction/widget/transaction_tab.dart';

import '../../common/widgets/background.dart';
import '../../common/widgets/responsive.dart';
import '../../common/widgets/side_bar.dart';
import '../../config/routes.dart';
import '../../config/theme.dart';

const List<Widget> status = <Widget>[
  Text('Hoạt động'),
  Text('Hủy'),
  Text('Đóng'),
  // Text('Hoàn tiền'),
];

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final List<bool> _selectedStatus = <bool>[false, false, false];
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            tablet: Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  child: SideBar(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  contentPadding: EdgeInsets.fromLTRB(
                                      defaultSize * 4, 0, 0, 0),
                                  fillColor: deactiveLightColor,
                                  hintText: "Mã hóa đơn",
                                  // prefixIcon: Padding(
                                  //   padding: EdgeInsets.all(defaultPadding),
                                  //   child: Icon(Icons.lock),
                                  // ),
                                ),
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
                                setState(() {
                                  _selectedStatus[index] =
                                      !_selectedStatus[index];
                                  if (index == 0 && _selectedStatus[index]) {
                                  } else if (index == 0 &&
                                      !_selectedStatus[index]) {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) {
                                    //       return const LoginScreen();
                                    //     },
                                    //   ),
                                    // );
                                  }
                                });
                              },
                              selectedBorderColor: activeColor,
                              selectedColor: textColor,
                              fillColor: selectColor,
                              color: textColor,
                              borderColor: primaryColor,
                              constraints: const BoxConstraints(
                                minHeight: defaultPadding * 2,
                                minWidth: defaultPadding * 6.5,
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
                    // Container(
                    //   color: deactiveLightColor,
                    //   height: MediaQuery.of(context).size.height -
                    //       defaultPadding * 8,
                    //   width: MediaQuery.of(context).size.width -
                    //       MediaQuery.of(context).size.width / 14,
                    // ),
                    Container(
                      color: textLightColor,
                      height: MediaQuery.of(context).size.height -
                          defaultPadding * 8,
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width / 14,
                      child: DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Ngày',
                                style: TextStyle(
                                  // fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Mã hóa đơn',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Bàn',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Khu vực',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Thuế',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Tổng thanh toán',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Trạng thái',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                        rows: const <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                SizedBox(
                                  width: 80,
                                  child: Text('19/12/2020'),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  width: 100,
                                  child: Text('4512786'),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  width: 30,
                                  child: Text('A1'),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  width: 60,
                                  child: Text('Sảnh A'),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  width: 75,
                                  child: Text('50.000.000'),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  width: 90,
                                  child: Text('550.000.000'),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  width: 80,
                                  child: Text('Hoạt động'),
                                ),
                              ),
                            ],
                          ),
                          // DataRow(
                          //   cells: <DataCell>[
                          //     DataCell(Text('Janine')),
                          //     DataCell(Text('43')),
                          //     DataCell(Text('Professor')),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      color: textLightColor,
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width / 14,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const TransactionActionButton(),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: defaultPadding * 0.25,
                              top: defaultPadding * 0.25,
                              bottom: defaultPadding * 0.25,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 4.5,
                              child: const CheckDetailBtn(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
