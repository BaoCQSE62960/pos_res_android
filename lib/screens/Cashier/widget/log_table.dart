import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_res_android/repos/models/cashier/log.dart';
import 'package:pos_res_android/repos/services/cashier/log_service.dart';
import 'package:pos_res_android/screens/Cashier/widget/list_logs.dart';

class LogDatatable extends StatefulWidget {
  const LogDatatable({Key? key}) : super(key: key);

  @override
  State<LogDatatable> createState() => _LogDatatableState();
}

class _LogDatatableState extends State<LogDatatable> {
  final CashierLogService service = Get.put(CashierLogService());
  List<CashierLog> logs = [];

  Future cashierLogList() async {
    logs = await service.getCashierLogList();
    return logs;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: cashierLogList(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ViewListCashierLog(list: logs);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
