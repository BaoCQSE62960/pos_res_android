import 'package:flutter/cupertino.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:easy_localization/easy_localization.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Banner(
        location: BannerLocation.topEnd,
        message: 'order.out_of_stock'.tr(),
        child: Wrap(
          children: [
            SizedBox(
              height: 120,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                child: Image.network(
                  "https://burgerking.vn/media/catalog/product/cache/1/small_image/316x/9df78eab33525d08d6e5fb8d27136e95/b/u/burger_2_mie_ng_bo_khoai_ta_y_la_t.jpeg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Burger bò 3 tầng",
                style: TextStyle(color: textColor2, fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "10.500",
                style: TextStyle(
                    color: textColor2,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
