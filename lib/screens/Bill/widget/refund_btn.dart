import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/success_popup.dart';
import 'package:pos_res_android/common/widgets/warning_popup.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/bill.dart';
import 'package:pos_res_android/repos/services/cashier/bill_service.dart';

class RefundBtn extends StatefulWidget {
  final List<BillItem> list;
  const RefundBtn({Key? key, required this.list}) : super(key: key);

  @override
  State<RefundBtn> createState() => _RefundBtnState();
}

class _RefundBtnState extends State<RefundBtn> {
  List<BillItem> billItem = [];
  List result = [];
  bool refundable = true;
  String msg = "";

  Future refundPayment(int billId) async {
    BillService service = BillService();
    result = await service.refund(billId);
    return result;
  }

  Future<void> _successDialog(String msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SuccessPopUp(msg: msg);
      },
    );
  }

  Future<void> _warningDialog() async {
    List split1, split2;
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        String finalMsg = result[1];
        if (finalMsg.contains("msg")) {
          split1 = finalMsg.split(':');
          finalMsg = split1[1];
        }
        split2 = finalMsg.split('"');
        finalMsg = split2[1];
        return WarningPopUp(msg: finalMsg);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    billItem = widget.list;
    if (billItem[0].status == "REFUND") {
      refundable = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: refundable,
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
            _refundDialog(billItem[0].id);
          },
          child: Text(
            "Ho??n ti???n".toUpperCase(),
          ),
        ),
      ),
    );
  }

  Future<void> _refundDialog(int billId) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'X??c nh???n ho??n ti???n',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
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
                      child: const Text('X??c nh???n'),
                      onPressed: () async {
                        result = await refundPayment(billId);
                        if (result[0] == true) {
                          Navigator.of(context).pushNamed('/billlist');
                          msg = "Ho??n ti???n th??nh c??ng!";
                          _successDialog(msg);
                        }
                        if (result[0] == false) {
                          _warningDialog();
                        }
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
                      child: const Text('????ng'),
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
