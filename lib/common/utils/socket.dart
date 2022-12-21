import 'package:pos_res_android/config/routes.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class Socket {
  late io.Socket socket;
  String uriConnect = uri;

  Socket();
  // declare
  void declareSocket() {
    socket = io.io(
        uriConnect,
        io.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());
    socket.emit('join-pos-location', '0');
  }

  // connect
  void connectServer() {
    if (!socket.connected) {
      socket.connect();
    }
  }

  void sendToServer() {}

  // disconnect
  void disconnectServer() {
    if (!socket.disconnected) {
      socket.disconnect();
    }
  }
}
