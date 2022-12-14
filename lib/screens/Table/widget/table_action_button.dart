import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Table/widget/buttons/transfer_check_btn.dart';
import 'package:pos_res_android/screens/Table/widget/buttons/transfer_table_btn.dart';

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
                Padding(
                  padding: const EdgeInsets.all(defaultPadding * 0.25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(defaultPadding * 0.25),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 4.5,
                          child: const TransferTableBtn(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(defaultPadding * 0.25),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 4.5,
                          child: const TransferCheckBtn(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
