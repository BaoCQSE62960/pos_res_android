import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/order/widget/buttons/custom_tool_button.dart';
import 'package:easy_localization/easy_localization.dart';

Container calculatePriceWidget() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 30.0),
    child: Column(
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'order.subtotal'.tr(),
            style: TextStyle(color: textColor2),
          ),
          const Spacer(),
          Text(
            "11.500",
            style: TextStyle(color: textColor2, fontWeight: FontWeight.bold),
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
                "500",
                style:
                    TextStyle(color: textColor2, fontWeight: FontWeight.bold),
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
                "12.000",
                style: TextStyle(
                    color: textColor2,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomToolButton(
              icons: const Icon(
                Icons.delete,
                color: voidColor,
              ),
              text: 'order.void'.tr(),
              textColors: voidColor,
              color: voidColorBackground,
            ),
            CustomToolButton(
                icons: const Icon(
                  Icons.notifications,
                  color: warningColor,
                ),
                text: 'order.remind'.tr(),
                textColors: warningColor,
                color: warningColorBackground),
            CustomToolButton(
              icons: const Icon(
                Icons.send,
                color: activeColor,
              ),
              text: 'order.send'.tr(),
              textColors: activeColor,
              color: activeColorBackground,
            )
          ]),
        )
      ],
    ),
  );
}
