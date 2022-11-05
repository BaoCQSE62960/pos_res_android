import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_res_android/common/widgets/warning_popup.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/opening.dart';
import 'package:pos_res_android/repos/services/login_service.dart';
// import 'package:pos_res_android/screens/Login/widget/dropdown_shift.dart';

List<Shift> list = [];
List<String> shiftName = [];
List<TimeOfDay> startTime = [];
List<TimeOfDay> endTime = [];
late TimeOfDay displayStart;
late String stringStart;
late TimeOfDay displayEnd;
late String stringEnd;
late int dropdownIndex;

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginService service = LoginService();

  Future getShiftItem() async {
    List splitStart, splitEnd;
    list = await service.getShifts();

    shiftName = list.map((e) => e.name).toList();

    startTime = list.map((e) => e.starttime).toList();
    displayStart = startTime[dropdownIndex];
    stringStart = displayStart.toString();
    splitStart = stringStart.split('(');
    stringStart = splitStart[1];
    splitStart = stringStart.split(')');
    stringStart = splitStart[0];

    endTime = list.map((e) => e.endtime).toList();
    displayEnd = endTime[dropdownIndex];
    stringEnd = displayEnd.toString();
    splitEnd = stringEnd.split('(');
    stringEnd = splitEnd[1];
    splitEnd = stringEnd.split(')');
    stringEnd = splitEnd[0];

    return list;
  }

  String dropdownValue = "";

// ignore: must_be_immutable
// class LoginForm extends StatelessWidget {
  // Socket socket;
  // LoginForm({Key? key, required this.socket}) : super(key: key);
  // LoginForm({Key? key}) : super(key: key);

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
    String openingAmount = "0";

    Future<void> _openingDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Xác nhận mở ca',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: <Widget>[
              FutureBuilder(
                  future:
                      getShiftItem(), // a previously-obtained Future<String> or null
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (dropdownValue == "") {
                        dropdownValue = shiftName.first;
                      }
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: defaultPadding * 0.5,
                            ),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_drop_down),
                              elevation: 16,
                              style: const TextStyle(color: textColor),
                              underline: Container(
                                height: 2,
                                color: primaryColor,
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  print(shiftName);
                                  dropdownValue = value!;
                                  // ignore: avoid_print
                                  dropdownIndex = shiftName.indexOf(value);

                                  print(dropdownIndex);
                                  print(dropdownValue);
                                });
                              },
                              items: shiftName.map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: stringStart,
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: stringEnd,
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
                            padding: const EdgeInsets.only(
                                top: defaultPadding * 0.5),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
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
                                    onPressed: () {
                                      // ignore: avoid_print
                                      print(openingAmount);
                                      openingAmount = "0";
                                      // Navigator.of(context).pop();
                                      Navigator.of(context)
                                          .pushNamed('/tableoverview');
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
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),
            ],
          );
        },
      );
    }

    Future<void> _loginFailDialog() async {
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
                    _openingDialog();
                  } else {
                    Navigator.of(context).pushNamed('/tableoverview');
                  }
                }
                if (result[0] == false) {
                  _loginFailDialog();
                  // ignore: avoid_print
                  // print("message: " + result[1]);
                }
              },

              // onPressed: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) {
              //         return BlocProvider(
              //             create: (context) => TableLayoutBloc(),
              //             child: const TableLayoutScreen());
              //       },
              //     ),
              //   );
              // },

              onLongPress: () {
                _openingDialog();
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
