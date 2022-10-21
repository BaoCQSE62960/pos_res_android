import 'package:flutter/material.dart';

class CheckDatatable extends StatefulWidget {
  const CheckDatatable({Key? key}) : super(key: key);

  @override
  State<CheckDatatable> createState() => _CheckDatatableState();
}

class _CheckDatatableState extends State<CheckDatatable> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Ngày',
              style: TextStyle(
                // fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Mã hóa đơn',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Bàn',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Khu vực',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Thuế',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Tổng thanh toán',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Trạng thái',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          // selected: false,
          cells: <DataCell>[
            DataCell(
              SizedBox(
                width: 80,
                child: Text('19/12/2020'),
              ),
            ),
            DataCell(
              SizedBox(
                width: 100,
                child: Text('4512786'),
              ),
            ),
            DataCell(
              SizedBox(
                width: 30,
                child: Text('A1'),
              ),
            ),
            DataCell(
              SizedBox(
                width: 60,
                child: Text('Sảnh A'),
              ),
            ),
            DataCell(
              SizedBox(
                width: 75,
                child: Text('50.000.000'),
              ),
            ),
            DataCell(
              SizedBox(
                width: 90,
                child: Text('550.000.000'),
              ),
            ),
            DataCell(
              SizedBox(
                width: 80,
                child: Text('Hoạt động'),
              ),
            ),
          ],
        ),
        // DataRow(
        //   cells: <DataCell>[
        //     DataCell(Text('Janine')),
        //     DataCell(Text('43')),
        //     DataCell(Text('Professor')),
        //   ],
        // ),
      ],
    );
  }
}
