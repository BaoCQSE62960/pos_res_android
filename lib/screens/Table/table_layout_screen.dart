import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';
import 'package:pos_res_android/screens/Table/widget/action_button.dart';
import 'package:pos_res_android/screens/Table/widget/status_filter.dart';
import 'package:pos_res_android/screens/Table/widget/table_layout.dart';

import '../../common/widgets/background.dart';
import '../../common/widgets/responsive.dart';
import '../../config/routes.dart';
import '../../config/theme.dart';
import 'widget/location_filter.dart';

class TableLayoutScreen extends StatefulWidget {
  const TableLayoutScreen({Key? key}) : super(key: key);

  @override
  State<TableLayoutScreen> createState() => _TableLayoutScreenState();
}

class _TableLayoutScreenState extends State<TableLayoutScreen> {
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
                      Container(
                        color: textLightColor,
                        height: defaultPadding * 34.38,
                        width: defaultPadding * 58,
                        child: const TableLayout(),
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
