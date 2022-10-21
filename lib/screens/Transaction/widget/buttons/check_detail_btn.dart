import 'package:flutter/material.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Check/check_screen.dart';

class CheckDetailBtn extends StatelessWidget {
  const CheckDetailBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "check_detail_btn",
      child: SizedBox(
        height: defaultPadding * 2.5,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: activeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const CheckScreen();
                },
              ),
            );
          },
          child: Text(
            "Xem hóa đơn".toUpperCase(),
          ),
        ),
      ),
    );
  }
}
