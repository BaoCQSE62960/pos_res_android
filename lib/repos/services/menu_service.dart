import 'package:pos_res_android/repos/models/menu.dart';

abstract class MenuService {
  Future<List<Menu>> getMenu();
}
