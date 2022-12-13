import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/background.dart';
import 'package:pos_res_android/common/widgets/responsive.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/bill.dart';
import 'package:pos_res_android/screens/Bill/widget/bill_info.dart';
import 'package:pos_res_android/screens/Bill/widget/bill_info_top.dart';
import 'package:pos_res_android/screens/Bill/widget/item_detail.dart';
import 'package:pos_res_android/screens/Bill/widget/payment_detail.dart';
import 'package:pos_res_android/screens/Bill/widget/refund_btn.dart';

class BillDetailScreen extends StatefulWidget {
  final List<BillItem> listBill;
  final List<BillDetailModel> listDetail;
  final List<BillPayment> listPayment;

  const BillDetailScreen({
    Key? key,
    required this.listBill,
    required this.listDetail,
    required this.listPayment,
  }) : super(key: key);

  @override
  State<BillDetailScreen> createState() => _BillDetailScreenState();
}

class _BillDetailScreenState extends State<BillDetailScreen> {
  bool swap = false;
  List<BillItem> billItem = [];
  List<BillDetailModel> billDetail = [];
  List<BillPayment> billPayment = [];
  final List<bool> _selectedTab = <bool>[true, false];
  final List<String> selectedTab = <String>["Chi tiết đơn", "Thanh toán"];

  String tabFilter = "";
  List<Widget> tab = <Widget>[
    const Text('Chi tiết đơn'),
    const Text('Thanh toán'),
  ];

  @override
  void initState() {
    super.initState();
    billItem = widget.listBill;
    billDetail = widget.listDetail;
    billPayment = widget.listPayment;
  }

  @override
  Widget build(BuildContext context) {
    Widget swapWidget = Container();
    if (swap) {
      swapWidget = BillPaymentItemDetail(listPayment: billPayment);
    } else {
      swapWidget = BillItemDetail(list: billDetail);
    }

    var swapTile = ListTile(
      title: swapWidget,
    );

    var buttonTile = ListTile(
      title: ToggleButtons(
        onPressed: (int index) {
          setState(
            () {
              for (int i = 0; i < _selectedTab.length; i++) {
                _selectedTab[i] = i == index;
                tabFilter = selectedTab[index];
                if (i == _selectedTab.length) {
                  tabFilter = "";
                }
                if (tabFilter == "Chi tiết đơn") {
                  swap = false;
                } else {
                  swap = true;
                }
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
          minWidth: defaultPadding * 14.9,
        ),
        isSelected: _selectedTab,
        children: tab,
      ),
    );

    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            tablet: Row(
              children: [
                const SizedBox(
                  child: SideBar(),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          color: textLightColor,
                          width: defaultPadding * 2.5,
                          height: defaultPadding * 2.5,
                          child: const Padding(
                            padding:
                                EdgeInsets.only(top: defaultPadding * 0.25),
                            child: BackButton(color: textColor),
                          ),
                        ),
                        Container(
                            color: textLightColor,
                            width: MediaQuery.of(context).size.width -
                                defaultPadding * 7,
                            height: defaultPadding * 2.5,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: defaultPadding * 0.5),
                              child: BillGeneralInfo(list: billItem),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          color: textLightColor,
                          height: MediaQuery.of(context).size.height -
                              defaultPadding * 4,
                          width: MediaQuery.of(context).size.width * 0.6 -
                              defaultPadding * 4.5,
                          child: Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Column(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height -
                                        defaultPadding * 9,
                                    width: MediaQuery.of(context).size.width *
                                            0.6 -
                                        defaultPadding * 4.5,
                                    child: BillInfo(list: billItem)),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: defaultPadding * 0.5),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 4.5,
                                    child: RefundBtn(list: billItem),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height -
                                  defaultPadding * 4,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Scaffold(
                                body: ListView(
                                  children: <Widget>[
                                    buttonTile,
                                    swapTile,
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
