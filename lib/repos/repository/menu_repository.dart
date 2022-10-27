import 'dart:convert';

import 'package:pos_res_android/repos/models/menu.dart';
import 'package:http/http.dart' as http;
import 'package:pos_res_android/repos/services/menu_service.dart';

class MenuRepositoryImpl extends MenuService {
  @override
  Future<List<Menu>> getMenu() async {
    http.Response response =
        await http.get(Uri.parse("http://10.0.2.2:5000/order/menu/"));
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return (responseJson as List).map((e) => Menu.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load menu');
    }
  }
}
