import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/repos/models/waiter/dto/openTableDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/splitCheckDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/transferCheckDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/transferTableDTO.dart';
import 'package:pos_res_android/repos/models/waiter/tableoverview.dart';
import 'package:pos_res_android/repos/services/waiter/tableoverview_service.dart';

class TableOverviewRepositoryImpl extends TableOverviewService {
  String uriConnect = uri;
  final LocalStorage storage = LocalStorage('cookie');
  Map<String, String> headers = {"content-type": "application/json"};

  @override
  Future<TableOverview> getTableOverviewByLocationID(String locationID) async {
    headers = storage.getItem('headers');
    http.Response response = await http.get(
      Uri.parse(uriConnect + "/tableoverview/location/" + locationID),
      headers: headers,
    );
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return TableOverview.fromJson(responseJson);
    } else {
      throw Exception('Failed to load menu');
    }
  }

  @override
  Future<http.Response> transferCheck(TransferCheckDTO transferCheckDTO) async {
    headers = storage.getItem('headers');
    var body = json.encode(transferCheckDTO.toJson());
    http.Response response = await http.put(
        Uri.parse(uriConnect + "/transferdetail/transfer/item"),
        headers: headers,
        body: body);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to transfer table');
    }
  }

  @override
  Future<http.Response> transferTable(TransferTableDTO transferTableDTO) async {
    headers = storage.getItem('headers');
    var body = json.encode(transferTableDTO.toJson());
    http.Response response = await http.put(
        Uri.parse(uriConnect + '/tableoverview/transfer/table'),
        headers: headers,
        body: body);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to transfer table');
    }
  }

  @override
  Future<OpenTableDTO> openTable(int tableId) async {
    headers = storage.getItem('headers');
    http.Response response = await http.put(
        Uri.parse(
            uriConnect + "/tableoverview/open/table/" + tableId.toString()),
        headers: headers);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return OpenTableDTO.fromJson(responseJson);
    } else {
      throw Exception('Failed to open table.');
    }
  }

  @override
  Future<http.Response> splitCheck(SplitCheckDTO splitCheckDTO) async {
    headers = storage.getItem('headers');
    var body = json.encode(splitCheckDTO.toJson());
    http.Response response = await http.put(
        Uri.parse(uriConnect + "/transferdetail/transfer/percent"),
        headers: headers,
        body: body);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to transfer table');
    }
  }
}
