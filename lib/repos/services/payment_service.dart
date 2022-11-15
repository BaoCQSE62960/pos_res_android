import 'package:pos_res_android/repos/models/payment.dart';
import 'package:pos_res_android/repos/repository/payment_repository.dart';

class PaymentService {
  PaymentRepository repos = PaymentRepository();
  Future<List<Payment>> getPaymentMethodList() async {
    return repos.getPaymentMethodList();
  }
}
