import 'dart:async';

import 'package:pos_res_android/screens/Sandbox/ChangeShift/change_shift_event.dart';
import 'package:pos_res_android/screens/Sandbox/ChangeShift/change_shift_state.dart';

class ChangeShiftBloc {
  var state = ChangeShiftState();

  final eventController = StreamController<ChangeShiftEvent>();

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
