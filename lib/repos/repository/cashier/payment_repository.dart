import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/common/widgets/warning_popup.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:http/http.dart';
import 'package:pos_res_android/repos/models/cashier/payment.dart';
import 'package:pos_res_android/repos/models/waiter/checkdetail.dart';
import 'package:pos_res_android/screens/Order/order.dart';

class PaymentRepository {
  String uriConnect = uri;

  Future<List<Payment>> getPaymentMethodList() async {
    Map<String, String> headers = storage.getItem('headers');
    Response res = await get(Uri.parse(uriConnect + '/order/paymentmethod/'),
        headers: headers);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Payment> list = ListPaymentMethod.fromJson(body).list;
      return list;
    } else {
      throw Exception('cautch at getPaymentMethodList');
    }
  }

  Future<bool> processCheck(int checkId, List<PaymentProcess> paymentList,
      BuildContext context) async {
    final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
    List<CheckDetail> list = orderBloc.state.check.checkDetail;
    bool confirm = true;
    for (var checkDetail in list) {
      if (checkDetail.status != "SERVED") {
        confirm = false;
      }
    }
    if (confirm) {
      Map<String, String> headers = storage.getItem('headers');
      Map<String, dynamic> data = <String, dynamic>{};
      data['checkid'] = checkId.toString();
      data['paymentlist'] = paymentList.map((e) => e.toJson()).toList();
      String body = jsonEncode(data);
      Response res = await post(
          Uri.parse(uriConnect + '/orderprocess/check/process/'),
          headers: headers,
          body: body);
      if (res.statusCode == 200) {
        return true;
      } else {
        Map<String, dynamic> body = jsonDecode(res.body);
        _simpleFailDialog(context, body['msg']);
        return false;
      }
    } else {
      _simpleFailDialog(context, 'Đơn vẫn còn món chưa xử lý!');
      return false;
    }
  }

  Future<void> _simpleFailDialog(BuildContext context, String msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WarningPopUp(msg: msg);
      },
    );
  }

  // cookie
  final LocalStorage storage = LocalStorage('cookie');
}
