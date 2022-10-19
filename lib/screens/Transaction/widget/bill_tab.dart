import 'package:flutter/material.dart';
import 'package:pos_res_android/screens/Transaction/bill_screen.dart';
import 'package:pos_res_android/screens/Transaction/transaction_screen.dart';

import '../../../config/routes.dart';
import '../../../config/theme.dart';

class BillTab extends StatelessWidget {
  const BillTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: textLightColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: defaultPadding * 2.5,
            width: defaultPadding * 9.25,
            child: Hero(
              tag: "check_tab",
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding * 0.25),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const TransactionScreen();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "Tìm theo hóa đơn",
                    style: TextStyle(
                      fontSize: defaultSize * 2.75,
                      color: textColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Container(
          //   width: defaultPadding * 0.5,
          // ),
          SizedBox(
            height: defaultPadding * 2.5,
            width: defaultPadding * 9.25,
            child: Hero(
              tag: "bill_tab",
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding * 0.25),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const BillScreen();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "Tìm theo thanh toán",
                    style: TextStyle(
                      fontSize: defaultSize * 2.75,
                      color: textColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
