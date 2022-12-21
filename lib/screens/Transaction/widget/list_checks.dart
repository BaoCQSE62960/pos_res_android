import 'package:data_table_2/data_table_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/check.dart';
import 'package:pos_res_android/repos/services/cashier/check_service.dart';
import 'package:pos_res_android/repos/services/login_service.dart';
import 'package:pos_res_android/screens/Order/order.dart';
import 'package:pos_res_android/screens/Transaction/widget/transaction_tab.dart';

class ViewListChecks extends StatefulWidget {
  final List<Check> list;
  const ViewListChecks({Key? key, required this.list}) : super(key: key);

  @override
  State<ViewListChecks> createState() => _ViewListChecksState();
}

class _ViewListChecksState extends State<ViewListChecks> {
  final List<bool> _selectedStatus = <bool>[false, false, false];
  final List<String> selectedStatus = <String>["ACTIVE", "VOID", "CLOSED"];
  final CheckService service = Get.put(CheckService());

  List currentUserRole = [];
  List<Check> checks = [];
  List<Check> checkFilter = [];

  String statusFilter = "";
  String loginMsg = "";
  final newFormat = DateFormat('yyyy-MM-dd');
  final moneyFormat = NumberFormat.decimalPattern('vi_VN');

  List<Widget> status = <Widget>[
    const Text('Hoạt động'),
    const Text('Hủy'),
    const Text('Đóng'),
  ];

  Future getCurrentUserRole() async {
    LoginService service = LoginService();
    currentUserRole = await service.getRole();
    return currentUserRole;
  }

  @override
  void initState() {
    super.initState();
    checks = widget.list;
    checkFilter = checks;
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
                  child: TransactionTab(),
                ),
              ),
              SizedBox(
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
                      hintText: "Mã hóa đơn",
                    ),
                    onChanged: (String input) {
                      setState(
                        () {
                          checkFilter = checks
                              .where(
                                  (element) => element.checkno.contains(input))
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
                    setState(() {
                      for (int i = 0; i < _selectedStatus.length; i++) {
                        _selectedStatus[i] = i == index;
                        statusFilter = selectedStatus[index];
                        checkFilter = checks
                            .where((element) =>
                                element.status.contains(statusFilter))
                            .toList();
                      }
                    });
                  },
                  selectedBorderColor: activeColor,
                  selectedColor: textColor,
                  fillColor: selectColor,
                  color: textColor,
                  borderColor: primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  constraints: const BoxConstraints(
                    minHeight: defaultPadding * 2,
                    minWidth: defaultPadding * 9,
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Mã hóa đơn',
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
              rows: checkFilter.map((checkFilter) {
                String statusShow = checkFilter.status;
                String? tableNameShow = checkFilter.tablename;
                if (statusShow == 'ACTIVE') {
                  statusShow = 'Hoạt động';
                } else if (statusShow == 'VOID') {
                  statusShow = 'Hủy';
                } else if (statusShow == 'CLOSED') {
                  statusShow = 'Đóng';
                }
                tableNameShow ??= "";

                return DataRow(
                  cells: [
                    DataCell(Text(newFormat.format(checkFilter.creationtime))),
                    DataCell(Text(checkFilter.checkno)),
                    DataCell(Text(tableNameShow)),
                    DataCell(Text(checkFilter.locationname)),
                    DataCell(
                        Text(moneyFormat.format(checkFilter.totaltax.round()))),
                    DataCell(Text(
                        moneyFormat.format(checkFilter.totalamount.round()))),
                    DataCell(Text(statusShow)),
                  ],
                  onLongPress: () async {
                    currentUserRole = await getCurrentUserRole();
                    loginMsg = currentUserRole[1];

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return OrderScreen(
                            checkid: checkFilter.id,
                            loginMsg: loginMsg,
                          );
                        },
                      ),
                    );
                  },
                );
              }).toList()),
        ),
      ],
    );
  }
}
