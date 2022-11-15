import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:pos_res_android/repos/models/cashier/bill.dart';

// ignore: must_be_immutable
class BillItemDetail extends StatefulWidget {
  List<BillDetailModel> list;
  BillItemDetail({Key? key, required this.list}) : super(key: key);

  @override
  State<BillItemDetail> createState() => _BillItemDetailState();
}

class _BillItemDetailState extends State<BillItemDetail> {
  List<BillDetailModel> billDetail = [];
  num subTotalShow = 0;
  num taxShow = 0;
  num amountShow = 0;

  @override
  void initState() {
    super.initState();
    billDetail = widget.list;
    for (var element in billDetail) {
      subTotalShow += element.subtotal;
      taxShow += element.taxamount;
      amountShow += element.amount;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // flex: 4,
      child: Container(
        width: defaultPadding * 20,
        height: defaultPadding * 36.5,
        decoration: const BoxDecoration(
          color: textLightColor,
        ),
        child: Column(
          children: [
            // const Expanded(flex: 1, child: OrderGeneralInfo()),
            // const Divider(color: dividerColor),
            Expanded(
              flex: 16,
              child: Scrollbar(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Divider(
                        color: dividerColor,
                      ),
                    );
                  },
                  itemCount: billDetail.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: defaultPadding * 3,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        billDetail[index].quantity.toString(),
                                        style: TextStyle(
                                          color: textColor2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        billDetail[index].itemname,
                                        style: TextStyle(color: textColor2),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Text(
                                    billDetail[index].subtotal.toVND(unit: ""),
                                    style: TextStyle(
                                        color: textColor2,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            flex: 8,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const Divider(color: dividerColor),
            Expanded(
              flex: 4,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'order.subtotal'.tr(),
                            style: TextStyle(color: textColor2),
                          ),
                          const Spacer(),
                          Text(
                            subTotalShow.toVND(unit: ""),
                            style: TextStyle(
                                color: textColor2, fontWeight: FontWeight.bold),
                          ),
                        ]),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Text(
                            'order.tax'.tr(),
                            style: TextStyle(color: textColor2),
                          ),
                          const Spacer(),
                          Text(
                            taxShow.toVND(unit: ""),
                            style: TextStyle(
                                color: textColor2, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Text(
                            'order.total'.tr(),
                            style: TextStyle(
                                color: textColor2,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const Spacer(),
                          Text(
                            amountShow.toVND(unit: ""),
                            style: TextStyle(
                                color: textColor2,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
