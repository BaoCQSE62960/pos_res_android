import 'package:pos_res_android/repos/models/cashier/bill.dart';
import 'package:pos_res_android/repos/repository/cashier/bill_repository.dart';

class BillService {
  BillRepository repos = BillRepository();
  Future<List<Bill>> getBillList() async {
    return repos.getBillList();
  }

  Future<List<BillItem>> getBillItem(int billId) async {
    return repos.getBillItem(billId);
  }

  Future<List<BillDetailModel>> getBillDetail(int billId) async {
    return repos.getBillDetail(billId);
  }

  Future<List<BillPayment>> getBillPayment(int billId) async {
    return repos.getBillPayment(billId);
  }

  Future refund(int billId) async {
    return repos.refund(billId);
  }
}
