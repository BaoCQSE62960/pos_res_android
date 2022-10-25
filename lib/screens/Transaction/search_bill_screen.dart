import 'package:flutter/material.dart';
import 'package:pos_res_android/screens/Transaction/widget/bill_table.dart';
import 'package:pos_res_android/screens/Transaction/widget/buttons/bill_detail_btn.dart';
import 'package:pos_res_android/screens/Transaction/widget/transaction_action_button.dart';

import '../../common/widgets/background.dart';
import '../../common/widgets/responsive.dart';
import '../../common/widgets/side_bar.dart';
import '../../config/routes.dart';
import '../../config/theme.dart';

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
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  child: SideBar(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container(
                    //   color: textLightColor,
                    //   height: defaultPadding * 3,
                    //   child: const Padding(
                    //     padding: EdgeInsets.only(
                    //       left: defaultPadding * 0.25,
                    //       right: defaultPadding * 0.25,
                    //     ),
                    //     child: BillFilter(),
                    //   ),
                    // ),
                    Container(
                      color: textLightColor,
                      height: MediaQuery.of(context).size.height -
                          defaultPadding * 5,
                      width: MediaQuery.of(context).size.width -
                          defaultPadding * 4.5,
                      child: const BillDatatable(),
                    ),
                    Container(
                      color: textLightColor,
                      width: MediaQuery.of(context).size.width -
                          defaultPadding * 4.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const TransactionActionButton(),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: defaultPadding * 0.25,
                              top: defaultPadding * 0.25,
                              bottom: defaultPadding * 0.25,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 4.5,
                              child: const BillDetailBtn(),
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
