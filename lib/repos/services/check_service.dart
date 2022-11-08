import 'package:pos_res_android/repos/models/check.dart';
import 'package:pos_res_android/repos/repository/check_repository.dart';
import 'package:http/http.dart' as http;
import 'package:pos_res_android/repos/models/dto/checkDTO.dart';


class CheckService {
  CheckRepository repos = CheckRepository();
  Future<List<Check>> getCheckList() async {
    return repos.getCheckList();
  }
  Future<http.Response> updateCheck(CheckDTO checkDTO);
}
