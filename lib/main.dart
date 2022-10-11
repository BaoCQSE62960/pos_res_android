import 'package:flutter/material.dart';

import 'config/theme.dart';
import 'screens/Login/login_screen.dart';
// import 'screens/Welcome/welcome_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Phần mềm quản lý nhà hàng';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: primaryColor,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: primaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: primaryLightColor,
            iconColor: primaryColor,
            prefixIconColor: primaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      home: const LoginScreen(),
      // home: Scaffold(
      //   appBar: AppBar(title: const Text(_title)),
      //   body: const MyStatefulWidget(),
      // ),
    );
  }
}
