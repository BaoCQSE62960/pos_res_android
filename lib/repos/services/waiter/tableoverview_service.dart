import 'package:pos_res_android/repos/models/waiter/tableoverview.dart';

abstract class TableOverviewService {
  Future<TableOverview> getTableOverviewByLocationID(String locationID);
}
