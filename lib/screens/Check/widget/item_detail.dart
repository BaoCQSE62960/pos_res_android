import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pos_res_android/repos/models/cashier/check.dart';

// ignore: must_be_immutable
class CheckItemDetail extends StatefulWidget {
  List<CheckDetailModel> list;
  CheckItemDetail({Key? key, required this.list}) : super(key: key);

  @override
  State<CheckItemDetail> createState() => _CheckItemDetailState();
}

class _CheckItemDetailState extends State<CheckItemDetail> {
  final moneyFormat = NumberFormat.decimalPattern('vi_VN');
  List<CheckDetailModel> checkDetail = [];
  num subTotalShow = 0;
  num taxShow = 0;
  num amountShow = 0;

  @override
  void initState() {
    super.initState();
    checkDetail = widget.list;
    for (var element in checkDetail) {
      subTotalShow += element.subtotal;
      taxShow += element.taxamount;
      amountShow += element.amount;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: defaultPadding * 20,
        height: defaultPadding * 43.5,
        decoration: const BoxDecoration(
          color: textLightColor,
        ),
        child: Column(
          children: [
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
                  itemCount: checkDetail.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: defaultPadding * 2.75,
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
                                        checkDetail[index].quantity.toString(),
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
                                          checkDetail[index].itemname,
                                          style: TextStyle(color: textColor2),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: defaultPadding * 0.25),
                                          child: Text(
                                            checkDetail[index]
                                                .specialrequest!
                                                .map((e) => e.name)
                                                .join(', '),
                                            style: TextStyle(
                                                color: textColor2,
                                                fontSize: defaultSize * 3),
                                          ),
                                        ),
                                      ]),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        moneyFormat.format(
                                            checkDetail[index].subtotal),
                                        style: TextStyle(
                                            color: textColor2,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
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
              flex: 3,
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
                            moneyFormat.format(subTotalShow),
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
                            moneyFormat.format(taxShow),
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
                            moneyFormat.format(amountShow),
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
