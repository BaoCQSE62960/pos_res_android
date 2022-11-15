import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_res_android/common/widgets/warning_popup.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/log.dart';
import 'package:pos_res_android/repos/services/cashier/log_service.dart';

// ignore: must_be_immutable
class AmountPopup extends StatefulWidget {
  CashierLog log;
  AmountPopup({Key? key, required this.log}) : super(key: key);

  @override
  State<AmountPopup> createState() => _AmountPopupState();
}

class _AmountPopupState extends State<AmountPopup> {
  final CashierLogService service = Get.put(CashierLogService());
  int logId = 0;
  num amount = 0;
  String currentAmount = "";
  List logItem = [];
  String msg = "";

  Future<void> _messageDialog(String msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WarningPopUp(msg: msg);
      },
    );
  }

  Future putCashierLogAmount(logId, amount) async {
    logItem = await service.putCashierLogAmount(logId, amount);
    return logItem;
  }

  Future<void> _msgFailDialog() async {
    List split1, split2;
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        String finalMsg = logItem[1];
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
    logId = widget.log.id;
    currentAmount = widget.log.amount.toString();
    if (currentAmount.isEmpty) {
      currentAmount = "0";
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Cập nhật số tiền',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: defaultPadding * 0.75,
                left: defaultPadding * 0.75,
                bottom: defaultPadding * 0.75,
              ),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                cursorColor: primaryColor,
                initialValue: currentAmount,
                onChanged: (value) {
                  currentAmount = value;
                },
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: deactiveLightColor,
                  prefixIconColor: primaryColor,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: defaultPadding),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide.none,
                  ),
                  // hintText: "Nhập số tiền",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(
                      Icons.attach_money,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: defaultPadding * 6,
              child: ElevatedButton(
                child: const Text('Xác nhận'),
                onPressed: () async {
                  if (num.parse(currentAmount) < 0) {
                    msg = "Xin nhập số tiền hợp lệ!";
                    _messageDialog(msg);
                  } else {
                    logItem = await putCashierLogAmount(
                        logId, num.parse(currentAmount));
                    if (logItem[0] == true) {
                      widget.log.setAmount = num.parse(currentAmount);
                      Navigator.of(context).pop();
                    }
                    if (logItem[0] == false) {
                      Navigator.of(context).pop();
                      _msgFailDialog();
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: activeColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
