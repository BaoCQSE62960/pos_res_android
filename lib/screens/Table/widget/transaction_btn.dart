import 'package:flutter/material.dart';
import 'package:pos_res_android/screens/Transaction/transaction_screen.dart';

import '../../../config/theme.dart';

class TransactionBtn extends StatelessWidget {
  const TransactionBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "transaction_btn",
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: activeColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const TransactionScreen();
                  },
                ),
              );
            },
            child: Text(
              "Tìm hóa đơn".toUpperCase(),
            ),
          ),
        ),
      ],
    );
  }
}
