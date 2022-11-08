import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/checkdetail.dart';
import 'package:pos_res_android/screens/Order/widget/buttons/custom_quantity_button.dart';

enum Mode { orderdetail, changeorder }

class ActionItemList extends StatelessWidget {
  const ActionItemList(
      {Key? key,
      required this.name,
      required this.sepcialRequest,
      required this.price,
      required this.isDone,
      required this.checkDetail,
      this.currentMode = Mode.orderdetail});
  final String name;
  final String sepcialRequest;
  final String price;
  final bool isDone;
  final Mode currentMode;
  final CheckDetail checkDetail;

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
                margin: const EdgeInsets.all(5),
                child: CustomQuantityButton(
                  checkDetail: checkDetail,
                )),
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
                          name,
                          style: TextStyle(color: textColor2),
                        ),
                        const Spacer(),
                        Text(sepcialRequest,
                            style: TextStyle(
                                color: textColor2,
                                fontStyle: FontStyle.italic)),
                      ]),
                  const Spacer(),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(price,
                              style: TextStyle(
                                  color: textColor2,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
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
                              : const SizedBox()
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            flex: 8,
          ),
          currentMode == Mode.changeorder
              ? Expanded(
                  flex: 1,
                  child: Checkbox(
                    value: false,
                    onChanged: (newValue) {},
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
