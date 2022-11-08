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
      date: json['date'],
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['checklist'] = list;
    return data;
  }
}

// var checks = <Check>[
//   Check(
//       id: 1,
//       date: DateTime.utc(2020, 12, 19),
//       checkno: "2012191",
//       tablename: "A1",
//       locationname: "Sảnh A",
//       totaltax: 50000000,
//       totalamount: 550000000,
//       status: "Hoạt động"),
//   Check(
//       id: 2,
//       // date: DateTime.parse("formattedString"),
//       date: DateTime.utc(2022, 10, 19),
//       checkno: "1910221",
//       tablename: "L1-01",
//       locationname: "Lầu 1",
//       totaltax: 72000,
//       totalamount: 792000,
//       status: "Hoạt động"),
//   Check(
//       id: 3,
//       date: DateTime.utc(2021, 12, 19),
//       checkno: "19122131",
//       tablename: "L2-01",
//       locationname: "Lầu 2",
//       totaltax: 50000,
//       totalamount: 550000,
//       status: "Hoạt động"),
//   Check(
//       id: 4,
//       date: DateTime.utc(2020, 11, 19),
//       checkno: "1911203",
//       tablename: "B3",
//       locationname: "Sảnh B",
//       totaltax: 100000,
//       totalamount: 1100000,
//       status: "Hủy"),
//   Check(
//       id: 5,
//       date: DateTime.utc(2020, 12, 29),
//       checkno: "2912202",
//       tablename: "A2",
//       locationname: "Sảnh A",
//       totaltax: 6300,
//       totalamount: 69300,
//       status: "Đóng"),
//   Check(
//       id: 6,
//       date: DateTime.utc(2020, 12, 20),
//       checkno: "2012203",
//       tablename: "A5",
//       locationname: "Sảnh A",
//       totaltax: 50000,
//       totalamount: 550000,
//       status: "Đóng"),
// ];

  // factory Check.fromJson(Map<String, dynamic> json) => Check(
  //       date: json['date'],
  //       checkNo: json['checkNo'],
  //       tableName: json['tableName'],
  //       locationName: json['locationName'],
  //       tax: json['tax'],
  //       total: json['total'],
  //       status: json['status'],
  //     );

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is Check &&
  //         runtimeType == other.runtimeType &&
  //         date == other.date &&
  //         checkNo == other.checkNo &&
  //         tableName == other.tableName &&
  //         locationName == other.locationName &&
  //         tax == other.tax &&
  //         total == other.total &&
  //         status == other.status;

  // @override
  // int get hashCode =>
  //     date.hashCode ^
  //     checkNo.hashCode ^
  //     tableName.hashCode ^
  //     locationName.hashCode ^
  //     tax.hashCode ^
  //     total.hashCode ^
  //     status.hashCode;
