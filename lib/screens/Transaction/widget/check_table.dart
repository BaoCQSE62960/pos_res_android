import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_res_android/repos/models/check.dart';
import 'package:pos_res_android/repos/services/check_service.dart';
import 'package:pos_res_android/screens/Transaction/widget/list_checks.dart';

class CheckDatatable extends StatefulWidget {
  const CheckDatatable({Key? key}) : super(key: key);

  @override
  State<CheckDatatable> createState() => _CheckDatatableState();
}

class _CheckDatatableState extends State<CheckDatatable> {
  List<Check> checks = [];
  final CheckService service = Get.put(CheckService());

  Future checkList() async {
    checks = await service.getCheckList();
    return checks;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ViewListChecks(list: checks);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
