import 'package:http/http.dart' as http;
import 'package:pos_res_android/repos/models/waiter/dto/splitCheckDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/transferCheckDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/transferTableDTO.dart';
import 'package:pos_res_android/repos/models/waiter/tableoverview.dart';

abstract class TableOverviewService {
  Future<TableOverview> getTableOverviewByLocationID(String locationID);
  Future<http.Response> transferCheck(TransferCheckDTO transferCheckDTO);
  Future<http.Response> splitCheck(SplitCheckDTO splitCheckDTO);
  Future<http.Response> transferTable(TransferTableDTO transferTableDTO);
}
