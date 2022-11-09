import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/repos/models/waiter/tableoverview.dart';
import 'package:pos_res_android/repos/services/waiter/tableoverview_service.dart';

class TableOverviewRepositoryImpl extends TableOverviewService {
  String uriConnect = uri;

  @override
  Future<TableOverview> getTableOverviewByLocationID(String locationID) async {
    http.Response response = await http
        .get(Uri.parse(uriConnect + "/tableoverview/location/" + locationID));
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return TableOverview.fromJson(responseJson);
    } else {
      throw Exception('Failed to load menu');
    }
  }
}
