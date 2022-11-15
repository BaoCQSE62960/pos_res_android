import 'package:pos_res_android/repos/models/cashier/table.dart';

class TableOverview {
  TableOverview({required this.listTable});

  final List<TableDetail> listTable;

  static TableOverview EMPTY = TableOverview(listTable: const []);

  factory TableOverview.fromJson(Map<String, dynamic> json) => TableOverview(
      listTable: (json['tables'] as List)
          .map((e) => TableDetail.fromJson(e))
          .toList());
}
