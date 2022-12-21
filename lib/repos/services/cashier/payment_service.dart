import 'package:flutter/cupertino.dart';
import 'package:pos_res_android/repos/models/cashier/payment.dart';
import 'package:pos_res_android/repos/repository/cashier/payment_repository.dart';

class PaymentService {
  PaymentRepository repos = PaymentRepository();
  Future<List<Payment>> getPaymentMethodList() async {
    return repos.getPaymentMethodList();
  }

  Future<bool> processCheck(
      int checkId, List<PaymentProcess> paymentList, BuildContext context) {
    return repos.processCheck(checkId, paymentList, context);
  }
}
