// ignore_for_file: avoid_print

import 'package:http/http.dart';
import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/repos/models/location.dart';
import 'package:pos_res_android/repos/models/table.dart';

class TableRepository {
  String uriConnect = uri;

  //get location
  Future<List<Location>> getLocations() async {
    headers = storage.getItem('headers');
    Response res =
        await get(Uri.parse(uriConnect + '/tableoverview/'), headers: headers);
    if (res.statusCode == 200) {
      print('Get location successful');
      List<dynamic> body = jsonDecode(res.body);
      List<Location> list = ListLocation.fromJson(body).list;
      return list;
    } else {
      throw Exception('Failed to load location');
    }
  }

  //get location table
  Future<List> getLocationTable(int locationId) async {
    headers = storage.getItem('headers');
    Response res = await get(
        Uri.parse(uriConnect + '/tableoverview/location/$locationId'),
        headers: headers);
    if (res.statusCode == 200) {
      print('Get location table successful');
      Map<String, dynamic> body = jsonDecode(res.body);
      String locationId = body[0];
      List<Table> listTable = ListTable.fromJson(body[1]).list;
      return [locationId, listTable];
    } else {
      throw Exception('Failed to load location table');
    }
  }

  // cookie
  final LocalStorage storage = LocalStorage('cookie');
  Map<String, String> headers = {"content-type": "application/json"};
}