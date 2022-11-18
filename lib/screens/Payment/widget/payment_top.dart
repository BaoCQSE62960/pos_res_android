import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';

class TotalVND extends StatelessWidget {
  final String amount;
  const TotalVND({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          amount.toVND(unit: "VND"),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     const Text(
        //       "VND",
        //       style: TextStyle(
        //         fontSize: 10,
        //         color: textColor,
        //       ),
        //     ),
        //     Container(
        //       height: defaultPadding * 1.4,
        //       color: deactiveLightColor,
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
