import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../common/widgets/background.dart';
import '../../common/widgets/responsive.dart';
import '../../config/routes.dart';
import 'widget/login_form.dart';
import 'widget/login_screen_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late IO.Socket socket;
  // String uri = "http://localhost:5000";
  String uri = "http://192.168.1.6:5000";

  @override
  void initState() {
    super.initState();
    connectAndListen();
  }

  void connectAndListen() {
    // ignore: avoid_print
    print("call func");
    socket =
        IO.io(uri, IO.OptionBuilder().setTransports(['websocket']).build());

    socket.emit('join-pos-location', '1');
    socket.onConnect((_) {
      // ignore: avoid_print
      print("connect");
      socket.emit('msg', 'test connect from client');
    });

    // ignore: avoid_print
    socket.onDisconnect((_) => print('disconnect'));
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          tablet: Row(
            children: [
              const Expanded(
                child: LoginScreenImage(),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: textLightColor,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: const [
                      BoxShadow(
                        color: shadowColor,
                        blurRadius: 4,
                        offset: Offset(0, 4), // Shadow position
                      ),
                    ],
                  ),
                  height: 390,
                  // width: 390,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 420,
                        child: LoginForm(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: defaultPadding * 3),
            ],
          ),
        ),
      ),
    );
  }
}
