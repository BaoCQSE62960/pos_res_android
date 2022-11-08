import 'package:pos_res_android/repos/models/item.dart';

abstract class ItemService {
  Future<List<Item>> getItemByMenuID(String menuid);
}
