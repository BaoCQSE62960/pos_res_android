import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/order/widget/listview_item.dart';
import 'package:easy_localization/easy_localization.dart';

class OrderDetailInfo extends StatelessWidget {
  const OrderDetailInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Divider(
              color: dividerColor,
            ),
          );
        },
        itemCount: 6,
        itemBuilder: (context, index) {
          return Slidable(
            child: itemList(),
            endActionPane: ActionPane(motion: const ScrollMotion(), children: [
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: voidColor,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'order.void'.tr(),
              ),
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: warningColor,
                foregroundColor: Colors.white,
                icon: Icons.share,
                label: 'order.special_request'.tr(),
              ),
            ]),
          );
        },
      ),
    );
  }
}
