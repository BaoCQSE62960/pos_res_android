// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:http/http.dart';
import 'package:pos_res_android/repos/models/cashier/payment.dart';

class PaymentRepository {
  String uriConnect = uri;

  Future<List<Payment>> getPaymentMethodList() async {
    Map<String, String> headers = storage.getItem('headers');
    Response res = await get(Uri.parse(uriConnect + '/order/paymentmethod/'),
        headers: headers);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      print('Get payment method successful');
      List<Payment> list = ListPaymentMethod.fromJson(body).list;
      print('Map payment method successful');
      return list;
    } else {
      throw Exception('cautch at getPaymentMethodList');
    }
  }

  Future<bool> processCheck(
      int checkId, List<PaymentProcess> paymentList) async {
    Map<String, String> headers = storage.getItem('headers');

    Map<String, dynamic> data = <String, dynamic>{};
    data['checkid'] = checkId.toString();
    data['paymentlist'] = paymentList.map((e) => e.toJson()).toList();
    String body = jsonEncode(data);
    print(body);
    return true;
    // Response res = await post(
    //     Uri.parse(uriConnect + '/orderprocess/check/process/'),
    //     headers: headers,
    //     body: body);
    // if (res.statusCode == 200) {
    //   print('process check successful');
    //   return true;
    // } else {
    //   throw Exception('cautch at processCheck');
    // }
  }

  // cookie
  final LocalStorage storage = LocalStorage('cookie');
}
