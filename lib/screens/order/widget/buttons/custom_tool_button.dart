import 'package:flutter/material.dart';

class CustomToolButton extends StatelessWidget {
  const CustomToolButton(
      {Key? key,
      required this.icons,
      required this.text,
      required this.color,
      required this.textColors})
      : super(key: key);

  final Icon icons;
  final String text;
  final Color color;
  final Color textColors;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shadowColor: color,
          elevation: 3,
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icons,
              Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: textColors),
              )
            ],
          ),
        ));
  }
}
