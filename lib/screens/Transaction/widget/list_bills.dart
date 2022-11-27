import 'package:data_table_2/data_table_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/bill.dart';
import 'package:pos_res_android/repos/services/cashier/bill_service.dart';
import 'package:pos_res_android/screens/Bill/bill_detail_screen.dart';
import 'package:pos_res_android/screens/Transaction/widget/bill_tab.dart';

class ViewListBills extends StatefulWidget {
  final List<Bill> list;
  const ViewListBills({Key? key, required this.list}) : super(key: key);

  @override
  State<ViewListBills> createState() => _ViewListBillsState();
}

class _ViewListBillsState extends State<ViewListBills> {
  final List<bool> _selectedStatus = <bool>[false, false];
  final List<String> selectedStatus = <String>["CLOSED", "REFUND"];
  final BillService service = Get.put(BillService());

  List<Bill> bills = [];
  List<Bill> billFilter = [];
  List<BillItem> billItem = [];
  List<BillDetailModel> billDetail = [];
  List<BillPayment> billPayment = [];

  String statusFilter = "";
  String msg = "";
  final newFormat = DateFormat('yyyy-MM-dd');
  final moneyFormat = NumberFormat.decimalPattern('vi_VN');

  List<Widget> status = <Widget>[
    const Text('Đóng'),
    const Text('Hoàn tiền'),
  ];

  Future getBillItemDetail(int billId) async {
    billItem = await service.getBillItem(billId);
    return billItem;
  }

  Future getBillDetailInfo(int billId) async {
    billDetail = await service.getBillDetail(billId);
    return billDetail;
  }

  Future getBillPayment(int billId) async {
    billPayment = await service.getBillPayment(billId);
    return billPayment;
  }

  @override
  void initState() {
    super.initState();
    bills = widget.list;
    billFilter = bills;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: textLightColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: defaultPadding * 3,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: defaultPadding * 0.25,
                    right: defaultPadding * 0.25,
                  ),
                  child: BillTab(),
                ),
                // decoration: const BoxDecoration(
                //   border: Border(
                //     right: BorderSide(color: primaryColor),
                //   ),
                // ),
              ),
              SizedBox(
                // width: MediaQuery.of(context).size.width / 5 +
                //     defaultPadding * 5.55,
                width: MediaQuery.of(context).size.width / 3,
                height: defaultPadding * 3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: defaultPadding * 0.25,
                    left: defaultPadding * 0.5,
                    top: defaultPadding * 0.25,
                    bottom: defaultPadding * 0.25,
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
                      hintText: "Mã thanh toán",
                    ),
                    onChanged: (String input) {
                      setState(
                        () {
                          billFilter = bills
                              .where(
                                  (element) => element.billno.contains(input))
                              .toList();
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: defaultPadding * 0.5,
                  left: defaultPadding * 0.25,
                ),
                child: ToggleButtons(
                  onPressed: (int index) {
                    setState(
                      () {
                        for (int i = 0; i < _selectedStatus.length; i++) {
                          _selectedStatus[i] = i == index;
                          statusFilter = selectedStatus[index];
                          if (i == _selectedStatus.length) {
                            statusFilter = "";
                          }
                        }

                        billFilter = bills
                            .where((element) =>
                                element.status.contains(statusFilter))
                            .toList();
                      },
                    );
                  },
                  selectedBorderColor: activeColor,
                  selectedColor: textColor,
                  fillColor: selectColor,
                  color: textColor,
                  borderColor: primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  constraints: const BoxConstraints(
                    minHeight: defaultPadding * 2,
                    // minWidth: defaultPadding * 9.75,
                    minWidth: defaultPadding * 13.5,
                  ),
                  isSelected: _selectedStatus,
                  children: status,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - defaultPadding * 8,
          width: MediaQuery.of(context).size.width - defaultPadding * 5,
          child: DataTable2(
              columns: const [
                DataColumn(
                  label: Text(
                    'Ngày',
                    style: TextStyle(
                      // fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Mã thanh toán',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Bàn',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Khu vực',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Thuế',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  numeric: true,
                ),
                DataColumn(
                  label: Text(
                    'Thành tiền',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  numeric: true,
                ),
                DataColumn(
                  label: Text(
                    'Trạng thái',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
              rows: billFilter.map(
                (billFilter) {
                  String statusShow = billFilter.status;
                  if (statusShow == 'REFUND') {
                    statusShow = 'Hoàn tiền';
                  } else if (statusShow == 'CLOSED') {
                    statusShow = 'Đóng';
                  }
                  return DataRow(
                    cells: [
                      DataCell(Text(newFormat.format(billFilter.date))),
                      DataCell(Text(billFilter.billno)),
                      DataCell(Text(billFilter.tablename)),
                      DataCell(Text(billFilter.locationname)),
                      DataCell(Text(
                          moneyFormat.format(billFilter.totaltax.round()))),
                      DataCell(Text(
                          moneyFormat.format(billFilter.totalamount.round()))),
                      DataCell(Text(statusShow)),
                    ],
                    onLongPress: () async {
                      billItem = await getBillItemDetail(billFilter.id);
                      billDetail = await getBillDetailInfo(billFilter.id);
                      billPayment = await getBillPayment(billFilter.id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return BillDetailScreen(
                              listBill: billItem,
                              listDetail: billDetail,
                              listPayment: billPayment,
                            );
                          },
                        ),
                      );
                      // }
                    },
                  );
                },
              ).toList()),
        ),
      ],
    );
  }
}
