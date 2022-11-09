import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_res_android/common/widgets/warning_popup.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/shift.dart';
import 'package:pos_res_android/repos/services/login_service.dart';
import 'package:pos_res_android/screens/Login/widget/pick_shift_pop_up.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  List<Shift> list = [];
  LoginService service = LoginService();
  String dropdownValue = "";

// class LoginForm extends StatelessWidget {
  // Socket socket;
  // LoginForm({Key? key, required this.socket}) : super(key: key);

  List result = [];
  Future loginToSystem(String username, String password) async {
    LoginService service = LoginService();
    result = await service.login(username, password);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    String username = "";
    String password = "";
    String msg = "";

    Future<void> _openingDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return PickShiftPopUp(
            listShift: list,
          );
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

    Future<void> _simpleFailDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return WarningPopUp(msg: msg);
        },
      );
    }

    return Form(
      child: Column(
        children: [
          const SizedBox(height: defaultPadding * 3),
          TextFormField(
            textInputAction: TextInputAction.next,
            cursorColor: primaryColor,
            onChanged: (value) {
              username = value;
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
              hintText: "Tài khoản",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(
                  Icons.person,
                  color: primaryColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: textColor,
              onChanged: (value) {
                password = value;
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
                hintText: "Mật khẩu",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(
                    Icons.lock,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: activeColor,
                elevation: 0,
                shape: const StadiumBorder(),
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
              onPressed: () async {
                result = await loginToSystem(username, password);
                if (result[0] == true) {
                  if (result[1].toString().contains("CASHIER")) {
                    list = await service.getShifts();
                    if (list.isEmpty) {
                      msg = "Không có dữ liệu!";
                      _simpleFailDialog();
                    } else {
                      _openingDialog();
                    }
                  } else {
                    Navigator.of(context).pushNamed('/tableoverview');
                  }
                }
                if (result[0] == false) {
                  _msgFailDialog();
                }
              },
              child: Text(
                "Đăng nhập".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "close_btn",
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: voidColor,
                elevation: 0,
                shape: const StadiumBorder(),
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
              onPressed: () {
                // socket.disconnectServer();
                SystemNavigator.pop();
              },
              // onPressed: () => exit(0),
              child: Text(
                "Thoát".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
