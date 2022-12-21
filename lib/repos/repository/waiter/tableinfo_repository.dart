import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/repos/models/waiter/tableinfo.dart';
import 'package:pos_res_android/repos/services/waiter/tableinfo_service.dart';

class TableInfoRepositoryImpl extends TableInfoService {
  String uriConnect = uri;
  final LocalStorage storage = LocalStorage('cookie');
  Map<String, String> headers = {"content-type": "application/json"};

  @override
  Future<TableInfo> getTableInfoByCheckID(String checkID) async {
    headers = storage.getItem('headers');
    http.Response response = await http.get(
        Uri.parse(uriConnect + "/order/check/" + checkID + "/info/"),
        headers: headers);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return TableInfo.fromJson(responseJson);
    } else {
      throw Exception('Failed to load table info');
    }
  }

  @override
  Future<http.Response> updateTableInfoByCheckID(
      String checkID, TableInfo tableInfo) async {
    headers = storage.getItem('headers');
    var body = json.encode(tableInfo.toJson());
    http.Response response = await http.put(
        Uri.parse(uriConnect + "/order/check/" + checkID + "/info/"),
        headers: headers,
        body: body);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to update table info');
    }
  }
}
