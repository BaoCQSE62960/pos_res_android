import 'package:flutter/material.dart';
import 'package:pos_res_android/repos/transaction/models/check.dart';
import 'package:pos_res_android/repos/transaction/utils.dart';

class CheckDatatable extends StatefulWidget {
  const CheckDatatable({Key? key}) : super(key: key);

  @override
  State<CheckDatatable> createState() => _CheckDatatableState();
}

class _CheckDatatableState extends State<CheckDatatable> {
  List<Check> checks = [];
  List<Check> selectedChecks = [];

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final checks = await Utils.loadChecks();

    setState(() => this.checks = checks);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: buildDataTable(),
      );

  Widget buildDataTable() {
    final columns = [
      'Ngày',
      'Mã hóa đơn',
      'Bàn',
      'Khu vực',
      'Thuế',
      'Tổng thanh toán',
      'Trạng thái'
    ];

    return DataTable(
      onSelectAll: (isSelectedAll) {
        setState(() => selectedChecks = isSelectedAll! ? checks : []);

        Utils.showSnackBar(context, 'All Selected: $isSelectedAll');
      },
      columns: getColumns(columns),
      rows: getRows(checks),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
          ))
      .toList();

  List<DataRow> getRows(List<Check> checks) => checks
      .map((Check check) => DataRow(
            selected: selectedChecks.contains(check),
            onSelectChanged: (isSelected) => setState(() {
              final isAdding = isSelected != null && isSelected;

              isAdding
                  ? selectedChecks.add(check)
                  : selectedChecks.remove(check);
            }),
            cells: [
              // DataCell(FlagWidget(code: check.code)),
              DataCell(SizedBox(
                width: 80,
                // child: Text(check.date.toString()),
                child: Text(check.date),
              )),
              DataCell(SizedBox(
                width: 100,
                child: Text(check.checkNo),
              )),
              DataCell(SizedBox(
                width: 30,
                child: Text(check.tableName),
              )),
              DataCell(SizedBox(
                width: 60,
                child: Text(check.locationName),
              )),
              DataCell(SizedBox(
                width: 75,
                child: Text(check.tax.toString()),
              )),
              DataCell(SizedBox(
                width: 90,
                child: Text(check.total.toString()),
              )),
              DataCell(SizedBox(
                width: 80,
                child: Text(check.status),
              )),
            ],
          ))
      .toList();

  Widget buildSubmit() => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        color: Colors.black,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            minimumSize: const Size.fromHeight(40),
          ),
          child: Text('Select ${selectedChecks.length} Checks'),
          onPressed: () {
            final checkNos =
                selectedChecks.map((check) => check.checkNo).join(', ');

            Utils.showSnackBar(context, 'Selected checks: $checkNos');
          },
        ),
      );
  // DataTable(
  //   columns: const <DataColumn>[
  //     DataColumn(
  //       label: Expanded(
  //         child: Text(
  //           'Ngày',
  //           style: TextStyle(
  //             // fontStyle: FontStyle.italic,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //     ),
  //     DataColumn(
  //       label: Expanded(
  //         child: Text(
  //           'Mã hóa đơn',
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //     ),
  //     DataColumn(
  //       label: Expanded(
  //         child: Text(
  //           'Bàn',
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //     ),
  //     DataColumn(
  //       label: Expanded(
  //         child: Text(
  //           'Khu vực',
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //     ),
  //     DataColumn(
  //       label: Expanded(
  //         child: Text(
  //           'Thuế',
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //     ),
  //     DataColumn(
  //       label: Expanded(
  //         child: Text(
  //           'Tổng thanh toán',
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //     ),
  //     DataColumn(
  //       label: Expanded(
  //         child: Text(
  //           'Trạng thái',
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //     ),
  //   ],
  //   rows: const <DataRow>[
  //     DataRow(
  //       // selected: false,
  //       cells: <DataCell>[
  //         DataCell(
  //           SizedBox(
  //             width: 80,
  //             child: Text('19/12/2020'),
  //           ),
  //         ),
  //         DataCell(
  //           SizedBox(
  //             width: 100,
  //             child: Text('4512786'),
  //           ),
  //         ),
  //         DataCell(
  //           SizedBox(
  //             width: 30,
  //             child: Text('A1'),
  //           ),
  //         ),
  //         DataCell(
  //           SizedBox(
  //             width: 60,
  //             child: Text('Sảnh A'),
  //           ),
  //         ),
  //         DataCell(
  //           SizedBox(
  //             width: 75,
  //             child: Text('50.000.000'),
  //           ),
  //         ),
  //         DataCell(
  //           SizedBox(
  //             width: 90,
  //             child: Text('550.000.000'),
  //           ),
  //         ),
  //         DataCell(
  //           SizedBox(
  //             width: 80,
  //             child: Text('Hoạt động'),
  //           ),
  //         ),
  //       ],
  //     ),
  //     // DataRow(
  //     //   cells: <DataCell>[
  //     //     DataCell(Text('Janine')),
  //     //     DataCell(Text('43')),
  //     //     DataCell(Text('Professor')),
  //     //   ],
  //     // ),
  //   ],
  // );
}
