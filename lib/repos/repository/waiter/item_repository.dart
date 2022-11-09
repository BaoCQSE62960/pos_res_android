import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/repos/models/waiter/item.dart';
import 'package:pos_res_android/repos/services/waiter/item_service.dart';

class ItemRepositoryImpl extends ItemService {
  String uriConnect = uri;

  @override
  Future<List<Item>> getItemByMenuID(String menuid) async {
    http.Response response =
        await http.get(Uri.parse(uriConnect + "/order/menu/" + menuid));
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return (responseJson as List).map((e) => Item.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load menu');
    }
  }
}
