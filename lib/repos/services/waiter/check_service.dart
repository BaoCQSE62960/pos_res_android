import 'package:http/http.dart' as http;
import 'package:pos_res_android/repos/models/waiter/dto/checkDTO.dart';
import 'package:pos_res_android/repos/models/waiter/check.dart';
import 'package:pos_res_android/repos/models/waiter/dto/openTableDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/voidreasonDTO.dart';

abstract class CheckService {
  Future<OpenTableDTO> openTable(int tableId);
  Future<Check> getCheckByID(String id);
  Future<http.Response> updateCheck(CheckDTO checkDTO);
  Future<http.Response> voidCheck(int id, VoidReasonDTO voidReasonDTO);
  Future<http.Response> voidCheckDetail(int id, VoidReasonDTO voidReasonDTO);
  Future<http.Response> servedCheckDetail(int id);
  Future<http.Response> remindCheckDetail(int id);
}
