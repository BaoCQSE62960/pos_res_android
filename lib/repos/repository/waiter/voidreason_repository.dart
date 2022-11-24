import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/repos/models/waiter/voidreason.dart';
import 'package:pos_res_android/repos/services/waiter/voidreason_service.dart';
import 'package:http/http.dart' as http;

class VoidReasonRepositoryImpl extends VoidReasonService {
  String uriConnect = uri;
  final LocalStorage storage = LocalStorage('cookie');
  Map<String, String> headers = {"content-type": "application/json"};

  @override
  Future<List<VoidReason>> getVoidReason() async {
    headers = storage.getItem('headers');
    http.Response response = await http
        .get(Uri.parse(uriConnect + "/order/voidreason"), headers: headers);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return (responseJson as List).map((e) => VoidReason.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load menu');
    }
  }
}
