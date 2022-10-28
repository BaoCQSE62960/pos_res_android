import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pos_res_android/repos/transaction/models/check.dart';

class CheckController extends GetxController {
  static const apiBaseUrl = 'http://localhost:5000/';
  // static const apiBaseUrl = '';

  List<Check> listCheck = [];

  getCheck() async {
    listCheck = [];
    var url = Uri.parse(apiBaseUrl + 'search/checklist');
    List<Check> helperList = [];
    try {
      final response = await http.get(
        url,
      );

      if (response.statusCode == 200) {
        var checkResponse = json.decode(response.body);

        checkResponse['checkData'].forEach((result) => {
              helperList.add(Check(
                note: result['note'],
                checkno: result['checkno'],
                tablename: result['tablename'],
                locationname: result['locationname'],
                totaltax: result['totaltax'],
                totalamount: result['totalamount'],
                status: result['status'],
              ))
            });
      }
      listCheck.addAll(helperList);
      update();
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }
}
