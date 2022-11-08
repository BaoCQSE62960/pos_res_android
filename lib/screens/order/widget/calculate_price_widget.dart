import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Order/order.dart';
import 'package:pos_res_android/screens/Order/widget/buttons/custom_tool_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pos_res_android/screens/order/widget/buttons/payment_btn.dart';

final currencyFormat = new NumberFormat("#,##0", "en_US");

Container calculatePriceWidget(BuildContext context) {
  final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'order.subtotal'.tr(),
            style: TextStyle(color: textColor2),
          ),
          const Spacer(),
          Text(
            currencyFormat.format(orderBloc.state.check.subtotal),
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
                currencyFormat.format(orderBloc.state.check.totaltax),
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
                currencyFormat.format(orderBloc.state.check.totalamount),
                style: TextStyle(
                    color: textColor2,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: defaultPadding),
          child: ChargeBtn(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
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
              color: warningColorBackground,
            ),
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
