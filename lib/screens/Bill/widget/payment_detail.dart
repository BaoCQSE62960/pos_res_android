import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';

class BillPaymentItemDetail extends StatelessWidget {
  const BillPaymentItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: defaultPadding * 20,
        height: defaultPadding * 36.5,
        decoration: const BoxDecoration(
          color: textLightColor,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 15,
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
                      height: defaultPadding * 2,
                      child: Row(
                        children: [
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
                                          "Tiền mặt",
                                          style: TextStyle(color: textColor2),
                                        ),
                                      ]),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text("50.000",
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
              flex: 2,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Text(
                            'Đã thanh toán',
                            style: TextStyle(
                                color: textColor2,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const Spacer(),
                          Text(
                            "50.000",
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
