import 'package:flutter/material.dart';
import 'package:pos_res_android/screens/Payment/payment_screen.dart';

import '../../../config/theme.dart';

class PaymentBtn extends StatelessWidget {
  const PaymentBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "payment_btn",
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: activeColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const PaymentScreen();
                  },
                ),
              );
            },
            child: Text(
              "Thanh toán".toUpperCase(),
            ),
          ),
        ),
      ],
    );
  }
}
