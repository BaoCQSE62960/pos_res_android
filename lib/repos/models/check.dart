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

class CheckSpecialRequest {
  String name;

  CheckSpecialRequest({
    required this.name,
  });

  factory CheckSpecialRequest.fromJson(Map<String, dynamic> json) {
    return CheckSpecialRequest(
      name: json['name'],
    );
  }
}

class CheckDetailModel {
  int id;
  String itemname;
  double quantity;
  String? note;
  num subtotal;
  num taxamount;
  num amount;
  String status;
  DateTime? completiontime;
  List<CheckSpecialRequest>? specialrequest;

  CheckDetailModel({
    required this.id,
    required this.itemname,
    required this.quantity,
    this.note,
    required this.subtotal,
    required this.taxamount,
    required this.amount,
    required this.status,
    this.completiontime,
    this.specialrequest,
  });

  factory CheckDetailModel.fromJson(Map<String, dynamic> json) {
    return CheckDetailModel(
      id: json['id'],
      itemname: json['itemname'],
      quantity: double.parse(json['quantity'].toString()),
      note: json['note'],
      subtotal: num.parse(json['subtotal']),
      taxamount: num.parse(json['taxamount']),
      amount: num.parse(json['amount']),
      status: json["status"],
      completiontime: json['completiontime'] != null
          ? DateTime.parse(json['completiontime'])
          : null,
      specialrequest:
          ListCheckSpecialRequest.fromJson(json["specialrequest"]).list,
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

class ListCheckDetailInfo {
  final List<CheckDetailModel> list;
  ListCheckDetailInfo({required this.list});

  factory ListCheckDetailInfo.fromJson(List<dynamic> parseJson) {
    List<CheckDetailModel> list =
        parseJson.map((e) => CheckDetailModel.fromJson(e)).toList();
    return ListCheckDetailInfo(list: list);
  }
}

class ListCheckSpecialRequest {
  final List<CheckSpecialRequest>? list;
  ListCheckSpecialRequest({required this.list});

  factory ListCheckSpecialRequest.fromJson(List<dynamic> parseJson) {
    List<CheckSpecialRequest> list =
        parseJson.map((e) => CheckSpecialRequest.fromJson(e)).toList();
    return ListCheckSpecialRequest(list: list);
  }
}
