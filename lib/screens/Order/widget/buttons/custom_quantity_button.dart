import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/waiter/checkdetail.dart';
import 'package:pos_res_android/screens/Order/order.dart';

enum QuantityUpdateMode { increase, decrease }

class CustomQuantityButton extends StatelessWidget {
  const CustomQuantityButton({Key? key, required this.checkDetail})
      : super(key: key);

  final CheckDetail checkDetail;

  @override
  Widget build(BuildContext context) {
    final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
    return Column(children: [
      Expanded(
        child: GestureDetector(
          onTap: () => checkDetail.isLocal
              ? orderBloc.add(UpdateQuantity(
                  checkDetailIDLocal: checkDetail.checkdetailidLocal,
                  mode: QuantityUpdateMode.increase))
              : {},
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: (checkDetail.isLocal ? activeColor : deactiveColor),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        flex: 1,
      ),
      Expanded(
        child: Container(
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
          child: Text(
            isInteger(checkDetail.quantity)
                ? checkDetail.quantity.round().toString()
                : checkDetail.quantity.toString(),
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        flex: 1,
      ),
      Expanded(
        child: GestureDetector(
          onTap: () => checkDetail.isLocal
              ? orderBloc.add(UpdateQuantity(
                  checkDetailIDLocal: checkDetail.checkdetailidLocal,
                  mode: QuantityUpdateMode.decrease))
              : {},
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: (checkDetail.isLocal ? activeColor : deactiveColor)),
            child: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ),
        flex: 1,
      )
    ]);
  }
}

bool isInteger(num value) => value is int || value == value.roundToDouble();
