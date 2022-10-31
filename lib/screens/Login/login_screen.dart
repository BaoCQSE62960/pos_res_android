import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/background.dart';
import 'package:pos_res_android/common/widgets/responsive.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Login/widget/login_form.dart';
import 'package:pos_res_android/screens/Login/widget/login_screen_image.dart';
// ignore: library_prefixes
// import 'package:socket_io_client/socket_io_client.dart' as IO;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // late IO.Socket socket;
  // String uriConnect = uri;
  // Socket socket = Socket();

  // @override
  // void initState() {
  //   socket.declareSocket();
  //   socket.connectServer();
  //   super.initState();
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   connectAndListen();
  // }

  // void connectAndListen() {
  //   // ignore: avoid_print
  //   print("call func");
  //   socket =
  //       IO.io(uri, IO.OptionBuilder().setTransports(['websocket']).build());

  //   // socket.emit('join-pos-location', '1');
  //   socket.onConnect((_) {
  //     // ignore: avoid_print
  //     print("connect");
  //     socket.emit('msg', 'test connect from client');
  //   });

  //   // ignore: avoid_print
  //   socket.onDisconnect((_) => print('disconnect'));
  // }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          tablet: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const LoginScreenImage(),
              Container(
                height: 390,
                width: 420,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 360,
                      child: LoginForm(
                          // socket: socket,
                          ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(width: defaultPadding * 3),
            ],
          ),
        ),
      ),
    );
  }
}
