// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../config/theme.dart';
import '../../screens/Login/login_screen.dart';

class TableLayoutScreen extends StatelessWidget {
  const TableLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Background(
    return Scaffold(
      backgroundColor: textLightColor,
      body: Container(
        height: double.infinity,
        color: activeColor,
        child: const SideBar(),
      ),
    );
  }
}

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: activeColor,
          child: SizedBox(
            width: defaultPadding * 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton(
                  onPressed: () => {},
                  color: activeColor,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: const <Widget>[
                      Icon(
                        Icons.table_bar,
                        size: 50,
                        color: textLightColor,
                      ),
                      Text(
                        "SƠ ĐỒ BÀN",
                        style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w700,
                          color: textLightColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: activeColor,
                  height: defaultPadding * 31,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ),
                    );
                  },
                  color: activeColor,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: const <Widget>[
                      Icon(
                        Icons.logout,
                        size: 50,
                        color: textLightColor,
                      ),
                      Text(
                        'ĐĂNG XUẤT',
                        style: TextStyle(
                          fontSize: 10,
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
}
