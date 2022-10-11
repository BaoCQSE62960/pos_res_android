// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';
import 'package:pos_res_android/screens/Table/widget/transaction_btn.dart';

import '../../common/widgets/background.dart';
import '../../common/widgets/responsive.dart';
import 'widget/payment_btn.dart';

class TableLayoutScreen extends StatelessWidget {
  const TableLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      // return Scaffold(
      // backgroundColor: textLightColor,
      // body: Container(
      //   color: activeColor,
      //   child: const SideBar(),
      // ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            tablet: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  // height: 150,
                  // height: double.infinity,
                  // color: activeColor,
                  child: SideBar(),
                ),
                Expanded(
                  child: Row(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
