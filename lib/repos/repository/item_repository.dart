import 'dart:convert';

import 'package:pos_res_android/repos/models/item.dart';
import 'package:http/http.dart' as http;
import 'package:pos_res_android/repos/services/item_service.dart';

class ItemRepositoryImpl extends ItemService {
  @override
  Future<List<Item>> getItemByMenuID(String menuid) async {
    http.Response response =
        await http.get(Uri.parse("http://10.0.2.2:5000/order/menu/" + menuid));
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return (responseJson as List).map((e) => Item.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load menu');
    }
  }
}
