import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/warning_popup.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/services/login_service.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List currentUserRole = [];
  List result = [];
  LoginService service = LoginService();
  String closingAmount = "";
  late num amount;
  String msg = "";
  String role = "";
  bool isCashier = true;

  getCurrentUserRole() async {
    currentUserRole = await service.getRole();
    setState(() {
      if (currentUserRole[1].toString().contains("CASHIER")) {
        role = "CASHIER";
        isCashier = true;
      } else {
        role = "";
        isCashier = false;
      }
    });
  }

  Future logoutFromSystem() async {
    LoginService service = LoginService();
    result = await service.logout();
    return result;
  }

  Future<void> _messageDialog(String msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WarningPopUp(msg: msg);
      },
    );
  }

  @override
  void initState() {
    getCurrentUserRole();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: sideBarColor,
          child: SizedBox(
            height: MediaQuery.of(context).size.height - defaultPadding * 1.4,
            // width: defaultPadding * 6,
            //width: MediaQuery.of(context).size.width / 14,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed('/tableoverview');
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: sideBarColor,
                    // textStyle: GoogleFonts.fredokaOne(),
                  ),
                  // color: sideBarColor,
                  // padding: const EdgeInsets.all(20),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: const <Widget>[
                      Icon(
                        Icons.table_bar,
                        size: defaultSize * 12.5,
                        color: textLightColor,
                      ),
                      Text(
                        "SƠ ĐỒ BÀN",
                        style: TextStyle(
                          fontSize: defaultSize * 2.5,
                          fontWeight: FontWeight.w700,
                          color: textLightColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: isCashier,
                  child: TextButton(
                    onPressed: () {
                      if (role == "CASHIER") {
                        Navigator.of(context)
                            .pushReplacementNamed('/checklist');
                      } else {
                        msg = "Vai trò của người dùng không phù hợp";
                        _messageDialog(msg);
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: sideBarColor,
                    ),
                    child: Column(
                      children: const <Widget>[
                        Icon(
                          Icons.search,
                          size: defaultSize * 12.5,
                          color: textLightColor,
                        ),
                        Text(
                          "TÌM HÓA ĐƠN",
                          style: TextStyle(
                            fontSize: defaultSize * 2.125,
                            fontWeight: FontWeight.w700,
                            color: textLightColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: sideBarColor,
                  // height: defaultPadding * 28.5,
                  height: defaultPadding * 26.25,
                ),
                Visibility(
                  visible: isCashier,
                  child: TextButton(
                    onPressed: () {
                      if (role == "CASHIER") {
                        Navigator.of(context)
                            .pushReplacementNamed('/cashierlog');
                      } else {
                        msg = "Vai trò của người dùng không phù hợp";
                        _messageDialog(msg);
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: sideBarColor,
                    ),
                    child: Column(
                      children: const <Widget>[
                        Icon(
                          Icons.text_snippet,
                          size: defaultSize * 12,
                          color: textLightColor,
                        ),
                        Text(
                          'NHẬT KÝ',
                          style: TextStyle(
                            fontSize: defaultSize * 2.5,
                            fontWeight: FontWeight.w700,
                            color: textLightColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    if (role == "CASHIER") {
                      _closingDialog();
                    } else {
                      result = await logoutFromSystem();
                      if (result[0] == true) {
                        Navigator.of(context).pushReplacementNamed('/login');
                      } else {
                        Navigator.of(context).pushReplacementNamed('/login');
                        _logoutFailDialog();
                      }
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: sideBarColor,
                  ),
                  child: Column(
                    children: const <Widget>[
                      Icon(
                        Icons.logout,
                        size: defaultSize * 12.5,
                        color: textLightColor,
                      ),
                      Text(
                        'ĐĂNG XUẤT',
                        style: TextStyle(
                          fontSize: defaultSize * 2.5,
                          fontWeight: FontWeight.w700,
                          color: textLightColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _logoutFailDialog() async {
    List split1, split2;
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        String finalMsg = result[1];
        split1 = finalMsg.split(':');
        finalMsg = split1[1];
        split2 = finalMsg.split('"');
        finalMsg = split2[1];
        return WarningPopUp(msg: finalMsg);
      },
    );
  }

  Future<void> _closingDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Xác nhận đóng ca',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: defaultPadding * 0.5),
                  child: SizedBox(
                    height: defaultPadding * 4,
                    width: defaultPadding * 13.5,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      cursorColor: textColor,
                      onChanged: (value) {
                        closingAmount = value;
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: deactiveLightColor,
                        prefixIconColor: primaryColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Tiền đóng ca",
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
                        right: defaultPadding * 0.5,
                        bottom: defaultPadding * 0.5,
                      ),
                      child: SizedBox(
                        width: defaultPadding * 6,
                        child: ElevatedButton(
                          child: const Text('Xác nhận'),
                          onPressed: () async {
                            if (closingAmount.isEmpty) {
                              msg = "Xin hãy nhập số tiền";
                              _messageDialog(msg);
                            } else {
                              amount = int.parse(closingAmount);
                              if (amount < 0 ||
                                  closingAmount.substring(
                                          closingAmount.length - 2) !=
                                      "00") {
                                msg = "Xin nhập số tiền hợp lệ";
                                _messageDialog(msg);
                              } else if (closingAmount.substring(
                                          closingAmount.length - 3) !=
                                      "500" &&
                                  closingAmount.substring(
                                          closingAmount.length - 3) !=
                                      "000") {
                                msg = "Xin nhập số tiền hợp lệ";
                                _messageDialog(msg);
                              } else {
                                service.close(amount);
                                result = await logoutFromSystem();
                                if (result[0] == true) {
                                  Navigator.of(context).pushNamed('/login');
                                } else {
                                  Navigator.of(context).pushNamed('/login');
                                  _logoutFailDialog();
                                }
                              }
                            }
                            closingAmount = "";
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
            ),
          ],
        );
      },
    );
  }
}
