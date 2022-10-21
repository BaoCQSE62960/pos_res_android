import 'dart:async';

import 'package:pos_res_android/screens/ChangeShift/change_shift_state.dart';
import 'package:pos_res_android/screens/Order/order.dart';

class ChangeShiftBloc {
  var state = ChangeShiftState();

  final eventController = StreamController<OrderEvent>();

  final stateController = StreamController<ChangeShiftState>();

  ChangeShiftBloc() {
    eventController.stream.listen((event) {
      stateController.sink.add(state);
    });
  }

  void dispose() {
    stateController.close();
    eventController.close();
  }
}
