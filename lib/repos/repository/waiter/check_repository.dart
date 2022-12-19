import 'dart:convert';

import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/repos/models/waiter/dto/checkDTO.dart';
import 'package:pos_res_android/repos/models/waiter/check.dart';
import 'package:pos_res_android/repos/models/waiter/dto/openTableDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/voidreasonDTO.dart';
import 'package:pos_res_android/repos/services/waiter/check_service.dart';
import 'package:http/http.dart' as http;

class CheckRepositoryImpl extends CheckService {
  String uriConnect = uri;
  final LocalStorage storage = LocalStorage('cookie');
  Map<String, String> headers = {"content-type": "application/json"};

  @override
  Future<Check> getCheckByID(String id) async {
    headers = storage.getItem('headers');
    Response response = await get(Uri.parse(uriConnect + "/order/check/" + id),
        headers: headers);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return Check.fromJson(responseJson);
    }
    if (response.statusCode == 400) {
      return Check.EMPTY;
    } else {
      throw Exception('Failed to get check.');
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
  Future<Response> updateCheck(CheckDTO checkDTO) async {
    headers = storage.getItem('headers');
    var body = json.encode(checkDTO.toJson());
    Response response = await post(Uri.parse(uriConnect + "/order/check/add"),
        headers: headers, body: body);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to update check info');
    }
  }

  @override
  Future<Response> voidCheck(int id, VoidReasonDTO voidReasonDTO) async {
    headers = storage.getItem('headers');
    var body = json.encode(voidReasonDTO.toJson());
    Response response = await put(
        Uri.parse(uriConnect + "/order/check/" + id.toString() + "/void"),
        headers: headers,
        body: body);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to void a check.');
    }
  }

  @override
  Future<Response> voidCheckDetail(int id, VoidReasonDTO voidReasonDTO) async {
    headers = storage.getItem('headers');
    var body = json.encode(voidReasonDTO.toJson());
    Response response = await put(
        Uri.parse(uriConnect + "/order/checkdetail/" + id.toString() + "/void"),
        headers: headers,
        body: body);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to void a checkd detail.');
    }
  }

  @override
  Future<Response> servedCheckDetail(int id) async {
    headers = storage.getItem('headers');
    Response response = await put(
        Uri.parse(uriConnect + "/order/detail/" + id.toString() + "/served"),
        headers: headers);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to void a checkd detail.');
    }
  }

  @override
  Future<Response> remindCheckDetail(int id) async {
    headers = storage.getItem('headers');
    Response response = await put(
        Uri.parse(uriConnect + "/order/detail/" + id.toString() + "/remind"),
        headers: headers);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to remind a check detail.');
    }
  }

  @override
  Future<int> getTaxValue() async {
    headers = storage.getItem('headers');
    Response response =
        await get(Uri.parse(uriConnect + "/order/taxvalue/"), headers: headers);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return responseJson['taxvalue'];
    } else {
      throw Exception('Failed to get tax value detail.');
    }
  }
}
