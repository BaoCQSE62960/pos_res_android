import 'package:flutter/material.dart';
import 'package:pos_res_android/screens/Table/widget/transaction_btn.dart';
import 'package:pos_res_android/screens/Table/widget/transfer_check_btn.dart';
import 'package:pos_res_android/screens/Table/widget/transfer_table_btn.dart';

import '../../../config/routes.dart';
import '../../../config/theme.dart';
import 'payment_btn.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({Key? key}) : super(key: key);

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: textLightColor,
          child: SizedBox(
            child: Column(
              children: [
                Container(
                  height: defaultPadding * 0.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Container(
                    //   width: defaultPadding,
                    // ),
                    const SizedBox(
                      width: 210,
                      child: TransferTableBtn(),
                    ),
                    Container(
                      width: defaultPadding,
                    ),
                    const SizedBox(
                      width: 210,
                      child: TransferCheckBtn(),
                    ),
                    Container(
                      width: defaultPadding,
                    ),
                    const SizedBox(
                      width: 210,
                      child: PaymentBtn(),
                    ),
                    Container(
                      width: defaultPadding,
                    ),
                    const SizedBox(
                      width: 210,
                      child: TransactionBtn(),
                    ),
                  ],
                ),
                Container(
                  height: defaultPadding * 0.5,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
