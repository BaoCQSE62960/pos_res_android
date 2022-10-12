import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';
import 'package:pos_res_android/screens/Table/widget/transaction_btn.dart';

import '../../common/widgets/background.dart';
import '../../common/widgets/responsive.dart';
import '../../config/theme.dart';
import 'widget/location_filter.dart';
import 'widget/payment_btn.dart';

class TableLayoutScreen extends StatelessWidget {
  const TableLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            tablet: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  child: SideBar(),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        child: LocationFilter(),
                      ),
                      SizedBox(
                        height: defaultPadding * 31,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 450,
                              child: PaymentBtn(),
                            ),
                            SizedBox(
                              width: 450,
                              child: TransactionBtn(),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 450,
                            child: PaymentBtn(),
                          ),
                          SizedBox(
                            width: 450,
                            child: TransactionBtn(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: const [
                  //     SizedBox(
                  //       width: 450,
                  //       child: PaymentBtn(),
                  //     ),
                  //     SizedBox(
                  //       width: 450,
                  //       child: TransactionBtn(),
                  //     ),
                  //   ],
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
