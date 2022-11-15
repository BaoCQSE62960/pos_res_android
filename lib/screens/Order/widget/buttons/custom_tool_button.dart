import 'package:flutter/material.dart';

class CustomToolButton extends StatelessWidget {
  const CustomToolButton(
      {Key? key,
      required this.icons,
      required this.text,
      required this.color,
      required this.onPressed,
      required this.textColors})
      : super(key: key);

  final Icon icons;
  final String text;
  final Color color;
  final Color textColors;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 80,
      width: 110,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shadowColor: color,
            elevation: 3,
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 4,
              bottom: 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icons,
                Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 11,
                      color: textColors),
                )
              ],
            ),
          )),
    );
  }
}
