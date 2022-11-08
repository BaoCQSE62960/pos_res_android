import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "method_demo_btn",
      child: GestureDetector(
        child: Container(
          // margin: const EdgeInsets.all(defaultPadding * 0.25),
          decoration: BoxDecoration(
            color: deactiveColor,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: const [
              BoxShadow(
                color: shadowColor,
                blurRadius: 4,
                offset: Offset(0, 4), // Shadow position
              ),
            ],
          ),
          child: SizedBox(
            width: defaultPadding * 11,
            height: defaultPadding * 5,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: selectColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  // side: BorderSide(color: primaryColor),
                ),
                // maximumSize:
                //     const Size(defaultPadding * 8, defaultPadding * 8),
              ),
              onPressed: () {},
              child: Container(
                color: selectColor,
                height: defaultPadding * 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tiền mặt".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
