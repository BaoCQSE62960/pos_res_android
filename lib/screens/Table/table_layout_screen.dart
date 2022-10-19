import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';
import 'package:pos_res_android/screens/Table/widget/table_action_button.dart';
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
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 13,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                child: Padding(
                                  padding: EdgeInsets.all(defaultPadding / 4.5),
                                  child: StatusFilter(),
                                ),
                              ),
                              SizedBox(
                                child: Container(
                                    color: textLightColor,
                                    width: MediaQuery.of(context).size.width *
                                            0.5 -
                                        defaultPadding * 3.3,
                                    child: const LocationFilter()),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: textLightColor,
                        // height: defaultPadding * 34.38,
                        // width: defaultPadding * 58,
                        height: MediaQuery.of(context).size.height -
                            defaultPadding * 8.5,
                        width: MediaQuery.of(context).size.width,
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
