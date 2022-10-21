import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pos_res_android/screens/Payment/widget/payment_input.dart';
import 'package:pos_res_android/screens/Payment/widget/payment_method.dart';
import 'package:pos_res_android/screens/Payment/widget/payment_action_button.dart';
import 'package:pos_res_android/screens/order/widget/order_general_info_widget.dart';

import '../../common/widgets/background.dart';
import '../../common/widgets/responsive.dart';
import '../../common/widgets/side_bar.dart';
import '../../config/routes.dart';
import '../../config/theme.dart';
import 'widget/payment_top.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

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
                Expanded(
                  flex: 8,
                  child: Container(
                    width: defaultPadding * 20,
                    height: defaultPadding * 43.5,
                    decoration: const BoxDecoration(
                      color: textLightColor,
                    ),
                    child: Column(
                      children: [
                        const Expanded(flex: 1, child: OrderGeneralInfo()),
                        const Divider(color: dividerColor),
                        Expanded(
                          flex: 10,
                          child: Scrollbar(
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 30.0),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Tiền mặt",
                                                      style: TextStyle(
                                                          color: textColor2),
                                                    ),
                                                  ]),
                                              const Spacer(),
                                              Row(
                                                children: [
                                                  Text(
                                                    "50.000",
                                                    style: TextStyle(
                                                        color: textColor2,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                          flex: 2,
                          child: Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Đã thanh toán",
                                        style: TextStyle(color: textColor2),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "50.000",
                                        style: TextStyle(
                                            color: textColor2,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Tổng thanh toán",
                                        style: TextStyle(
                                            color: textColor2,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "69.300",
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
                        const Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: defaultPadding * 0.75,
                            ),
                            child: PaymentActionButton(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: defaultPadding * 43.5,
                  color: dividerColor,
                ),
                Expanded(
                  flex: 16,
                  child: Container(
                    width: defaultPadding * 38,
                    height: defaultPadding * 43.5,
                    color: textLightColor,
                    child: Column(
                      children: [
                        Container(
                          height: defaultPadding * 4,
                          color: textLightColor,
                          child: const TotalVND(),
                        ),
                        Container(
                          height: defaultPadding * 33,
                          color: deactiveLightColor,
                          child: const PaymentMethod(),
                        ),
                        Container(
                          height: defaultPadding * 4,
                          width: defaultPadding * 43,
                          child: const PaymentInput(),
                          color: textLightColor,
                        ),
                        Container(
                          height: defaultPadding * 2.5,
                          color: textLightColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
