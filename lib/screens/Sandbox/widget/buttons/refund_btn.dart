import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';

class RefundBtn extends StatefulWidget {
  const RefundBtn({Key? key}) : super(key: key);

  @override
  State<RefundBtn> createState() => _RefundBtnState();
}

class _RefundBtnState extends State<RefundBtn> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class RefundBtn extends StatelessWidget {
//   const RefundBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "refund_btn",
      child: SizedBox(
        height: defaultPadding * 2.5,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: activeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {
            _showMyDialog();
          },
          child: Text(
            "Hoàn tiền".toUpperCase(),
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Xác nhận hoàn tiền',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          // content: SingleChildScrollView(
          //   child: Column(
          //     children: <Widget>[
          //       Text('This is a demo alert dialog.'),
          //       Text('Would you like to approve of this message?'),
          //     ],
          //   ),
          // ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: defaultPadding * 0.5,
                    bottom: defaultPadding * 0.5,
                  ),
                  child: SizedBox(
                    width: defaultPadding * 6,
                    child: ElevatedButton(
                      child: const Text('Xác nhận'),
                      onPressed: () {
                        // print('Confirmed');
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: activeColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: defaultPadding * 0.5,
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
      },
    );
  }
}
