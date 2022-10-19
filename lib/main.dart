// ignore_for_file: avoid_print

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes.dart';
import 'config/theme.dart';
import 'screens/Login/login_screen.dart';

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print(error);
  }
}

// void main() => runApp(const MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US')],
    path: 'assets/i18n',
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Phần mềm quản lý nhà hàng';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: _title,
      // theme: ThemeData(
      //     primaryColor: primaryColor,
      //     scaffoldBackgroundColor: primaryColor,
      //     elevatedButtonTheme: ElevatedButtonThemeData(
      //       style: ElevatedButton.styleFrom(
      //         elevation: 0,
      //         backgroundColor: primaryColor,
      //         shape: const StadiumBorder(),
      //         maximumSize: const Size(double.infinity, 56),
      //         minimumSize: const Size(double.infinity, 56),
      //       ),
      //     ),
      //     inputDecorationTheme: const InputDecorationTheme(
      //       filled: true,
      //       fillColor: primaryLightColor,
      //       iconColor: primaryColor,
      //       prefixIconColor: primaryColor,
      //       contentPadding: EdgeInsets.symmetric(
      //           horizontal: defaultPadding, vertical: defaultPadding),
      //       border: OutlineInputBorder(
      //         borderRadius: BorderRadius.all(Radius.circular(30)),
      //         borderSide: BorderSide.none,
      //       ),
      //     )),
      home: const LoginScreen(),
      // home: Scaffold(
      //   appBar: AppBar(title: const Text(_title)),
      //   body: const MyStatefulWidget(),
      // ),
    );
  }
}
