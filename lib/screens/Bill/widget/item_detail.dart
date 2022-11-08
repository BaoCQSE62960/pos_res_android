import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:easy_localization/easy_localization.dart';

class BillItemDetail extends StatelessWidget {
  const BillItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // flex: 4,
      child: Container(
        width: defaultPadding * 20,
        height: defaultPadding * 36.5,
        decoration: const BoxDecoration(
          color: textLightColor,
        ),
        child: Column(
          children: [
            // const Expanded(flex: 1, child: OrderGeneralInfo()),
            // const Divider(color: dividerColor),
            Expanded(
              flex: 16,
              child: Scrollbar(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Divider(
                        color: dividerColor,
                      ),
                    );
                  },
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: defaultPadding * 3,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "6",
                                        style: TextStyle(
                                          color: textColor2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Cánh gà chiên",
                                          style: TextStyle(color: textColor2),
                                        ),
                                        Text(
                                          "Size vừa",
                                          style: TextStyle(color: textColor2),
                                        ),
                                      ]),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text("63.000",
                                          style: TextStyle(
                                              color: textColor2,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            flex: 8,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const Divider(color: dividerColor),
            Expanded(
              flex: 4,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'order.subtotal'.tr(),
                            style: TextStyle(color: textColor2),
                          ),
                          const Spacer(),
                          Text(
                            "63.000",
                            style: TextStyle(
                                color: textColor2, fontWeight: FontWeight.bold),
                          ),
                        ]),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Text(
                            'order.tax'.tr(),
                            style: TextStyle(color: textColor2),
                          ),
                          const Spacer(),
                          Text(
                            "6.300",
                            style: TextStyle(
                                color: textColor2, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Text(
                            'order.total'.tr(),
                            style: TextStyle(
                                color: textColor2,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const Spacer(),
                          Text(
                            "69.300",
                            style: TextStyle(
                                color: textColor2,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
