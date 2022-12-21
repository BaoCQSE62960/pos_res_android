import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      required this.text,
      required this.callback,
      this.buttonColors = activeColor})
      : super(key: key);

  final String text;
  final VoidCallback callback;
  final Color? buttonColors;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        shadowColor: shadowColor,
        elevation: 3,
        backgroundColor: buttonColors,
      ),
      onPressed: callback,
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.normal, fontSize: 15, color: Colors.white),
      ),
    );
  }
}
