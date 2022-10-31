import 'package:http/http.dart';
import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';

class LoginRepository {
  String uriConnect = uri;
  //login
  Future<bool> login(String username, String password) async {
    bool result = false;
    Map data = {"username": username, "password": password};
    var body = json.encode(data);
    // ignore: avoid_print
    print(body);
    Response res = await post(Uri.parse(uriConnect + '/login/'),
        headers: {"Content-Type": "application/json"}, body: body);
    // ignore: avoid_print
    print(res.statusCode);
    if (res.statusCode == 200) {
      result = true;
      _updateCookie(res);
      // ignore: avoid_print
      print("login success" + res.body);
    } else {
      // ignore: avoid_print
      print(res.body);
    }
    return result;
  }

  // cookie
  final LocalStorage storage = LocalStorage('cookie');
  Map<String, String> headers = {"content-type": "application/json"};
  Map<String, String> cookies = {};
  void _updateCookie(Response response) {
    String? allSetCookie = response.headers['set-cookie'];

    if (allSetCookie != null) {
      var setCookies = allSetCookie.split(',');

      for (var setCookie in setCookies) {
        var cookies = setCookie.split(';');

        for (var cookie in cookies) {
          _setCookie(cookie);
        }
      }

      headers['cookie'] = _generateCookieHeader();
      storage.setItem('headers', headers);
      storage.setItem('cookies', cookies);
    }
  }

  void _setCookie(String rawCookie) {
    if (rawCookie.isNotEmpty) {
      var keyValue = rawCookie.split('=');
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1];

        // ignore keys that aren't cookies
        if (key == 'path' || key == 'expires') return;

        cookies[key] = value;
      }
    }
  }

  String _generateCookieHeader() {
    String cookie = "";

    for (var key in cookies.keys) {
      if (cookie.isNotEmpty) cookie += ";";
      cookie += key + "=" + cookies[key]!;
    }

    return cookie;
  }
}
