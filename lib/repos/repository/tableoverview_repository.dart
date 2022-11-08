import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pos_res_android/repos/models/tableoverview.dart';
import 'package:pos_res_android/repos/services/tableoverview_service.dart';

class TableOverviewRepositoryImpl extends TableOverviewService {
  @override
  Future<TableOverview> getTableOverviewByLocationID(String locationID) async {
    http.Response response = await http.get(
        Uri.parse("http://10.0.2.2:5000/tableoverview/location/" + locationID));
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return TableOverview.fromJson(responseJson);
    } else {
      throw Exception('Failed to load menu');
    }
  }
}
