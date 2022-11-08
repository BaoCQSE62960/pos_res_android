import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pos_res_android/repos/models/check.dart';
import 'package:pos_res_android/repos/services/check_service.dart';

class CheckRepositoryImpl extends CheckService {
  @override
  Future<Check> getCheckByID(String id) async {
    http.Response response =
        await http.get(Uri.parse("http://10.0.2.2:5000/order/check/" + id));
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return Check.fromJson(responseJson);
    } else {
      throw Exception('Failed to load menu');
    }
  }
}

class CheckRepository {
  String uriConnect = uri;

  Future<List<Check>> getCheckList() async {
    headers = storage.getItem('headers');

    @override
    Response res = await get(Uri.parse(uriConnect + '/search/checklist/'),
        headers: headers);
    if (res.statusCode == 200) {
      // ignore: avoid_print
      print('Get check list successful');
      print("res:" + res.body);
      Map<String, dynamic> body = jsonDecode(res.body);
      List<Check> list = ListCheck.fromJson(body['checkList']).list;
      return list;
    } else {
      throw Exception('Failed to load check list');
      // print('Failed to load shift ' + res.body);
      // return [];
    }
  }

  // cookie
  final LocalStorage storage = LocalStorage('cookie');
  Map<String, String> headers = {"content-type": "application/json"};
}