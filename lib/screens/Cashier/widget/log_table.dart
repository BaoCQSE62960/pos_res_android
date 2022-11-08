import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/log.dart';

class LogDatatable extends StatefulWidget {
  const LogDatatable({Key? key}) : super(key: key);

  @override
  State<LogDatatable> createState() => _LogDatatableState();
}

class _LogDatatableState extends State<LogDatatable> {
  List logFilter = [];
  final newFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

  @override
  void initState() {
    setState(() {
      logFilter = logs;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - defaultPadding * 8,
          width: MediaQuery.of(context).size.width - defaultPadding * 5,
          child: DataTable(
              columns: const [
                DataColumn(
                  label: Text(
                    'Tên thu ngân',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Ca làm việc',
                    style: TextStyle(
                      // fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Thời gian tạo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Loại',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Tổng tiền',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // numeric: true,
                ),
              ],
              rows: logFilter
                  .map(
                    (logFilter) => DataRow(
                      cells: [
                        DataCell(Text(logFilter.fullname)),
                        DataCell(Text(logFilter.shiftname)),
                        DataCell(
                            Text(newFormat.format(logFilter.creationtime))),
                        DataCell(Text(logFilter.type)),
                        DataCell(
                          TextFormField(
                            initialValue: logFilter.amount.toString(),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            onFieldSubmitted: (val) {
                              print('onSubmited $val');
                              FocusScope.of(context).unfocus();
                            },
                            onEditingComplete: () {},
                            onSaved: ((newValue) => {}),
                          ),
                          showEditIcon: true,
                        ),
                      ],
                    ),
                  )
                  .toList()),
        ),
      ],
    );
  }
}
