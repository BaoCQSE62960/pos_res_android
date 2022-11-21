import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/common/widgets/warning_popup.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Order/order.dart';

class ChargeBtn extends StatefulWidget {
  const ChargeBtn({Key? key, required this.status}) : super(key: key);
  final String status;

  @override
  State<ChargeBtn> createState() => _ChargeBtnState();
}

class _ChargeBtnState extends State<ChargeBtn> {
  String msg = "";

  Future<void> _simpleFailDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WarningPopUp(msg: msg);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: activeColor,
        elevation: 0,
        shape: const StadiumBorder(),
        maximumSize: const Size(double.infinity, 40),
        minimumSize: const Size(double.infinity, 40),
      ),
      onPressed: () {
        if (widget.status == "ACTIVE") {
          orderBloc.add(ChangeMode());
        } else {
          msg = "Không thể cập nhật đơn!";
          _simpleFailDialog();
        }
      },
      child: Text(
        "Thanh toán".toUpperCase(),
        style: const TextStyle(
          fontSize: defaultSize * 4,
          color: textLightColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
