import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/payment.dart';
import 'package:pos_res_android/screens/Payment/widget/payment_action_button.dart';

// ignore: must_be_immutable
class PaymentPaidItem extends StatefulWidget {
  List<PaymentProcess> paidList;
  int checkId;
  PaymentPaidItem({Key? key, required this.checkId, required this.paidList})
      : super(key: key);

  @override
  State<PaymentPaidItem> createState() => _PaymentPaidItemState();
}

class _PaymentPaidItemState extends State<PaymentPaidItem> {
  late List<PaymentProcess> paidList;
  late int checkId;
  @override
  void initState() {
    super.initState();
    paidList = widget.paidList;
    checkId = widget.checkId;
  }

  @override
  Widget build(BuildContext context) {
    num total = 0;
    for (var e in paidList) {
      total += e.amount;
    }
    return Column(
      children: [
        // const Expanded(flex: 1, child: OrderGeneralInfo()),
        // const Divider(color: dividerColor),
        Expanded(
          flex: 10,
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
              itemCount: paidList.length,
              itemBuilder: (context, index) {
                PaymentProcess payment = paidList.elementAt(index);
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      payment.name,
                                      style: TextStyle(
                                        color: textColor2,
                                        fontSize: defaultSize * 4,
                                      ),
                                    ),
                                  ]),
                              const Spacer(),
                              Row(
                                children: [
                                  Text(
                                    payment.amount.toString(),
                                    style: TextStyle(
                                      color: textColor2,
                                      fontSize: defaultSize * 4,
                                      fontWeight: FontWeight.bold,
                                    ),
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
          flex: 4,
          child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: defaultPadding * 1.5),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        "Đã thanh toán",
                        style: TextStyle(
                          color: textColor2,
                          fontSize: defaultSize * 5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        total.toString(),
                        style: TextStyle(
                          color: textColor2,
                          fontSize: defaultSize * 5,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 20),
                //   child: Row(
                //     children: [
                //       Text(
                //         "Tổng thanh toán",
                //         style: TextStyle(
                //             color: textColor2,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20),
                //       ),
                //       const Spacer(),
                //       Text(
                //         "69.300",
                //         style: TextStyle(
                //             color: textColor2,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20),
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
        Expanded(
          // flex: 1,
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: defaultPadding * 0.75,
            ),
            child: PaymentActionButton(checkId: checkId, paidList: paidList),
          ),
        ),
      ],
    );
  }
}
