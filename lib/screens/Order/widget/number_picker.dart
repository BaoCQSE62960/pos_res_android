import 'package:flutter/cupertino.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Order/order.dart';

class NumberPickerDialog extends StatefulWidget {
  const NumberPickerDialog({
    Key? key,
    required this.orderBloc,
  }) : super();

  final OrderLayoutBloc orderBloc;

  @override
  State<NumberPickerDialog> createState() => _NumberPickerDialogState();
}

class _NumberPickerDialogState extends State<NumberPickerDialog> {
  int _currentValue = 10;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          NumberPicker(
            textStyle: const TextStyle(color: textColor),
            selectedTextStyle: const TextStyle(
                color: activeColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
            value: widget.orderBloc.state.percent,
            minValue: 10,
            maxValue: 100,
            step: 10,
            onChanged: (value) => widget.orderBloc
                .add(SelectPercentForSplitOrder(percent: value)),
          ),
        ],
      ),
    );
  }
}
