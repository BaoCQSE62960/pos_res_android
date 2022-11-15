// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/repos/models/check.dart';
import 'package:http/http.dart';

class CheckRepository {
  String uriConnect = uri;

  Future<List<Check>> getCheckList() async {
    Map<String, String> headers = storage.getItem('headers');
    Response res = await get(Uri.parse(uriConnect + '/search/checklist/'),
        headers: headers);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      print('Get check list successful');
      List<Check> list = ListCheck.fromJson(body).list;
      print('Map check list successful');
      return list;
    } else {
      throw Exception('cautch at getCheckList');
    }
  }

  Future<List<CheckItem>> getCheckItem(int checkId) async {
    Map<String, String> headers = storage.getItem('headers');
    Response res = await get(Uri.parse(uriConnect + '/search/check/$checkId'),
        headers: headers);

    if (res.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(res.body);
      print('Get check item successful');
      List<CheckItem> list = ListCheckItemDetail.fromJson([body]).list;
      print('Map check item successful');
      return list;
    } else {
      throw Exception('cautch at getCheckItem');
    }
  }

  // cookie
  final LocalStorage storage = LocalStorage('cookie');
}
