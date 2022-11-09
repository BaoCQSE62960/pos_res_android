import 'package:pos_res_android/repos/models/cashier/table.dart';

class TableOverview {
  TableOverview({required this.locationid, required this.listTable});

  final String locationid;
  final List<TableDetail> listTable;

  static TableOverview EMPTY =
      TableOverview(locationid: '0', listTable: const []);

  factory TableOverview.fromJson(Map<String, dynamic> json) => TableOverview(
      locationid: json['locationId'],
      listTable: (json['tables'] as List)
          .map((e) => TableDetail.fromJson(e))
          .toList());
}
