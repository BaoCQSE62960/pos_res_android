import 'package:flutter/material.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Payment/payment_screen.dart';

class ChargeBtn extends StatelessWidget {
  const ChargeBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: selectColor,
        elevation: 0,
        shape: const StadiumBorder(),
        maximumSize: const Size(double.infinity, 40),
        minimumSize: const Size(double.infinity, 40),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const PaymentScreen();
            },
          ),
        );
      },
      child: Text(
        "Thanh toán".toUpperCase(),
        style: const TextStyle(
          fontSize: defaultSize * 4,
          color: textColor,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
