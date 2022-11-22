import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/warning_popup.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/shift.dart';
import 'package:pos_res_android/repos/services/login_service.dart';

class PickShiftPopUp extends StatefulWidget {
  final List<Shift> listShift;
  const PickShiftPopUp({Key? key, required this.listShift}) : super(key: key);

  @override
  State<PickShiftPopUp> createState() => _PickShiftPopUpState();
}

class _PickShiftPopUpState extends State<PickShiftPopUp> {
  LoginService service = LoginService();
  List<Shift> list = [];
  late Shift selectedShift;
  String openingAmount = "";
  late num amount;
  String msg = "";
  List result = [];

  Future<void> _messageDialog(String msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WarningPopUp(msg: msg);
      },
    );
  }

  Future<void> _msgFailDialog() async {
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

  String convertTimeOfDay(TimeOfDay time) {
    String hour = time.hour.toString();
    String minute = time.minute.toString();
    if (time.hour < 10) {
      hour = '0' + time.hour.toString();
    }
    if (time.minute < 10) {
      minute = '0' + time.minute.toString();
    }
    return hour + ":" + minute;
  }

  @override
  void initState() {
    super.initState();

    list = widget.listShift;
    selectedShift = list.first;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Xác nhận mở ca',
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
                bottom: defaultPadding * 0.5,
              ),
              child: DropdownButton(
                value: selectedShift,
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 16,
                style: const TextStyle(color: textColor),
                underline: Container(
                  height: 2,
                  color: primaryColor,
                ),
                onChanged: (Shift? value) {
                  setState(() {
                    selectedShift = value!;
                  });
                },
                items: list.map(
                  (Shift value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value.name),
                    );
                  },
                ).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: defaultPadding * 0.5,
                  ),
                  child: SizedBox(
                    height: defaultPadding * 4,
                    width: defaultPadding * 7,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      readOnly: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: deactiveLightColor,
                        prefixIconColor: primaryColor,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none,
                        ),
                        hintText: convertTimeOfDay(selectedShift.starttime),
                        prefixIcon: const Icon(
                          Icons.hourglass_top_rounded,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: defaultPadding * 0.5,
                  ),
                  child: SizedBox(
                    height: defaultPadding * 4,
                    width: defaultPadding * 7,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      readOnly: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: deactiveLightColor,
                        prefixIconColor: primaryColor,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none,
                        ),
                        hintText: convertTimeOfDay(selectedShift.endtime),
                        prefixIcon: const Icon(
                          Icons.hourglass_bottom_rounded,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: defaultPadding * 0.5),
              child: SizedBox(
                height: defaultPadding * 4,
                width: defaultPadding * 15.5,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  cursorColor: textColor,
                  onChanged: (value) {
                    openingAmount = value;
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: deactiveLightColor,
                    prefixIconColor: primaryColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Tiền mở ca",
                    prefixIcon: Icon(
                      Icons.attach_money,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: defaultPadding * 0.5,
                    bottom: defaultPadding * 0.5,
                  ),
                  child: SizedBox(
                    width: defaultPadding * 6,
                    child: ElevatedButton(
                      child: const Text('Xác nhận'),
                      onPressed: () async {
                        if (openingAmount.isEmpty) {
                          msg = "Xin hãy nhập số tiền";
                          _messageDialog(msg);
                        } else {
                          amount = num.parse(openingAmount);
                          if (amount < 0 ||
                              openingAmount
                                      .substring(openingAmount.length - 2) !=
                                  "00") {
                            msg = "Xin nhập số tiền hợp lệ";
                            _messageDialog(msg);
                          } else if (openingAmount
                                      .substring(openingAmount.length - 3) !=
                                  "500" &&
                              openingAmount
                                      .substring(openingAmount.length - 3) !=
                                  "000") {
                            msg = "Xin nhập số tiền hợp lệ";
                            _messageDialog(msg);
                          } else {
                            result =
                                await service.open(selectedShift.id, amount);

                            if (result[0] == true) {
                              Navigator.of(context).pushNamed('/tableoverview');
                            } else {
                              _msgFailDialog();
                            }
                          }
                        }
                        openingAmount = "";
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: activeColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
