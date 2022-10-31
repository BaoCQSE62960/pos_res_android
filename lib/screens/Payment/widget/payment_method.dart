import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Payment/widget/payment_method_item.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  Widget getTextWidgets(int num) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < num; i++) {
      list.add(
        const SizedBox(
          child: PaymentMethodItem(),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            childAspectRatio: 2,
          ),
          children: list),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textLightColor,
      body: getTextWidgets(1),
    );
  }
}
