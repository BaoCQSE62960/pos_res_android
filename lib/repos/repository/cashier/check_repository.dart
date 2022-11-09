import 'dart:convert';

import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/repos/models/cashier/check.dart';

class CheckRepository {
  String uriConnect = uri;

  Future<List<Check>> getCheckList() async {
    headers = storage.getItem('headers');

    @override
    Response res = await get(Uri.parse(uriConnect + '/search/checklist/'),
        headers: headers);
    if (res.statusCode == 200) {
      // ignore: avoid_print
      print('Get check list successful');
      print("res:" + res.body);
      Map<String, dynamic> body = jsonDecode(res.body);
      List<Check> list = ListCheck.fromJson(body['checkList']).list;
      return list;
    } else {
      throw Exception('Failed to load check list');
      // print('Failed to load shift ' + res.body);
      // return [];
    }
  }

  // cookie
  final LocalStorage storage = LocalStorage('cookie');
  Map<String, String> headers = {"content-type": "application/json"};
}
