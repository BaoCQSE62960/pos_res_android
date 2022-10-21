import 'package:flutter/material.dart';
import 'package:pos_res_android/screens/Transaction/widget/bill_tab.dart';
import 'package:pos_res_android/screens/Transaction/widget/buttons/bill_detail_btn.dart';
import 'package:pos_res_android/screens/Transaction/widget/transaction_action_button.dart';

import '../../common/widgets/background.dart';
import '../../common/widgets/responsive.dart';
import '../../common/widgets/side_bar.dart';
import '../../config/routes.dart';
import '../../config/theme.dart';

const List<Widget> status = <Widget>[
  // Text('Hoạt động'),
  // Text('Hủy'),
  Text('Đóng'),
  Text('Hoàn tiền'),
];

class SearchBillScreen extends StatefulWidget {
  const SearchBillScreen({Key? key}) : super(key: key);

  @override
  State<SearchBillScreen> createState() => _SearchBillScreenState();
}

class _SearchBillScreenState extends State<SearchBillScreen> {
  final List<bool> _selectedStatus = <bool>[false, false];
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
                                  contentPadding: EdgeInsets.fromLTRB(
                                      defaultSize * 4, 0, 0, 0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide.none,
                                  ),
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
                    Container(
                      color: deactiveLightColor,
                      height: MediaQuery.of(context).size.height -
                          defaultPadding * 8,
                      width: MediaQuery.of(context).size.width -
                          defaultPadding * 4.6,
                    ),
                    Container(
                      color: textLightColor,
                      width: MediaQuery.of(context).size.width -
                          defaultPadding * 4.6,
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
                              child: const BillDetailBtn(),
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
