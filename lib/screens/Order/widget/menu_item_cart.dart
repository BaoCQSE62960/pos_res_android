import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pos_res_android/repos/models/waiter/item.dart';
import 'package:pos_res_android/screens/Order/order.dart';

final currencyFormat = NumberFormat("#,##0", "en_US");

class MenuItemCard extends StatelessWidget {
  const MenuItemCard(
      {Key? key,
      required this.imageURL,
      required this.name,
      required this.price,
      required this.isOutOfStock,
      required this.item})
      : super(key: key);

  final String imageURL;
  final String name;
  final String price;
  final bool isOutOfStock;
  final Item item;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
    return ClipRRect(
      child: isOutOfStock
          ? Banner(
              location: BannerLocation.topEnd,
              message: 'order.out_of_stock'.tr(),
              child: MenuItemDetail(),
            )
          : MenuItemDetail(),
    );
  }

  // ignore: non_constant_identifier_names
  Wrap MenuItemDetail() {
    return Wrap(
      children: [
        SizedBox(
          height: 70,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
            child: Image.network(
              imageURL,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Text(
                name,
                style: TextStyle(color: textColor2, fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                currencyFormat.format(int.parse(price)),
                style: TextStyle(
                    color: textColor2,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            )
          ],
        ),
      ],
    );
  }
}
