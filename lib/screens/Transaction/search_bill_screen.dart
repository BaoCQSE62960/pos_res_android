import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/background.dart';
import 'package:pos_res_android/common/widgets/responsive.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Transaction/widget/bill_table.dart';

class SearchBillScreen extends StatefulWidget {
  const SearchBillScreen({Key? key}) : super(key: key);

  @override
  State<SearchBillScreen> createState() => _SearchBillScreenState();
}

class _SearchBillScreenState extends State<SearchBillScreen> {
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
                      child: const BillDatatable(),
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
