import 'dart:convert';

import 'package:pos_res_android/config/routes.dart';
import 'package:http/http.dart' as http;
import 'package:easy_localization/easy_localization.dart';
import 'package:pos_res_android/repos/models/waiter/menu.dart';
import 'package:pos_res_android/repos/services/waiter/menu_service.dart';

class MenuRepositoryImpl extends MenuService {
  String uriConnect = uri;
  @override
  Future<List<Menu>> getMenu() async {
    http.Response response =
        await http.get(Uri.parse(uriConnect + "/order/menu/"));
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      List<Menu> menus =
          (responseJson as List).map((e) => Menu.fromJson(e)).toList();
      menus.insert(0, Menu(id: 0, name: 'order.all'.tr(), isdefault: true));
      return menus;
    } else {
      throw Exception('Failed to load menu');
    }
  }
}
