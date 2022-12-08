import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:http/http.dart';
import 'package:pos_res_android/repos/models/cashier/check.dart';

class CheckRepository {
  String uriConnect = uri;

  Future<List<Check>> getCheckList() async {
    Map<String, String> headers = storage.getItem('headers');
    Response res = await get(Uri.parse(uriConnect + '/search/checklist/'),
        headers: headers);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Check> list = ListCheck.fromJson(body).list;
      return list;
    } else {
      throw Exception('cautch at getCheckList');
    }
  }

  Future<List<CheckItem>> getCheckItem(int checkId) async {
    Map<String, String> headers = storage.getItem('headers');
    Response res = await get(Uri.parse(uriConnect + '/search/check/$checkId'),
        headers: headers);

    if (res.statusCode == 200) {
      if (res.body.isNotEmpty) {
        Map<String, dynamic> body = jsonDecode(res.body);
        List<CheckItem> list = ListCheckItemDetail.fromJson([body]).list;
        return list;
      } else {
        List<CheckItem> list = [];
        return list;
      }
    } else {
      throw Exception('cautch at getCheckItem');
    }
  }

  Future<List<CheckDetailModel>> getCheckDetail(int checkId) async {
    Map<String, String> headers = storage.getItem('headers');
    Response res = await get(
        Uri.parse(uriConnect + '/search/check/$checkId/detail'),
        headers: headers);

    if (res.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(res.body);
      List<CheckDetailModel> list =
          ListCheckDetailInfo.fromJson(body['checkdetail']).list;
      return list;
    } else {
      throw Exception('cautch at getCheckItem');
    }
  }

  // cookie
  final LocalStorage storage = LocalStorage('cookie');
}
