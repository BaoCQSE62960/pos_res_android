// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/routes.dart';
import '../../../config/theme.dart';

class PaymentInput extends StatelessWidget {
  const PaymentInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: defaultPadding * 24,
          decoration: const BoxDecoration(
            color: selectedColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
          ),
          child: const Flexible(
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              cursorColor: primaryColor,
              decoration: InputDecoration(
                fillColor: selectedColor,
                hintText: "Nhập số tiền",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.attach_money),
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: Container(
            width: defaultPadding * 8,
            decoration: const BoxDecoration(
              color: activeColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: activeColor,
              ),
              onPressed: () => SystemNavigator.pop(),
              // onPressed: () => exit(0),
              child: Text(
                "Xác nhận".toUpperCase(),
              ),
            ),
          ),
        ),
        // const SizedBox(height: defaultPadding),
        // Hero(
        //   tag: "close_btn",
        //   child: ElevatedButton(
        //     style: ElevatedButton.styleFrom(
        //       primary: voidColor,
        //     ),
        //     onPressed: () => SystemNavigator.pop(),
        //     // onPressed: () => exit(0),
        //     child: Text(
        //       "Thoát".toUpperCase(),
        //     ),
        //   ),
        // ),
        // const SizedBox(height: defaultPadding),
      ],
    );
  }
}
