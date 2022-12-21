import 'package:flutter/material.dart';

class CustomMajorButton extends StatelessWidget {
  const CustomMajorButton(
      {Key? key,
      required this.icons,
      required this.text,
      required this.color,
      required this.textColors,
      required this.function})
      : super(key: key);

  final Icon icons;
  final String text;
  final Color color;
  final Color textColors;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 100,
      height: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          backgroundColor: color,
          shadowColor: color,
          elevation: 3,
        ),
        onPressed: function,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 12, color: textColors),
            )
          ],
        ),
      ),
    );
  }
}
