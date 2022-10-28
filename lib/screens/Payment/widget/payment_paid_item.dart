import 'package:flutter/material.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Payment/widget/payment_action_button.dart';

class PaymentPaidItem extends StatelessWidget {
  const PaymentPaidItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              itemCount: 1,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tiền mặt",
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
                                    "50.000",
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
                        "50.000",
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
        const Expanded(
          // flex: 1,
          flex: 4,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: defaultPadding * 0.75,
            ),
            child: PaymentActionButton(),
          ),
        ),
      ],
    );
  }
}
