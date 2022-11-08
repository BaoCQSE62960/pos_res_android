import 'package:pos_res_android/repos/models/item.dart';
import 'package:pos_res_android/repos/models/tableinfo.dart';
import 'package:http/http.dart' as http;

abstract class TableInfoService {
  Future<TableInfo> getTableInfoByCheckID(String checkID);
  Future<http.Response> updateTableInfoByCheckID(
      String checkID, TableInfo tableInfo);
}
