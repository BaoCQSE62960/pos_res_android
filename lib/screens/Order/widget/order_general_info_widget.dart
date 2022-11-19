import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Order/order.dart';

final inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
final targetFormat = DateFormat('HH:mm:ss');

class OrderGeneralInfo extends StatelessWidget {
  const OrderGeneralInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
    var inputDate = inputFormat.parse(orderBloc.state.check.creationtime);
    var outputDate = targetFormat.format(inputDate).toString();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'order.order_id'.tr() + ' #' + orderBloc.state.check.checkno,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: activeColor),
          ),
          const Spacer(),
          Text(
            'order.open_time'.tr() + ' ' + outputDate,
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
