import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/payment.dart';
import 'package:pos_res_android/repos/services/cashier/payment_service.dart';

// ignore: must_be_immutable
class PaymentActionButton extends StatefulWidget {
  List<PaymentProcess> paidList;
  int checkId;
  PaymentActionButton({Key? key, required this.checkId, required this.paidList})
      : super(key: key);

  @override
  State<PaymentActionButton> createState() => _PaymentActionButtonState();
}

class _PaymentActionButtonState extends State<PaymentActionButton> {
  PaymentService service = PaymentService();
  late List<PaymentProcess> paidList;
  late int checkId;
  @override
  void initState() {
    super.initState();
    paidList = widget.paidList;
    checkId = widget.checkId;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: defaultPadding * 3,
          width: defaultPadding * 8.5,
          child: Hero(
            tag: "close_check_btn",
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: activeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                service.processCheck(checkId, paidList);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    Icons.document_scanner,
                    size: defaultSize * 6,
                    color: textLightColor,
                  ),
                  Text(
                    "Đóng hóa đơn",
                    style: TextStyle(
                      fontSize: defaultSize * 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: defaultPadding * 0.5,
        ),
        SizedBox(
          height: defaultPadding * 3,
          width: defaultPadding * 8.5,
          child: Hero(
            tag: "undo_btn",
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: activeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    Icons.undo,
                    size: defaultSize * 6,
                    color: textLightColor,
                  ),
                  Text(
                    "Hoàn tác",
                    style: TextStyle(
                      fontSize: defaultSize * 3,
                      color: textLightColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
