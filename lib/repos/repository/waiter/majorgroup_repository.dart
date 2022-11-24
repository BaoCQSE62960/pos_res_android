import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:http/http.dart' as http;
import 'package:easy_localization/easy_localization.dart';
import 'package:pos_res_android/repos/models/waiter/majorgroup.dart';
import 'package:pos_res_android/repos/services/waiter/majorgroup_service.dart';

class MajorGroupRepositoryImpl extends MajorGroupService {
  String uriConnect = uri;
  final LocalStorage storage = LocalStorage('cookie');
  Map<String, String> headers = {"content-type": "application/json"};

  @override
  Future<List<MajorGroup>> getMajorGroups() async {
    headers = storage.getItem('headers');
    http.Response response = await http
        .get(Uri.parse(uriConnect + "/order/majorgroup/"), headers: headers);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      List<MajorGroup> majorGroups =
          (responseJson as List).map((e) => MajorGroup.fromJson(e)).toList();
      majorGroups.insert(0, MajorGroup(id: 0, name: 'order.all'.tr()));
      return majorGroups;
    } else {
      throw Exception('Failed to load major group');
    }
  }
}
