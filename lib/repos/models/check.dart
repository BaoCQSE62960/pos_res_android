class Check {
  int id;
  DateTime creationtime;
  String checkno;
  String? tablename;
  String locationname;
  num totaltax;
  num totalamount;
  String status;

  Check({
    required this.id,
    required this.creationtime,
    required this.checkno,
    this.tablename,
    required this.locationname,
    required this.totaltax,
    required this.totalamount,
    required this.status,
  });

  factory Check.fromJson(Map<String, dynamic> json) {
    return Check(
      id: json['id'],
      creationtime: DateTime.parse(json['creationtime']),
      checkno: json['checkno'],
      tablename: json['tablename'],
      locationname: json['locationname'],
      totaltax: num.parse(json['totaltax']),
      totalamount: num.parse(json['totalamount']),
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class CheckItem {
  int id;
  DateTime creationtime;
  String shiftname;
  String checkno;
  String manageby;
  String? tablename;
  String locationname;
  String? voidreason;
  String? guestname;
  int? cover;
  String? note;
  num totaltax;
  num totalamount;
  String status;

  CheckItem({
    required this.id,
    required this.creationtime,
    required this.shiftname,
    required this.checkno,
    required this.manageby,
    this.tablename,
    required this.locationname,
    this.voidreason,
    this.guestname,
    this.cover,
    this.note,
    required this.totaltax,
    required this.totalamount,
    required this.status,
  });

  factory CheckItem.fromJson(Map<String, dynamic> json) {
    return CheckItem(
      id: json['id'],
      creationtime: DateTime.parse(json['creationtime']),
      shiftname: json['shiftname'],
      checkno: json['checkno'],
      manageby: json['manageby'],
      tablename: json['tablename'],
      locationname: json['locationname'],
      voidreason: json['voidreason'],
      guestname: json['guestname'],
      cover: json['cover'],
      note: json['note'],
      totaltax: num.parse(json['totaltax']),
      totalamount: num.parse(json['totalamount']),
      status: json["status"],
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

class ListCheckItemDetail {
  final List<CheckItem> list;
  ListCheckItemDetail({required this.list});

  factory ListCheckItemDetail.fromJson(List<dynamic> parseJson) {
    List<CheckItem> list = parseJson.map((e) => CheckItem.fromJson(e)).toList();
    return ListCheckItemDetail(list: list);
  }
}
