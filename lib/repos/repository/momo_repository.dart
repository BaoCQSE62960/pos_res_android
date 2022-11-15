// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/repos/models/momo.dart';
import 'package:http/http.dart';

class MomoRepository {
  String uriConnect = uriMomo;

  Future<List<Momo>> getMomoItem() async {
    Map<String, String> headers = storage.getItem('headers');
    Response res = await post(Uri.parse(uriConnect), headers: headers);

    if (res.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(res.body);
      print('Get Momo item successful');
      List<Momo> list = ListMomo.fromJson([body]).list;
      print('Map Momo item successful');
      return list;
    } else {
      throw Exception('cautch at getMomoItem');
    }
  }

  // cookie
  final LocalStorage storage = LocalStorage('cookie');

  Future<String> getMomoPayment(String amount) async {
    String url = '';
    Map<String, String> headers = {"content-type": "application/json"};
    Map<String, dynamic> data = <String, dynamic>{};
    Map<String, dynamic> result = <String, dynamic>{};
    String ACCESS_KEY = "WehkypIRwPP14mHb";
    String SECRET_KEY = "3fq8h4CqAAPZcTTb3nCDpFKwEkQDsZzz";

    String partnerCode = 'MOMODJMX20220717';
    String requestId = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
    String orderId = requestId;
    String orderInfo = 'Thanh toán MoMo';
    String redirectUrl = googleLink;
    String ipnUrl = youtubeLink;
    String requestType = 'captureWallet';
    String extraData = '';
    String lang = 'vi';

    String convert =
        'accessKey=$ACCESS_KEY&amount=$amount&extraData=$extraData&ipnUrl=$ipnUrl&orderId=$orderId&orderInfo=$orderInfo&partnerCode=$partnerCode&redirectUrl=$redirectUrl&requestId=$requestId&requestType=$requestType';
    var key = utf8.encode(SECRET_KEY);
    var byte = utf8.encode(convert);
    var hmac256 = Hmac(sha256, key);
    String signature = hmac256.convert(byte).toString();
    print(requestId);
    print('signature: $signature');

    data = {
      "partnerCode": partnerCode,
      "requestId": requestId,
      "amount": amount,
      "orderId": orderId,
      "orderInfo": orderInfo,
      "redirectUrl": redirectUrl,
      "ipnUrl": ipnUrl,
      "requestType": requestType,
      "extraData": extraData,
      "lang": lang,
      "signature": signature
    };

    String json = jsonEncode(data);
    Response res = await post(Uri.parse(uriMomo), headers: headers, body: json);
    if (res.statusCode == 200) {
      result = jsonDecode(res.body);
      if (result['resultCode'] == 0) {
        url = result['payUrl'];
        print(url);
      } else {
        print('result khác 0');
      }
    } else {
      print('Status code khác 200');
    }
    return url;
  }
}
