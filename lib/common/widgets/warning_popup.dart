import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';

// ignore: must_be_immutable
class WarningPopUp extends StatelessWidget {
  String msg;
  WarningPopUp({Key? key, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.warning,
        size: defaultSize * 14,
      ),
      iconColor: warningColor,
      title: Text(
        msg,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: defaultPadding * 0.5,
              ),
              child: SizedBox(
                width: defaultPadding * 6,
                child: ElevatedButton(
                  child: const Text('Đóng'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: voidColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
