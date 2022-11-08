import 'package:socket_io_client/socket_io_client.dart' as io;

class Socket {
  late io.Socket socket;
  String uriConnect = 'http://10.0.2.2:5000';
  //
  Socket();
  // declare
  void declareSocket() {
    print("call func");
    socket = io.io(
        uriConnect,
        io.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());
    socket.onConnect((_) {
      print("connect");
    });
    socket.emit('join-pos-location', '0');
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
}
