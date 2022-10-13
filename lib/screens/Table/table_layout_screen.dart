import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';
import 'package:pos_res_android/screens/Table/widget/action_button.dart';
import 'package:pos_res_android/screens/Table/widget/status_filter.dart';
import 'package:pos_res_android/screens/Table/widget/table_item.dart';
import 'package:pos_res_android/screens/Table/widget/table_layout.dart';

import '../../common/widgets/background.dart';
import '../../common/widgets/responsive.dart';
import '../../config/theme.dart';
import 'widget/location_filter.dart';

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
                      Container(
                        color: textLightColor,
                        child: Row(
                          children: const [
                            SizedBox(
                              child: StatusFilter(),
                            ),
                            SizedBox(
                              child: LocationFilter(),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   color: textLightColor,
                      //   height: defaultPadding * 35,
                      // ),
                      Container(
                        color: textLightColor,
                        height: defaultPadding * 35,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: defaultPadding,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: defaultPadding * 0.5,
                                ),
                                const SizedBox(
                                  width: defaultPadding * 8,
                                  height: defaultPadding * 6,
                                  child: TableItem(),
                                ),
                                Container(
                                  width: defaultPadding * 0.5,
                                ),
                                // const SizedBox(
                                //   width: defaultPadding * 11,
                                //   height: defaultPadding * 8.5,
                                //   child: TableItem(),
                                // ),
                                Container(
                                  width: defaultPadding * 0.5,
                                ),
                                // const SizedBox(
                                //   width: defaultPadding * 11,
                                //   height: defaultPadding * 8.5,
                                //   child: TableItem(),
                                // ),
                                Container(
                                  width: defaultPadding * 0.5,
                                ),
                                // const SizedBox(
                                //   width: defaultPadding * 11,
                                //   height: defaultPadding * 8.5,
                                //   child: TableItem(),
                                // ),
                                Container(
                                  width: defaultPadding * 0.5,
                                ),
                                // const SizedBox(
                                //   width: defaultPadding * 11,
                                //   height: defaultPadding * 8.5,
                                //   child: TableItem(),
                                // ),
                              ],
                            ),
                            Container(
                              height: defaultPadding * 0.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: defaultPadding * 0.5,
                                ),
                                // const SizedBox(
                                //   width: defaultPadding * 11,
                                //   height: defaultPadding * 8.5,
                                //   child: TableItem(),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        child: ActionButton(),
                      ),
                    ],
                  ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
