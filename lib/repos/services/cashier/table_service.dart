import 'package:pos_res_android/repos/models/cashier/location.dart';
import 'package:pos_res_android/repos/models/cashier/table.dart';
import 'package:pos_res_android/repos/repository/cashier/table_repository.dart';

class TableService {
  TableRepository repos = TableRepository();

  Future<List<Location>> getLocations() async {
    return repos.getLocations();
  }

  Future<List<Table>> getLocationTable(int locationId) async {
    return repos.getLocationTable(locationId);
  }
}
