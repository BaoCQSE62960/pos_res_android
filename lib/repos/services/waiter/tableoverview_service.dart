import 'package:http/http.dart' as http;
import 'package:pos_res_android/repos/models/waiter/dto/openTableDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/transferCheckDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/transferTableDTO.dart';
import 'package:pos_res_android/repos/models/waiter/tableoverview.dart';

abstract class TableOverviewService {
  Future<OpenTableDTO> openTable(int tableId);
  Future<TableOverview> getTableOverviewByLocationID(String locationID);
  Future<http.Response> transferCheck(TransferCheckDTO transferCheckDTO);
  Future<http.Response> transferTable(
      TransferTableDTO transferTableDTO, int currentTableID, int targetTableID);
}
