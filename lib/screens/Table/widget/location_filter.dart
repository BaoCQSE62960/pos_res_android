// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';

class LocationFilter extends StatelessWidget {
  const LocationFilter({Key? key}) : super(key: key);
  Widget getLocation(int num) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < num; i++) {
      list.add(
        TextButton(
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
      );
    }
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        // crossAxisSpacing: 16,
        mainAxisSpacing: defaultPadding * 0.5,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: defaultPadding * 2.5,
              child: getLocation(10)),
        ],
      ),
    );
  }
}
