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

    Response res = await post(Uri.parse(uriConnect + '/login/pos'),
        headers: {"Content-Type": "application/json"}, body: body);

    if (res.statusCode == 200) {
      result = true;
      _updateCookie(res);
      msg = res.body;
    } else {
      msg = res.body;
    }

    return [result, msg];
  }

  //get image
  Future<String> getLogo() async {
    String result = "";
    Response res = await get(Uri.parse(uriConnect + '/login/'),
        headers: {"Content-Type": "application/json"});
    if (res.statusCode == 200) {
      result = jsonDecode(res.body)['restaurantimage'] as String;
    } else {
      return "";
    }
    return result;
  }

  //get shift
  Future<List<Shift>> getShifts() async {
    headers = storage.getItem('headers');
    Response res =
        await get(Uri.parse(uriConnect + '/login/shift/'), headers: headers);
    if (res.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(res.body);
      List<Shift> list = ListShift.fromJson(body['shiftList']).list;
      return list;
    } else {
      throw Exception('Failed to load shift');
    }
  }

  //cashier open
  Future open(int shiftId, num amount) async {
    headers = storage.getItem('headers');
    String msg = "";
    bool result = false;
    Map data = {"shiftid": shiftId, "amount": amount};
    var body = json.encode(data);

    Response res = await put(
        Uri.parse(uriConnect + '/login/cashieropen/$shiftId'),
        headers: headers,
        body: body);

    if (res.statusCode == 200) {
      result = true;
      msg = res.body;
    } else {
      msg = res.body;
    }

    return [result, msg];
  }

  //cashier close
  Future close(num amount) async {
    headers = storage.getItem('headers');
    String msg = "";
    bool result = false;
    Map data = {"amount": amount};
    var body = json.encode(data);

    Response res = await put(Uri.parse(uriConnect + '/logout/cashierclose/'),
        headers: headers, body: body);

    if (res.statusCode == 200) {
      result = true;
      msg = res.body;
    } else {
      msg = res.body;
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
      msg = res.body;
    } else {
      msg = res.body;
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
    if (res.statusCode == 200) {
      result = true;
    } else {
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
