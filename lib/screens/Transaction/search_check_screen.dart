import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/background.dart';
import 'package:pos_res_android/common/widgets/responsive.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Transaction/widget/check_table.dart';

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
