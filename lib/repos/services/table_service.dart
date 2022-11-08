import 'package:pos_res_android/repos/models/location.dart';
import 'package:pos_res_android/repos/repository/table_repository.dart';

class TableService {
  TableRepository repos = TableRepository();

  Future<List<Location>> getLocations() async {
    return repos.getLocations();
  }

  Future<List> getLocationTable(int locationId) async {
    return repos.getLocationTable(locationId);
  }
}
