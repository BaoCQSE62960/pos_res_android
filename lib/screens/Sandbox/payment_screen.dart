import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_res_android/common/widgets/background.dart';
import 'package:pos_res_android/common/widgets/responsive.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/payment.dart';
import 'package:pos_res_android/repos/services/payment_service.dart';
import 'package:pos_res_android/screens/Payment/widget/payment_input.dart';
import 'package:pos_res_android/screens/Payment/widget/payment_method.dart';
import 'package:pos_res_android/screens/Payment/widget/payment_paid_item.dart';
import 'package:pos_res_android/screens/Payment/widget/payment_top.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<Payment> methods = [];
  final PaymentService service = Get.put(PaymentService());

  Future getMethodList() async {
    methods = await service.getPaymentMethodList();
    return methods;
  }

  @override
  void initState() {
    super.initState();
    getMethodList();
    print("methods: +$methods");
  }

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
                    child: const PaymentPaidItem(),
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
