import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/background.dart';
import 'package:pos_res_android/common/widgets/responsive.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/check.dart';
import 'package:pos_res_android/screens/Check/widget/check_info.dart';
import 'package:pos_res_android/screens/Check/widget/check_info_top.dart';
import 'package:pos_res_android/screens/Check/widget/item_detail.dart';

class CheckDetailScreen extends StatefulWidget {
  final List<CheckItem> listCheck;
  final List<CheckDetailModel> listDetail;
  const CheckDetailScreen({
    Key? key,
    required this.listCheck,
    required this.listDetail,
  }) : super(key: key);

  @override
  State<CheckDetailScreen> createState() => _CheckDetailScreenState();
}

class _CheckDetailScreenState extends State<CheckDetailScreen> {
  List<CheckItem> checkItem = [];
  List<CheckDetailModel> checkDetail = [];

  @override
  void initState() {
    super.initState();
    checkItem = widget.listCheck;
    checkDetail = widget.listDetail;
  }

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
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: defaultPadding * 0.5),
                            child: CheckGeneralInfo(list: checkItem),
                          ),
                        ),
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
                          child: Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: CheckInfo(list: checkItem),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height -
                              defaultPadding * 4,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: CheckItemDetail(list: checkDetail),
                        ),
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
