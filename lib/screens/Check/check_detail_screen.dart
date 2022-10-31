import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/background.dart';
import 'package:pos_res_android/common/widgets/responsive.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Check/widget/check_info.dart';
import 'package:pos_res_android/screens/Check/widget/item_detail.dart';
import 'package:pos_res_android/screens/order/widget/order_general_info_widget.dart';

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
                      children: [
                        Container(
                          color: textLightColor,
                          width: defaultPadding * 2.5,
                          height: defaultPadding * 2.5,
                          child: const Padding(
                            padding:
                                EdgeInsets.only(top: defaultPadding * 0.25),
                            child: BackButton(color: textColor),
                          ),
                        ),
                        Container(
                            color: textLightColor,
                            width: MediaQuery.of(context).size.width -
                                defaultPadding * 7,
                            height: defaultPadding * 2.5,
                            child: const Padding(
                              padding:
                                  EdgeInsets.only(top: defaultPadding * 0.5),
                              child: OrderGeneralInfo(),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          color: textLightColor,
                          height: MediaQuery.of(context).size.height -
                              defaultPadding * 4,
                          width: MediaQuery.of(context).size.width * 0.6 -
                              defaultPadding * 4.5,
                          child: const Padding(
                            padding: EdgeInsets.all(defaultPadding),
                            child: CheckInfo(),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height -
                                defaultPadding * 4,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: const CheckItemDetail()),
                      ],
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
