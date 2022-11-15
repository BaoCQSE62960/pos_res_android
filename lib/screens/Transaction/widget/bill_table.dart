import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_res_android/repos/models/cashier/bill.dart';
import 'package:pos_res_android/repos/services/bill_service.dart';
import 'package:pos_res_android/screens/Transaction/widget/list_bills.dart';

class BillDatatable extends StatefulWidget {
  const BillDatatable({Key? key}) : super(key: key);

  @override
  State<BillDatatable> createState() => _BillDatatableState();
}

class _BillDatatableState extends State<BillDatatable> {
  List<Bill> bills = [];
  final BillService service = Get.put(BillService());

  Future checkList() async {
    bills = await service.getBillList();
    return bills;
  }

  // @override
  // void initState() {
  //   setState(() {});
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ViewListBills(list: bills);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
