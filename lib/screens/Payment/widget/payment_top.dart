import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';

class TotalVND extends StatelessWidget {
  const TotalVND({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "69.300",
          style: TextStyle(
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
