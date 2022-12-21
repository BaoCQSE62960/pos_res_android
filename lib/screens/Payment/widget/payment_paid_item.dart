import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/payment.dart';
import 'package:pos_res_android/screens/Payment/widget/payment_action_button.dart';

// ignore: must_be_immutable
class PaymentPaidItem extends StatefulWidget {
  Function() undo;
  List<PaymentProcess> paidList;
  int checkId;
  PaymentPaidItem({
    Key? key,
    required this.checkId,
    required this.paidList,
    required this.undo,
  }) : super(key: key);

  @override
  State<PaymentPaidItem> createState() => _PaymentPaidItemState();
}

class _PaymentPaidItemState extends State<PaymentPaidItem> {
  late List<PaymentProcess> paidList;
  late int checkId;
  final moneyFormat = NumberFormat.decimalPattern('vi_VN');

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
                                    moneyFormat.format(payment.amount),
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
                        moneyFormat.format(total),
                        style: TextStyle(
                          color: textColor2,
                          fontSize: defaultSize * 5,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: defaultPadding * 0.75,
            ),
            child: PaymentActionButton(
              checkId: checkId,
              paidList: paidList,
              undo: widget.undo,
            ),
          ),
        ),
      ],
    );
  }
}
