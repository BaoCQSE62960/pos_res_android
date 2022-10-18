import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/background.dart';
import 'package:pos_res_android/common/widgets/responsive.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Table/widget/payment_btn.dart';

class CheckDetailScreen extends StatelessWidget {
  const CheckDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            tablet: Row(
              children: [
                const SizedBox(
                  child: SideBar(),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: textLightColor,
                          height: MediaQuery.of(context).size.height -
                              defaultPadding * 5,
                          width: MediaQuery.of(context).size.width / 2 -
                              MediaQuery.of(context).size.width / 28,
                        ),
                        Container(
                          color: textColor2,
                          height: MediaQuery.of(context).size.height -
                              defaultPadding * 5,
                          width: MediaQuery.of(context).size.width / 2 -
                              MediaQuery.of(context).size.width / 28,
                        ),
                      ],
                    ),
                    Container(
                      color: textLightColor,
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width / 14,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(defaultPadding * 0.5),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 4.5,
                              child: const PaymentBtn(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
