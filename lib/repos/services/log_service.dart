import 'package:pos_res_android/repos/models/log.dart';
import 'package:pos_res_android/repos/repository/cashier_log_repository.dart';

class CashierLogService {
  CashierLogRepository repos = CashierLogRepository();
  Future<List<CashierLog>> getCashierLogList() async {
    return repos.getCashierLogList();
  }

  Future<List<CashierLogItem>> getCashierLogAmount(int logId) async {
    return repos.getCashierLogAmount(logId);
  }

  Future putCashierLogAmount(int logId, num amount) async {
    return repos.putCashierLogAmount(logId, amount);
  }
}
