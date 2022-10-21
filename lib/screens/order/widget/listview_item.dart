import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Order/widget/buttons/custom_quantity_button.dart';

class ActionItemList extends StatelessWidget {
  const ActionItemList(
      {Key? key,
      required this.name,
      required this.sepcialRequest,
      required this.price,
      required this.isDone})
      : super(key: key);
  final String name;
  final String sepcialRequest;
  final String price;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: isDone ? Colors.grey[100] : Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
                margin: const EdgeInsets.all(5), child: CustomQuantityButton()),
            flex: 1,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cánh gà chiên",
                          style: TextStyle(color: textColor2),
                        ),
                        const Spacer(),
                        Text("Nhiều sốt",
                            style: TextStyle(
                                color: textColor2,
                                fontStyle: FontStyle.italic)),
                      ]),
                  const Spacer(),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("10.500",
                              style: TextStyle(
                                  color: textColor2,
                                  fontWeight: FontWeight.bold)),
                          Spacer(),
                          !isDone
                              ? TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    backgroundColor: warningColor,
                                  ),
                                  child: const Icon(
                                    Icons.dining,
                                    color: textLightColor,
                                  ),
                                )
                              : SizedBox()
                        ],
                      ),
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
}
