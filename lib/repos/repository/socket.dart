// ignore_for_file: avoid_print

import 'package:pos_res_android/config/routes.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Socket {
  late IO.Socket socket;
  String uriConnect = uri;
  //
  Socket();
  // declare
  void declareSocket() {
    print("call func");
    socket = IO.io(
        uriConnect,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());
    socket.onConnect((_) {
      print("connect");
    });
    // socket.emit('join-pos-location', '1');
    socket.onDisconnect((_) => print('disconnect'));
    socket.onConnectError((data) => print('connect error' + data.toString()));
    socket.onConnecting((data) => print('connecting to server'));
  }

  // connect
  void connectServer() {
    if (!socket.connected) {
      socket.connect();
    }
  }

  //
  void sendToServer() {}

  // disconnect
  void disconnectServer() {
    if (!socket.disconnected) {
      socket.disconnect();
    }
  }

  // listen
}
