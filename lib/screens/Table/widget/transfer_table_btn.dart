import 'package:flutter/material.dart';
import 'package:pos_res_android/screens/order/order.dart';

import '../../../config/routes.dart';
import '../../../config/theme.dart';

class TransferTableBtn extends StatelessWidget {
  const TransferTableBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "transfer_table_btn",
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
                  return const OrderScreen();
                },
              ),
            );
          },
          child: Text(
            "Chuyển bàn".toUpperCase(),
          ),
        ),
      ),
    );
  }
}
