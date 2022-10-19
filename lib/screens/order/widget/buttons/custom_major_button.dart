import 'package:flutter/material.dart';

class CustomMajorButton extends StatelessWidget {
  const CustomMajorButton(
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
    return Container(
      margin: const EdgeInsets.all(10),
      width: 100,
      height: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            backgroundColor: color,
            shadowColor: color,
            elevation: 3,
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox.fromSize(
                  size: const Size.fromRadius(25),
                  child: FittedBox(
                    child: icons,
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                      color: textColors),
                )
              ],
            ),
          )),
    );
  }
}
