import 'package:easy_localization/easy_localization.dart';

class Bill {
  int id;
  DateTime date;
  String billno;
  String tablename;
  String locationname;
  num totaltax;
  num totalamount;
  String status;

  Bill({
    required this.id,
    required this.date,
    required this.billno,
    required this.tablename,
    required this.locationname,
    required this.totaltax,
    required this.totalamount,
    required this.status,
  });

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      id: json['id'],
      date: DateFormat('yyyy-MM-ddTHH:mm:ss.SSSZ').parse(json['creationtime']),
      billno: json['billno'],
      tablename: json['tablename'],
      locationname: json['locationname'],
      totaltax: num.parse(json['totaltax']),
      totalamount: num.parse(json['totalamount']),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class BillItem {
  int id;
  int checkid;
  DateTime creationtime;
  String billno;
  String? guestname;
  num subtotal;
  num totaltax;
  num totalamount;
  String? note;
  String status;

  BillItem({
    required this.id,
    required this.checkid,
    required this.creationtime,
    required this.billno,
    this.guestname,
    required this.subtotal,
    required this.totaltax,
    required this.totalamount,
    this.note,
    required this.status,
  });

  factory BillItem.fromJson(Map<String, dynamic> json) {
    return BillItem(
      id: json['id'],
      checkid: json['checkid'],
      creationtime: DateTime.parse(json['creationtime']),
      billno: json['billno'],
      guestname: json['guestname'],
      subtotal: num.parse(json['subtotal']),
      totaltax: num.parse(json['totaltax']),
      totalamount: num.parse(json['totalamount']),
      note: json['note'],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class ListBill {
  final List<Bill> list;
  ListBill({required this.list});

  factory ListBill.fromJson(List<dynamic> parseJson) {
    List<Bill> list = parseJson.map((e) => Bill.fromJson(e)).toList();
    return ListBill(list: list);
  }
}

class ListBillItemDetail {
  final List<BillItem> list;
  ListBillItemDetail({required this.list});

  factory ListBillItemDetail.fromJson(List<dynamic> parseJson) {
    List<BillItem> list = parseJson.map((e) => BillItem.fromJson(e)).toList();
    return ListBillItemDetail(list: list);
  }
}
