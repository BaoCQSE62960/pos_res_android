import 'package:flutter/material.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/config/theme.dart';

class RefundBtn extends StatelessWidget {
  const RefundBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "refund_btn",
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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return const PaymentScreen();
            //     },
            //   ),
            // );
          },
          child: Text(
            "Hoàn trả".toUpperCase(),
          ),
        ),
      ),
    );
  }
}
