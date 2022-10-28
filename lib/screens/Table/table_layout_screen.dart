import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';
import 'package:pos_res_android/screens/Table/widget/table_action_button.dart';
import 'package:pos_res_android/screens/Table/widget/table_layout_filter.dart';
import 'package:pos_res_android/screens/Table/widget/table_layout_table.dart';

import '../../common/widgets/background.dart';
import '../../common/widgets/responsive.dart';

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
                    children: const [
                      FilterSection(),
                      TableSection(),
                      SizedBox(
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
