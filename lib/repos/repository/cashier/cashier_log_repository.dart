import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:http/http.dart';
import 'package:pos_res_android/repos/models/cashier/log.dart';

class CashierLogRepository {
  String uriConnect = uri;

  Future<List<CashierLog>> getCashierLogList() async {
    Map<String, String> headers = storage.getItem('headers');
    Response res =
        await get(Uri.parse(uriConnect + '/cashierlog/'), headers: headers);

    if (res.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(res.body);
      List<CashierLog> list = ListCashierLog.fromJson(body['list']).list;
      return list;
    } else {
      throw Exception('cautch at getCashierLogList');
    }
  }

  Future<List<CashierLogItem>> getCashierLogAmount(int logId) async {
    Map<String, String> headers = storage.getItem('headers');
    Response res = await get(Uri.parse(uriConnect + '/cashierlog/$logId'),
        headers: headers);

    if (res.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(res.body);
      List<CashierLogItem> list = CashierLogAmount.fromJson([body]).list;
      return list;
    } else {
      throw Exception('cautch at getCashierLogAmount');
    }
  }

  Future putCashierLogAmount(int logId, num amount) async {
    Map<String, String> headers = storage.getItem('headers');
    String msg = "";
    bool result = false;

    Map data = {"id": logId, "amount": amount};
    var body = json.encode(data);

    Response res = await put(Uri.parse(uriConnect + '/cashierlog/$logId'),
        headers: headers, body: body);

    if (res.statusCode == 200) {
      result = true;
      msg = res.body;
    } else {
      msg = res.body;
    }
    return [result, msg];
  }

  // cookie
  final LocalStorage storage = LocalStorage('cookie');
}
