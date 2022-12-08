import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton(
      {Key? key,
      required this.icons,
      required this.text,
      required this.function,
      this.textColors = activeColor,
      this.isOutlined = true})
      : super(key: key);

  final VoidCallback function;
  final Icon icons;
  final String text;
  final bool isOutlined;
  final Color textColors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 186,
      child: OutlinedButton.icon(
        style: isOutlined
            ? OutlinedButton.styleFrom(
                shadowColor: shadowColor,
                elevation: 3,
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.transparent))
            : OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.transparent)),
        onPressed: function,
        icon: icons,
        label: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: textColors),
        ),
      ),
    );
  }
}
