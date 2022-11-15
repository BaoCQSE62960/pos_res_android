// ignore_for_file: avoid_print

import 'package:http/http.dart';
import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/repos/models/cashier/shift.dart';

class LoginRepository {
  String uriConnect = uri;

  //login
  Future login(String username, String password) async {
    String msg = "";
    bool result = false;
    Map data = {"username": username, "password": password};
    var body = json.encode(data);

    print(body);
    Response res = await post(Uri.parse(uriConnect + '/login/'),
        headers: {"Content-Type": "application/json"}, body: body);

    print(res.statusCode);
    if (res.statusCode == 200) {
      result = true;
      _updateCookie(res);
      print("login success" + res.body);
      msg = res.body;
    } else {
      msg = res.body;
      print("msg: " + msg);
    }

    return [result, msg];
  }

  //get shift
  Future<List<Shift>> getShifts() async {
    headers = storage.getItem('headers');
    Response res =
        await get(Uri.parse(uriConnect + '/login/shift/'), headers: headers);
    if (res.statusCode == 200) {
      print('Get shift successful');
      Map<String, dynamic> body = jsonDecode(res.body);
      List<Shift> list = ListShift.fromJson(body['shiftList']).list;
      return list;
    } else {
      throw Exception('Failed to load shift');
      // print('Failed to load shift ' + res.body);
      // return [];
    }
  }

  //cashier open
  Future open(int shiftId, int amount) async {
    headers = storage.getItem('headers');
    String msg = "";
    bool result = false;
    Map data = {"shiftid": shiftId, "amount": amount};
    var body = json.encode(data);

    print(body);
    Response res = await put(
        Uri.parse(uriConnect + '/login/cashieropen/$shiftId'),
        headers: headers,
        body: body);

    print(res.statusCode);
    if (res.statusCode == 200) {
      result = true;
      // _updateCookie(res);
      print("open successful" + res.body);
      msg = res.body;
    } else {
      msg = res.body;
      print("msg: " + msg);
    }

    return [result, msg];
  }

  //cashier close
  Future close(int amount) async {
    headers = storage.getItem('headers');
    String msg = "";
    bool result = false;
    Map data = {"amount": amount};
    var body = json.encode(data);

    print(body);
    Response res = await put(Uri.parse(uriConnect + '/logout/cashierclose/'),
        headers: headers, body: body);

    print(res.statusCode);
    if (res.statusCode == 200) {
      result = true;
      // _updateCookie(res);
      print("close successful" + res.body);
      msg = res.body;
    } else {
      msg = res.body;
      print("msg: " + msg);
    }

    return [result, msg];
  }

  //get role
  Future getRole() async {
    String msg = "";
    bool result = false;
    headers = storage.getItem('headers');
    Response res =
        await get(Uri.parse(uriConnect + '/logout/role/'), headers: headers);
    if (res.statusCode == 200) {
      result = true;
      print('Get role successful' + res.body);
      msg = res.body;
      print(msg);
    } else {
      print('Failed to load role ' + res.body);
      msg = res.body;
      print(msg);
    }
    return [result, msg];
  }

  //logout
  Future logout() async {
    headers = storage.getItem('headers');
    String msg = "";
    bool result = false;
    Response res =
        await post(Uri.parse(uriConnect + '/logout/'), headers: headers);
    print(res.statusCode);
    if (res.statusCode == 200) {
      result = true;
      print("logout success" + res.body);
    } else {
      print(res.body);
      msg = res.body;
    }
    return [result, msg];
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
