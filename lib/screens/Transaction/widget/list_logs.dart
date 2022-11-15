// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:data_table_2/data_table_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:get/get.dart';
import 'package:pos_res_android/common/widgets/web_view.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/log.dart';
import 'package:pos_res_android/repos/services/log_service.dart';
import 'package:pos_res_android/screens/Cashier/widget/update_amount_popup.dart';

class ViewListCashierLog extends StatefulWidget {
  final List<CashierLog> list;
  const ViewListCashierLog({Key? key, required this.list}) : super(key: key);

  @override
  State<ViewListCashierLog> createState() => _ViewListCashierLogState();
}

class _ViewListCashierLogState extends State<ViewListCashierLog> {
  // List<Momo> momo = [];
  // final MomoService momoService = Get.put(MomoService());

  // Future momoList() async {
  //   momo = await momoService.getMomoItem();
  //   return momo;
  // }

  final CashierLogService service = Get.put(CashierLogService());

  List<CashierLog> logs = [];
  List<CashierLog> logFilter = [];
  List<CashierLogItem> logItem = [];
  late int logId;
  String msg = "";
  int? sortColumnIndex;
  bool isAscending = false;
  final newFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

  Future<void> _updateAmount(CashierLog log) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AmountPopup(log: log);
      },
    );
  }

  Future getCashierLogItem(logId) async {
    logItem = await service.getCashierLogAmount(logId);
    return logItem;
  }

  @override
  void initState() {
    super.initState();
    logs = widget.list;
    logFilter = logs;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              // width: MediaQuery.of(context).size.width / 5 +
              //     defaultPadding * 5.55,
              width: MediaQuery.of(context).size.width / 3,
              height: defaultPadding * 3,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: defaultPadding * 0.5,
                  top: defaultPadding * 0.5,
                ),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  cursorColor: textColor,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: deactiveLightColor,
                    prefixIconColor: primaryColor,
                    contentPadding:
                        EdgeInsets.fromLTRB(defaultSize * 4, 0, 0, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Tên thu ngân",
                    // prefixIcon: Padding(
                    //   padding: EdgeInsets.all(defaultPadding),
                    //   child: Icon(Icons.lock),
                    // ),
                  ),
                  onChanged: (String input) {
                    setState(
                      () {
                        logFilter = logs
                            .where(
                                (element) => element.fullname.contains(input))
                            .toList();
                      },
                    );
                  },
                ),
              ),
            ),
            // Container(
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: activeColor,
            //       elevation: 0,
            //       shape: const StadiumBorder(),
            //       maximumSize: const Size(double.infinity, 56),
            //       minimumSize: const Size(double.infinity, 56),
            //     ),
            //     onPressed: () async {
            //       momo = await momoList();
            //       print(momo);
            //     },
            //     child: Text(
            //       "momo".toUpperCase(),
            //     ),
            //   ),
            // )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - defaultPadding * 5,
          width: MediaQuery.of(context).size.width - defaultPadding * 5,
          child: DataTable2(
              // PaginatedDataTable
              sortAscending: isAscending,
              sortColumnIndex: sortColumnIndex,
              columns: [
                const DataColumn(
                  label: Text(
                    'Tên thu ngân',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const DataColumn(
                  label: Text(
                    'Ca làm việc',
                    style: TextStyle(
                      // fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: const Text(
                    'Thời gian tạo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onSort: onSort,
                ),
                const DataColumn(
                  label: Text(
                    'Loại',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const DataColumn(
                  label: Text(
                    'Tổng tiền',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // numeric: true,
                ),
                const DataColumn(
                  label: Text(
                    'Hành động',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
              rows: logFilter.map(
                (logFilter) {
                  String typeShow = logFilter.type;
                  if (typeShow == 'OPEN') {
                    typeShow = 'Mở ca';
                  } else if (typeShow == 'CLOSED') {
                    typeShow = 'Đóng ca';
                  }
                  return DataRow(
                    cells: [
                      DataCell(Text(logFilter.fullname)),
                      DataCell(Text(logFilter.shiftname)),
                      DataCell(Text(newFormat.format(logFilter.creationtime))),
                      DataCell(Text(typeShow)),
                      DataCell(
                          // TextFormField(
                          //   initialValue: logs.amount.toString(),
                          //   keyboardType: TextInputType.number,
                          //   decoration: const InputDecoration(
                          //     border: InputBorder.none,
                          //   ),
                          //   onFieldSubmitted: (val) {
                          //     print('onSubmited $val');
                          //     FocusScope.of(context).unfocus();
                          //   },
                          //   onEditingComplete: () {},
                          //   onSaved: ((newValue) => {}),
                          // ),
                          Text(logFilter.amount.toString())
                          // showEditIcon: true,
                          ),
                      DataCell(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              // onPressed: () async {
                              //   logItem = await getCashierLogItem(logFilter.id);
                              //   await _updateAmount(logFilter);
                              //   setState(() {});
                              // },
                              onPressed: () async {
                                // PageView()
                                String url = await getPayUrl(
                                    logFilter.amount.toString());
                                bool result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return DisplayWebView(
                                        url: url,
                                      );
                                    },
                                  ),
                                );
                                // const DisplayWebView();
                              },
                              style: TextButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                backgroundColor: primaryColor,
                              ),
                              child: Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: defaultPadding * 0.25),
                                    child: Icon(
                                      Icons.edit,
                                      size: defaultSize * 5,
                                      color: textColor,
                                    ),
                                  ),
                                  Text(
                                    'Cập nhật',
                                    style: TextStyle(
                                      color: textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ).toList()),
        ),
      ],
    );
  }

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 2) {
      logFilter.sort((log1, log2) => compareString(
          ascending, '${log1.creationtime}', '${log2.creationtime}'));
    }

    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}

Future<String> getPayUrl(String amount) async {
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
  http.Response res =
      await post(Uri.parse(uriMomo), headers: headers, body: json);
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
