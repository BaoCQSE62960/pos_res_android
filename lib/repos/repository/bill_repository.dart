// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/repos/models/bill.dart';
import 'package:http/http.dart';

class BillRepository {
  String uriConnect = uri;

  Future<List<Bill>> getBillList() async {
    Map<String, String> headers = storage.getItem('headers');
    Response res = await get(Uri.parse(uriConnect + '/search/billlist/'),
        headers: headers);

    List<Bill> list = [];
    if (res.statusCode == 200) {
      print('Get bill list successful');
      List<dynamic> body = jsonDecode(res.body);
      list = ListBill.fromJson(body).list;
      return list;
    } else {
      throw Exception('cautch at getBillList');
    }
  }

  Future<List<BillItem>> getBillItem(int billId) async {
    Map<String, String> headers = storage.getItem('headers');
    Response res = await get(Uri.parse(uriConnect + '/search/bill/$billId'),
        headers: headers);

    if (res.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(res.body);
      print('Get bill item successful');
      List<BillItem> list = ListBillItemDetail.fromJson([body]).list;
      print('Map bill item successful');
      return list;
    } else {
      throw Exception('cautch at getBillItem');
    }
  }

  Future<List<BillDetailModel>> getBillDetail(int billId) async {
    Map<String, String> headers = storage.getItem('headers');
    Response res = await get(
        Uri.parse(uriConnect + '/search/bill/$billId/detail'),
        headers: headers);

    if (res.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(res.body);
      print('Get bill detail successful');
      List<BillDetailModel> list =
          ListBillDetailInfo.fromJson(body['billdetail']).list;
      print('Map bill detail successful');
      return list;
    } else {
      throw Exception('cautch at getBillItem');
    }
  }

  Future<List<BillPayment>> getBillPayment(int billId) async {
    Map<String, String> headers = storage.getItem('headers');
    Response res = await get(
        Uri.parse(uriConnect + '/search/bill/$billId/payment'),
        headers: headers);

    if (res.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(res.body);
      print('Get bill payment successful');
      List<BillPayment> list =
          ListBillPayment.fromJson(body['paymentdetail']).list;
      print('Map bill payment successful');
      return list;
    } else {
      throw Exception('cautch at getBillPayment');
    }
  }

  Future refund(int billId) async {
    Map<String, String> headers = storage.getItem('headers');
    String msg = "";
    bool result = false;
    Map data = {"billid": billId};
    var body = json.encode(data);

    print(body);
    Response res = await post(
        Uri.parse(uriConnect + '/orderprocess/bill/refund/'),
        headers: headers,
        body: body);

    print(res.statusCode);
    if (res.statusCode == 200) {
      result = true;
      print("refund success" + res.body);
      msg = res.body;
    } else {
      msg = res.body;
      print("msg: " + msg);
    }

    return [result, msg];
  }

  // cookie
  final LocalStorage storage = LocalStorage('cookie');
}
