import 'package:pos_res_android/repos/models/waiter/menu.dart';

abstract class MenuService {
  Future<List<Menu>> getMenu();
}
