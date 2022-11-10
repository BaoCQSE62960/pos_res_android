import 'package:easy_localization/easy_localization.dart';

class Check {
  int id;
  DateTime date;
  String checkno;
  String tablename;
  String locationname;
  int totaltax;
  int totalamount;
  String status;

  Check({
    required this.id,
    required this.date,
    required this.checkno,
    required this.tablename,
    required this.locationname,
    required this.totaltax,
    required this.totalamount,
    required this.status,
  });

  factory Check.fromJson(Map<String, dynamic> json) {
    return Check(
      id: json['id'],
      date: DateFormat('yyyy-MM-ddTHH:mm:ss.SSSZ').parse(json['creationtime']),
      checkno: json['checkno'],
      tablename: json['tablename'],
      locationname: json['locationname'],
      totaltax: json['totaltax'],
      totalamount: json['totalamount'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class ListCheck {
  final List<Check> list;
  ListCheck({required this.list});

  factory ListCheck.fromJson(List<dynamic> parseJson) {
    List<Check> list = parseJson.map((e) => Check.fromJson(e)).toList();
    return ListCheck(list: list);
  }
}
