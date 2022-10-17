import 'package:flutter/material.dart';

import '../../../config/theme.dart';

class TransferTableBtn extends StatelessWidget {
  const TransferTableBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "transfer_table_btn",
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: activeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {},
        child: Text(
          "Chuyển bàn".toUpperCase(),
        ),
      ),
    );
  }
}
