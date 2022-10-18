import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';
import 'package:pos_res_android/screens/Table/widget/table_action_button.dart';
import 'package:pos_res_android/screens/Table/widget/status_filter.dart';
import 'package:pos_res_android/screens/Table/widget/table_layout.dart';

import '../../common/widgets/background.dart';
import '../../common/widgets/responsive.dart';
import '../../config/routes.dart';
import '../../config/theme.dart';
import '../Table/widget/location_filter.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            tablet: Row(
              // mainAxisAlignment: MainAxisAlignment.end,
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
                          children: [
                            const SizedBox(
                              child: StatusFilter(),
                            ),
                            Container(
                                color: textLightColor,
                                height: defaultPadding * 3.1,
                                width: defaultPadding * 25,
                                child: const LocationFilter()),
                          ],
                        ),
                      ),
                      Container(
                        color: textLightColor,
                        height: defaultPadding * 0.5,
                      ),
                      Row(
                        children: [
                          Container(
                            color: textLightColor,
                            width: defaultPadding * 0.5,
                            height: defaultPadding * 34.38,
                          ),
                          Container(
                            color: textLightColor,
                            height: defaultPadding * 34.38,
                            width: defaultPadding * 57,
                            child: const TableLayout(),
                          ),
                          Container(
                            color: textLightColor,
                            width: defaultPadding * 0.5,
                            height: defaultPadding * 34.38,
                          ),
                        ],
                      ),
                      const SizedBox(
                        child: ActionButton(),
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
