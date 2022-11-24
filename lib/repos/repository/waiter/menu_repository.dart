import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:http/http.dart' as http;
import 'package:pos_res_android/repos/models/waiter/menu.dart';
import 'package:pos_res_android/repos/services/waiter/menu_service.dart';

class MenuRepositoryImpl extends MenuService {
  String uriConnect = uri;
  final LocalStorage storage = LocalStorage('cookie');
  Map<String, String> headers = {"content-type": "application/json"};

  @override
  Future<List<Menu>> getMenu() async {
    headers = storage.getItem('headers');
    http.Response response = await http
        .get(Uri.parse(uriConnect + "/order/menu/"), headers: headers);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      List<Menu> menus =
          (responseJson as List).map((e) => Menu.fromJson(e)).toList();
      // menus.insert(0, Menu(id: 0, name: 'order.all'.tr(), isdefault: true));
      return menus;
    } else {
      throw Exception('Failed to load menu');
    }
  }
}
