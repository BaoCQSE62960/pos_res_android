import 'dart:async';

import 'package:pos_res_android/screens/order/order.dart';

class OrderBloc {
  static final int DEFAULT_COMPACT_MODE_FLEX = 2;
  static final int DEFAULT_OPEN_MODE_FLEX = 10;
  static final int DEFAULT_SIDE_MENU_FLEX = 1;
  var state = OrderState(2, 1, false);

  final eventController = StreamController<OrderEvent>();

  final stateController = StreamController<OrderState>();

  OrderBloc() {
    eventController.stream.listen((event) {
      if (event is OpenSideMenu) {
        state =
            OrderState(DEFAULT_OPEN_MODE_FLEX, DEFAULT_SIDE_MENU_FLEX, true);
      } else if (event is CloseSideMenu) {
        state = OrderState(
            DEFAULT_COMPACT_MODE_FLEX, DEFAULT_SIDE_MENU_FLEX, false);
      }
      stateController.sink.add(state);
    });
  }

  void dispose() {
    stateController.close();
    eventController.close();
  }
}
