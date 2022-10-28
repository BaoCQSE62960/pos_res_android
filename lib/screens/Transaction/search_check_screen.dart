import 'package:flutter/material.dart';
import 'package:pos_res_android/screens/Transaction/widget/check_table.dart';

import '../../common/widgets/background.dart';
import '../../common/widgets/responsive.dart';
import '../../common/widgets/side_bar.dart';
import '../../config/routes.dart';
import '../../config/theme.dart';

class SearchCheckScreen extends StatefulWidget {
  const SearchCheckScreen({Key? key}) : super(key: key);

  @override
  State<SearchCheckScreen> createState() => _SearchCheckScreenState();
}

class _SearchCheckScreenState extends State<SearchCheckScreen> {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container(
                    //   color: deactiveLightColor,
                    //   height: MediaQuery.of(context).size.height -
                    //       defaultPadding * 8,
                    //   width: MediaQuery.of(context).size.width -
                    //       MediaQuery.of(context).size.width / 14,
                    // ),
                    Container(
                      color: textLightColor,
                      height: MediaQuery.of(context).size.height -
                          defaultPadding * 1.5,
                      width: MediaQuery.of(context).size.width -
                          defaultPadding * 4.5,
                      child: const CheckDatatable(),
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
