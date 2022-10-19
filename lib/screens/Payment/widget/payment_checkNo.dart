// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../config/theme.dart';

class PaymentCheckNo extends StatelessWidget {
  const PaymentCheckNo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Hóa đơn 1",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: activeColor,
        ),
      ),
    );
  }
}
