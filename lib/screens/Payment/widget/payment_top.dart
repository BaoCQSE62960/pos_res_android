import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';

class TotalVND extends StatefulWidget {
  final String amount;
  const TotalVND({Key? key, required this.amount}) : super(key: key);

  @override
  State<TotalVND> createState() => _TotalVNDState();
}

class _TotalVNDState extends State<TotalVND> {
  final moneyFormat = NumberFormat.decimalPattern('vi_VN');

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          moneyFormat.format(num.parse(widget.amount)),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "VND",
              style: TextStyle(
                fontSize: 10,
                color: textColor,
              ),
            ),
            Container(
              height: defaultPadding * 1.4,
              color: deactiveLightColor,
            ),
          ],
        ),
      ],
    );
  }
}
