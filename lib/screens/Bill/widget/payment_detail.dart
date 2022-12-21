import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/bill.dart';

class BillPaymentItemDetail extends StatefulWidget {
  final List<BillPayment> listPayment;
  const BillPaymentItemDetail({Key? key, required this.listPayment})
      : super(key: key);

  @override
  State<BillPaymentItemDetail> createState() => _BillPaymentItemDetailState();
}

class _BillPaymentItemDetailState extends State<BillPaymentItemDetail> {
  List<BillPayment> billPayment = [];
  num amountShow = 0;
  final moneyFormat = NumberFormat.decimalPattern('vi_VN');

  @override
  void initState() {
    super.initState();
    billPayment = widget.listPayment;
    for (var element in billPayment) {
      amountShow += element.amountreceive;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: defaultPadding * 20,
      height: defaultPadding * 36.5,
      decoration: const BoxDecoration(
        color: textLightColor,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 15,
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
                itemCount: billPayment.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: defaultPadding * 2,
                    child: Row(
                      children: [
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
                                        billPayment[index].paymentmethodname,
                                        style: TextStyle(color: textColor2),
                                      ),
                                    ]),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text(
                                        moneyFormat.format(
                                            billPayment[index].amountreceive),
                                        style: TextStyle(
                                            color: textColor2,
                                            fontWeight: FontWeight.bold)),
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
            flex: 2,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Text(
                          'Đã thanh toán',
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
    );
  }
}
