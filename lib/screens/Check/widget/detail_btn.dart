import 'package:flutter/material.dart';
import 'package:pos_res_android/screens/Payment/payment_screen.dart';

import '../../../config/routes.dart';
import '../../../config/theme.dart';

class MoreDetailBtn extends StatelessWidget {
  const MoreDetailBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "check_detail_btn",
      child: SizedBox(
        height: defaultPadding * 2.5,
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
            "Xem hóa đơn".toUpperCase(),
          ),
        ),
      ),
    );
  }
}
