import 'dart:convert';

import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/repos/models/majorgroup.dart';
import 'package:pos_res_android/repos/services/majorgroup_service.dart';
import 'package:http/http.dart' as http;

class MajorGroupRepositoryImpl extends MajorGroupService {
  String uriConnect = uri;
  @override
  Future<List<MajorGroup>> getMajorGroups() async {
    http.Response response =
        await http.get(Uri.parse(uriConnect + "/order/majorgroup/"));
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return (responseJson as List).map((e) => MajorGroup.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load major group');
    }
  }
}
