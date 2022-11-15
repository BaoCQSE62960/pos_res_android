import 'package:pos_res_android/repos/models/bill.dart';
import 'package:pos_res_android/repos/repository/bill_repository.dart';

class BillService {
  BillRepository repos = BillRepository();
  Future<List<Bill>> getBillList() async {
    return repos.getBillList();
  }

  Future<List<BillItem>> getBillItem(int billId) async {
    return repos.getBillItem(billId);
  }
}
