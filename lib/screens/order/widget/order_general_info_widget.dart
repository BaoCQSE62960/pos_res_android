import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';

class OrderGeneralInfo extends StatelessWidget {
  const OrderGeneralInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'order.order_id'.tr() + ' #' '7',
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: activeColor),
          ),
          const Spacer(),
          Text(
            'order.open_time'.tr() + ' 07:48 PM',
            style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
