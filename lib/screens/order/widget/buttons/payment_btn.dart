import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Order/order.dart';

class ChargeBtn extends StatelessWidget {
  const ChargeBtn({Key? key}) : super(key: key);

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
        orderBloc.add(ChangeMode());
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return const PaymentScreen();
        //     },
        //   ),
        // );
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
