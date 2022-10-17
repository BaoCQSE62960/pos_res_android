import 'package:flutter/material.dart';
import 'package:pos_res_android/screens/Payment/payment_screen.dart';

import '../../../config/theme.dart';

class PaymentBtn extends StatelessWidget {
  const PaymentBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "payment_btn",
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: activeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
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
    );
  }
}
