import 'package:http/http.dart' as http;
import 'package:pos_res_android/repos/models/waiter/tableinfo.dart';

abstract class TableInfoService {
  Future<TableInfo> getTableInfoByCheckID(String checkID);
  Future<http.Response> updateTableInfoByCheckID(
      String checkID, TableInfo tableInfo);
}
