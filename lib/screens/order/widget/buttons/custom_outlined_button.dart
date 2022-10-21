import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton(
      {Key? key,
      required this.icons,
      required this.text,
      required this.function})
      : super(key: key);

  final VoidCallback function;
  final Icon icons;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 143,
      child: OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            shadowColor: shadowColor,
            elevation: 3,
            backgroundColor: Colors.white,
          ),
          onPressed: function,
          icon: icons,
          label: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: activeColor),
          )),
    );
  }
}
