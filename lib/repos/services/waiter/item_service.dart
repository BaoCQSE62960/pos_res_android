import 'package:pos_res_android/repos/models/waiter/item.dart';

abstract class ItemService {
  Future<List<Item>> getItemByMenuID(String menuid);
}
