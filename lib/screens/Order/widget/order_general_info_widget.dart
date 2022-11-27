import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Order/order.dart';

class OrderGeneralInfo extends StatefulWidget {
  const OrderGeneralInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderGeneralInfo> createState() => _OrderGeneralInfoState();
}

class _OrderGeneralInfoState extends State<OrderGeneralInfo> {
  final newFormat = DateFormat('HH:mm');
  @override
  Widget build(BuildContext context) {
    final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
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
            'order.open_time'.tr() +
                ' ' +
                (orderBloc.state.check.creationtime.isNotEmpty
                    ? newFormat.format(
                        DateTime.parse(orderBloc.state.check.creationtime))
                    : ''),
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
