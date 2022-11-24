import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/repos/models/waiter/specialrequests.dart';
import 'package:pos_res_android/repos/services/waiter/specialrequests_service.dart';

class SpecialRequestsRepositoryImpl extends SpecialRequestsService {
  String uriConnect = uri;
  final LocalStorage storage = LocalStorage('cookie');
  Map<String, String> headers = {"content-type": "application/json"};

  @override
  Future<List<SpecialRequests>> getSpecialRequestsByItemId(String id) async {
    headers = storage.getItem('headers');
    http.Response response = await http.get(
        Uri.parse(uriConnect + "/order/view/specialrequest/" + id),
        headers: headers);
    var responseJson = json.decode(response.body);
    var specialRequest = (responseJson as Map)['specialrequest'];
    if (response.statusCode == 200) {
      List<SpecialRequests> specialRequests = (specialRequest as List)
          .map((e) => SpecialRequests.fromJson(e))
          .toList();
      return specialRequests;
    } else {
      throw Exception('Failed to load menu');
    }
  }
}
