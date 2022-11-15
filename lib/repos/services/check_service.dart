import 'package:pos_res_android/repos/models/check.dart';
import 'package:pos_res_android/repos/repository/check_repository.dart';

class CheckService {
  CheckRepository repos = CheckRepository();
  Future<List<Check>> getCheckList() async {
    return repos.getCheckList();
  }

  Future<List<CheckItem>> getCheckItem(int checkId) async {
    return repos.getCheckItem(checkId);
  }
}
