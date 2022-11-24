import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/repos/models/waiter/item.dart';
import 'package:pos_res_android/repos/services/waiter/item_service.dart';

class ItemRepositoryImpl extends ItemService {
  String uriConnect = uri;
  final LocalStorage storage = LocalStorage('cookie');
  Map<String, String> headers = {"content-type": "application/json"};

  @override
  Future<List<Item>> getItemByMenuID(String menuid) async {
    headers = storage.getItem('headers');
    http.Response response = await http
        .get(Uri.parse(uriConnect + "/order/menu/" + menuid), headers: headers);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return (responseJson as List).map((e) => Item.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load menu');
    }
  }
}
