import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/bill.dart';

class BillGeneralInfo extends StatefulWidget {
  final List<BillItem> list;
  const BillGeneralInfo({Key? key, required this.list}) : super(key: key);

  @override
  State<BillGeneralInfo> createState() => _BillGeneralInfoState();
}

class _BillGeneralInfoState extends State<BillGeneralInfo> {
  List<BillItem> list = [];
  late DateTime creationTime;
  final newFormat = DateFormat('HH:mm');

  @override
  void initState() {
    super.initState();
    list = widget.list;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'order.order_id'.tr() + ' #' '${list[0].billno}',
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: activeColor),
          ),
          const Spacer(),
          Text(
            'order.open_time'.tr() +
                ' ${newFormat.format(list[0].creationtime)}',
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
