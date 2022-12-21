import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/waiter/checkdetail.dart';
import 'package:pos_res_android/screens/Order/order.dart';
import 'package:pos_res_android/screens/Order/widget/buttons/custom_quantity_button.dart';
import 'package:pos_res_android/screens/Order/widget/buttons/custom_quantity_button_change_order.dart';

enum Mode { orderdetail, changeorder }

class ActionItemList extends StatelessWidget {
  const ActionItemList(
      {Key? key,
      required this.name,
      required this.sepcialRequest,
      required this.price,
      required this.isDone,
      required this.checkDetail,
      this.currentMode = Mode.orderdetail})
      : super(key: key);
  final String name;
  final String sepcialRequest;
  final String price;
  final bool isDone;
  final Mode currentMode;
  final CheckDetail checkDetail;

  @override
  Widget build(BuildContext context) {
    final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
    return Container(
      width: double.infinity,
      height: 100,
      color: isDone ? Colors.grey[100] : Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
                margin: const EdgeInsets.all(5),
                child: currentMode == Mode.orderdetail
                    ? CustomQuantityButton(
                        checkDetail: checkDetail,
                      )
                    : CustomQuantityButtonChangeOrder(
                        checkDetail: checkDetail)),
            flex: 1,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(color: textColor2),
                          ),
                          const Spacer(),
                          Text(sepcialRequest,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              maxLines: 1,
                              style: TextStyle(
                                  color: textColor2,
                                  fontStyle: FontStyle.italic)),
                          Text(checkDetail.note,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              maxLines: 1,
                              style: TextStyle(
                                  color: textColor2,
                                  fontStyle: FontStyle.italic))
                        ]),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(price,
                              style: TextStyle(
                                  color: textColor2,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                          buildIconWidget(checkDetail.status)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            flex: 8,
          ),
          currentMode == Mode.changeorder
              ? Expanded(
                  flex: 1,
                  child: Checkbox(
                    value: orderBloc.state.listSelectedCheckDetail.isEmpty
                        ? false
                        : orderBloc.state.listSelectedCheckDetail.any(
                            (element) =>
                                element.checkdetailid ==
                                checkDetail.checkdetailid),
                    onChanged: (newValue) {
                      orderBloc.add(SelectCheckDetailForChangeOrder(
                          checkDetail: checkDetail));
                    },
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  Widget buildIconWidget(String status) {
    switch (status) {
      case 'READY':
        return const Icon(
          Icons.dinner_dining_rounded,
          size: defaultPadding * 2.5,
          color: warningColor,
        );
      case 'WAITING':
        return const Icon(
          Icons.timelapse_rounded,
          size: defaultPadding * 2.5,
          color: deactiveColor,
        );
      case 'RECALL':
        return const Icon(
          Icons.cancel_outlined,
          size: defaultPadding * 2.5,
          color: voidColor,
        );
      default:
        return const SizedBox();
    }
  }
}
