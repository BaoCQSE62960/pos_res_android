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

  // Future<void> _showMyDialog() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text(
  //           'Xác nhận hoàn tiền',
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         // content: SingleChildScrollView(
  //         //   child: Column(
  //         //     children: <Widget>[
  //         //       Text('This is a demo alert dialog.'),
  //         //       Text('Would you like to approve of this message?'),
  //         //     ],
  //         //   ),
  //         // ),
  //         actions: <Widget>[
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.only(
  //                   right: defaultPadding * 0.5,
  //                   bottom: defaultPadding * 0.5,
  //                 ),
  //                 child: SizedBox(
  //                   width: defaultPadding * 6,
  //                   child: ElevatedButton(
  //                     child: const Text('Xác nhận'),
  //                     onPressed: () {
  //                       // print('Confirmed');
  //                       Navigator.of(context).pop();
  //                     },
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: activeColor,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(
  //                   left: defaultPadding * 0.5,
  //                   bottom: defaultPadding * 0.5,
  //                 ),
  //                 child: SizedBox(
  //                   width: defaultPadding * 6,
  //                   child: ElevatedButton(
  //                     child: const Text('Đóng'),
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                     },
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: voidColor,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
