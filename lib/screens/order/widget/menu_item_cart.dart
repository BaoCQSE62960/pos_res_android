import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:easy_localization/easy_localization.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard(
      {Key? key,
      required this.imageURL,
      required this.name,
      required this.price,
      required this.isOutOfStock})
      : super(key: key);

  final String imageURL;
  final String name;
  final String price;
  final bool isOutOfStock;

  @override
  Widget build(BuildContext context) {
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
          height: 100,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Text(
            name,
            style: TextStyle(color: textColor2, fontSize: 12),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            price,
            style: TextStyle(
                color: textColor2, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        )
      ],
    );
  }
}
