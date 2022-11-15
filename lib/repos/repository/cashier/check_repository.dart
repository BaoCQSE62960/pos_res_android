import 'dart:convert';

import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/repos/models/cashier/check.dart';

class CheckRepository {
  String uriConnect = uri;

  Future<List<Check>> getCheckList() async {
    Map<String, String> headers = storage.getItem('headers');
    Response res = await get(Uri.parse(uriConnect + '/search/checklist/'),
        headers: headers);

    List<Check> list = [];
    if (res.statusCode == 200) {
      print('Get check list successful');
      List<dynamic> body = jsonDecode(res.body);
      list = ListCheck.fromJson(body).list;
      return list;
    } else {
      throw Exception('cautch at getCheckList');
    }
  }

  // cookie
  final LocalStorage storage = LocalStorage('cookie');
}
