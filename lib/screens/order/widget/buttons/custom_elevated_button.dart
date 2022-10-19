import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key, required this.icons, required this.text})
      : super(key: key);

  final Icon icons;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shadowColor: shadowColor,
          elevation: 3,
          backgroundColor: primaryColor,
        ),
        onPressed: () {},
        icon: icons,
        label: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.normal, fontSize: 15, color: Colors.white),
        ));
  }
}
