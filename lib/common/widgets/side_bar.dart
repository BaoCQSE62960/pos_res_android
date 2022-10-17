import 'package:flutter/material.dart';
import '../../config/routes.dart';
import '../../config/theme.dart';
import '../../screens/Login/login_screen.dart';
import '../../screens/Table/table_layout_screen.dart';

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
          color: sideBarColor,
          child: SizedBox(
            height: MediaQuery.of(context).size.height - defaultPadding * 1.5,
            // width: defaultPadding * 6,
            width: MediaQuery.of(context).size.width / 14,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const TableLayoutScreen();
                        },
                      ),
                    );
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
                  color: sideBarColor,
                  // height: defaultPadding * 30.75,
                  height: defaultPadding * 30,
                ),
                TextButton(
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
                  style: TextButton.styleFrom(
                    backgroundColor: sideBarColor,
                  ),
                  // color: sideBarColor,
                  // padding: const EdgeInsets.all(20),
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
