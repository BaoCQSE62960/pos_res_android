import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/waiter/checkdetail.dart';
import 'package:pos_res_android/screens/Order/order.dart';

enum QuantityUpdateMode { increase, decrease }

class CustomQuantityButtonChangeOrder extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CustomQuantityButtonChangeOrder({Key? key, required this.checkDetail});

  final CheckDetail checkDetail;

  @override
  Widget build(BuildContext context) {
    final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
    CheckDetail checkDetailLocal =
        orderBloc.state.listSelectedCheckDetail.firstWhere(
      (element) => element.checkdetailid == checkDetail.checkdetailid,
      orElse: () => checkDetail,
    );
    return Column(children: [
      Expanded(
        child: GestureDetector(
          onTap: () =>
              orderBloc.state.listSelectedCheckDetail.contains(checkDetailLocal)
                  ? (isAllowToUpdateQuantity(
                          checkDetailLocal.checkdetailquantityLocal,
                          checkDetailLocal.quantity,
                          QuantityUpdateMode.increase)
                      ? orderBloc.add(UpdateQuantityChangeOrder(
                          checkDetailID: checkDetail.checkdetailid,
                          mode: QuantityUpdateMode.increase))
                      : {})
                  : {},
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: orderBloc.state.listSelectedCheckDetail
                      .contains(checkDetailLocal)
                  ? (isAllowToUpdateQuantity(
                          checkDetailLocal.checkdetailquantityLocal,
                          checkDetailLocal.quantity,
                          QuantityUpdateMode.increase)
                      ? activeColor
                      : deactiveColor)
                  : deactiveColor,
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
            orderBloc.state.listSelectedCheckDetail.contains(checkDetailLocal)
                ? (isInteger(checkDetailLocal.checkdetailquantityLocal)
                    ? checkDetailLocal.checkdetailquantityLocal
                        .round()
                        .toString()
                    : checkDetailLocal.checkdetailquantityLocal.toString())
                : (isInteger(checkDetail.quantity)
                    ? checkDetail.quantity.round().toString()
                    : checkDetail.quantity.toString()),
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        flex: 1,
      ),
      Expanded(
        child: GestureDetector(
          onTap: () =>
              orderBloc.state.listSelectedCheckDetail.contains(checkDetailLocal)
                  ? (isAllowToUpdateQuantity(
                          checkDetailLocal.checkdetailquantityLocal,
                          checkDetailLocal.quantity,
                          QuantityUpdateMode.decrease)
                      ? orderBloc.add(UpdateQuantityChangeOrder(
                          checkDetailID: checkDetail.checkdetailid,
                          mode: QuantityUpdateMode.decrease))
                      : {})
                  : {},
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: orderBloc.state.listSelectedCheckDetail
                        .contains(checkDetailLocal)
                    ? (isAllowToUpdateQuantity(
                            checkDetailLocal.checkdetailquantityLocal,
                            checkDetailLocal.quantity,
                            QuantityUpdateMode.decrease)
                        ? activeColor
                        : deactiveColor)
                    : deactiveColor),
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

  bool isAllowToUpdateQuantity(double currentQuantity, double availableQuantity,
      QuantityUpdateMode updateMode) {
    // if (currentQuantity < 1 || availableQuantity < 1) {
    //   return true;
    // } else {
    if (updateMode == QuantityUpdateMode.increase) {
      if (currentQuantity == availableQuantity) {
        return false;
      } else {
        return true;
      }
    } else if (updateMode == QuantityUpdateMode.decrease) {
      if (currentQuantity <= 1) {
        return false;
      } else {
        return true;
      }
      // }
    }
    return false;
  }
}

bool isInteger(num value) => value is int || value == value.roundToDouble();
