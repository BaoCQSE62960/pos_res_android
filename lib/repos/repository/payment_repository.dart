// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:http/http.dart';
import 'package:pos_res_android/repos/models/payment.dart';

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

  // cookie
  final LocalStorage storage = LocalStorage('cookie');
}
