import 'package:pos_res_android/repos/models/waiter/checkdetail.dart';

class Check {
  Check(
      {required this.checkid,
      required this.checkno,
      required this.subtotal,
      required this.totaltax,
      required this.totalamount,
      required this.creationtime,
      required this.locationid,
      required this.tableid,
      required this.checkDetail});

  final int checkid;
  final String checkno;
  int subtotal;
  int totaltax;
  int totalamount;
  final String creationtime;
  final int locationid;
  final int tableid;
  final List<CheckDetail> checkDetail;

  static Check EMPTY = Check(
      checkid: 0,
      checkno: '',
      subtotal: 0,
      totaltax: 0,
      totalamount: 0,
      creationtime: '',
      locationid: 0,
      tableid: 0,
      checkDetail: []);

  factory Check.fromJson(Map<String, dynamic> json) => Check(
      checkid: json['check']['checkid'],
      checkno: json['check']['checkno'],
      subtotal: int.parse(json['check']['subtotal']),
      totaltax: int.parse(json['check']['totaltax']),
      totalamount: int.parse(json['check']['totalamount']),
      creationtime: json['check']['creationtime'],
      locationid: json['check']['locationid'],
      tableid: json['check']['tableid'],
      checkDetail: (json['check']['checkdetail'] as List)
          .map((e) => CheckDetail.fromJson(e))
          .toList());
}
