import 'package:pos_res_android/repos/models/payment.dart';
import 'package:pos_res_android/repos/repository/cashier/payment_repository.dart';

class PaymentService {
  PaymentRepository repos = PaymentRepository();
  Future<List<Payment>> getPaymentMethodList() async {
    return repos.getPaymentMethodList();
  }

  Future<bool> processCheck(int checkId, List<PaymentProcess> paymentList) {
    return repos.processCheck(checkId, paymentList);
  }
}
