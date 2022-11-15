// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_res_android/common/widgets/web_view.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/services/momo_service.dart';

class PaymentInput extends StatefulWidget {
  dynamic service;
  PaymentInput({Key? key, required this.service}) : super(key: key);

  @override
  State<PaymentInput> createState() => _PaymentInputState();
}

class _PaymentInputState extends State<PaymentInput> {
  String amount = '';
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
          child: Flexible(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  amount = value;
                });
              },
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              cursorColor: primaryColor,
              decoration: const InputDecoration(
                filled: true,
                fillColor: selectedColor,
                prefixIconColor: primaryColor,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide.none,
                ),
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
                elevation: 0,
                shape: const StadiumBorder(),
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
              onPressed: () async {
                if (widget.service.runtimeType == MomoService) {
                  MomoService service = widget.service;
                  String url = await service.getPayment(amount);
                  var result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayWebView(url: url),
                      ));
                  print(result);
                }
              },
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
