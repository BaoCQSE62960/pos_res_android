import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';

Column CustomQuantityButton() {
  return Column(children: [
    Expanded(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          color: primaryColor,
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      flex: 1,
    ),
    Expanded(
      child: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: const Text(
          "1",
          style: TextStyle(color: Colors.grey),
        ),
      ),
      flex: 1,
    ),
    Expanded(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            color: primaryColor),
        child: const Icon(
          Icons.remove,
          color: Colors.white,
        ),
      ),
      flex: 1,
    )
  ]);
}
