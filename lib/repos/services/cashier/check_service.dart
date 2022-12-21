import 'package:pos_res_android/repos/models/cashier/check.dart';
import 'package:pos_res_android/repos/repository/cashier/check_repository.dart';

class CheckService {
  CheckRepository repos = CheckRepository();
  Future<List<Check>> getCheckList() async {
    return repos.getCheckList();
  }

  Future<List<CheckItem>> getCheckItem(int checkId) async {
    return repos.getCheckItem(checkId);
  }

  Future<List<CheckDetailModel>> getCheckDetail(int checkId) async {
    return repos.getCheckDetail(checkId);
  }
}
