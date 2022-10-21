import 'package:flutter/material.dart';
import 'package:pos_res_android/screens/Payment/widget/payment_input.dart';
import 'package:pos_res_android/screens/Payment/widget/payment_method.dart';
import 'package:pos_res_android/screens/order/widget/calculate_price_widget.dart';
import 'package:pos_res_android/screens/order/widget/order_customer_info_widget.dart';
import 'package:pos_res_android/screens/order/widget/order_detail_info_widget.dart';
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
                  flex: 4,
                  child: Container(
                    width: defaultPadding * 20,
                    height: defaultPadding * 43.5,
                    // color: deactiveLightColor,
                    decoration: const BoxDecoration(
                      color: textLightColor,
                      // borderRadius: BorderRadius.circular(15.0),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: shadowColor,
                      //     blurRadius: 4,
                      //     offset: Offset(4, 4), // Shadow position
                      //   ),
                      // ],
                    ),
                    child: Column(
                      children: [
                        const Expanded(flex: 1, child: OrderGeneralInfo()),
                        const Divider(color: dividerColor),
                        Expanded(
                            flex: 1,
                            child: OrderCustomerInfo(
                              context: context,
                            )),
                        const Divider(color: dividerColor),
                        const Expanded(flex: 7, child: OrderDetailInfo()),
                        const Divider(color: dividerColor),
                        Expanded(flex: 3, child: calculatePriceWidget()),
                      ],
                    ),
                  ),
                ),
                Container(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
