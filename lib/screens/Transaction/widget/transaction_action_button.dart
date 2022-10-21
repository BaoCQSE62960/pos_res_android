import 'package:flutter/material.dart';
import 'package:pos_res_android/screens/Table/widget/buttons/payment_btn.dart';
import 'package:pos_res_android/screens/Transaction/widget/buttons/refund_btn.dart';

import '../../../config/routes.dart';
import '../../../config/theme.dart';

class TransactionActionButton extends StatelessWidget {
  const TransactionActionButton({Key? key}) : super(key: key);

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(defaultPadding * 0.25),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 4.5,
                          child: const PaymentBtn(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(defaultPadding * 0.25),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 4.5,
                          child: const RefundBtn(),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(defaultPadding * 0.25),
                      //   child: SizedBox(
                      //     width: MediaQuery.of(context).size.width / 4.5,
                      //     child: const CheckDetailBtn(),
                      //   ),
                      // ),
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
