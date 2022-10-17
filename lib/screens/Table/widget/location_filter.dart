// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../config/theme.dart';

class LocationFilter extends StatelessWidget {
  const LocationFilter({Key? key}) : super(key: key);
  Widget getLocation(int num) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < num; i++) {
      list.add(
        SizedBox(
          width: 200,
          height: 20,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              backgroundColor: selectColor,
            ),
            child: Text(
              'Lầu ${i + 1}',
              style: const TextStyle(
                fontSize: 16,
                color: textColor,
              ),
            ),
          ),
        ),
      );
    }
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        // crossAxisSpacing: 16,
        mainAxisSpacing: 8,
        childAspectRatio: 0.5,
      ),
      scrollDirection: Axis.horizontal,
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textLightColor,
      body: getLocation(1),
    );
  }
}
