import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pos_res_android/repos/models/tableinfo.dart';
import 'package:pos_res_android/repos/services/tableinfo_service.dart';

class TableInfoRepositoryImpl extends TableInfoService {
  @override
  Future<TableInfo> getTableInfoByCheckID(String checkID) async {
    http.Response response = await http.get(
        Uri.parse("http://10.0.2.2:5000/order/check/" + checkID + "/info/"));
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
    var body = json.encode(tableInfo.toJson());
    http.Response response = await http.put(
        Uri.parse("http://10.0.2.2:5000/order/check/" + checkID + "/info/"),
        headers: {
          "Content-Type": "application/json",
          "Cookie":
              "connect.sid=s%3AE5t9At-wFmzDNzbWXPNP_FoiLyBUDzpq.%2BNzso8HEoUfQwDVp4viwieuBtEdKQCb3slkJdu8pqow"
        },
        body: body);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to update table info');
    }
  }
}
