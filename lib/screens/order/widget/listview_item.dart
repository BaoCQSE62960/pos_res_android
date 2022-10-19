import 'package:flutter/cupertino.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/order/widget/buttons/custom_quantity_button.dart';

Container itemList() {
  return Container(
    margin: const EdgeInsets.all(10),
    width: double.infinity,
    height: 100,
    child: Row(
      children: [
        Expanded(
          child: CustomQuantityButton(),
          flex: 1,
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "Cánh gà chiên",
                    style: TextStyle(color: textColor2),
                  ),
                  Text("Size vừa", style: TextStyle(color: textColor2)),
                  const Spacer(),
                  Text("Nhiều sốt",
                      style: TextStyle(
                          color: textColor2, fontStyle: FontStyle.italic)),
                ]),
                const Spacer(),
                Row(
                  children: [
                    Text("10.500",
                        style: TextStyle(
                            color: textColor2, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          flex: 8,
        )
      ],
    ),
  );
}
