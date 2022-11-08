import 'dart:convert';

import 'package:pos_res_android/repos/models/specialrequests.dart';
import 'package:pos_res_android/repos/services/specialrequests_service.dart';
import 'package:http/http.dart' as http;

class SpecialRequestsRepositoryImpl extends SpecialRequestsService {
  @override
  Future<List<SpecialRequests>> getSpecialRequestsByItemId(String id) async {
    http.Response response = await http
        .get(Uri.parse("http://10.0.2.2:5000/order/view/specialrequest/" + id));
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
