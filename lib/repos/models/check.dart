class Check {
  DateTime date;
  String checkno;
  String tablename;
  String locationname;
  int totaltax;
  int totalamount;
  String status;

  Check({
    required this.date,
    required this.checkno,
    required this.tablename,
    required this.locationname,
    required this.totaltax,
    required this.totalamount,
    required this.status,
  });
}

var checks = <Check>[
  Check(
      date: DateTime.utc(2020, 12, 19),
      checkno: "1912201",
      tablename: "A1",
      locationname: "Sảnh A",
      totaltax: 50000000,
      totalamount: 550000000,
      status: "Hoạt động"),
  Check(
      // date: DateTime.parse("formattedString"),
      date: DateTime.utc(2022, 10, 19),
      checkno: "1910221",
      tablename: "L1-01",
      locationname: "Lầu 1",
      totaltax: 72000,
      totalamount: 792000,
      status: "Hoạt động"),
  Check(
      date: DateTime.utc(2021, 12, 19),
      checkno: "19122131",
      tablename: "L2-01",
      locationname: "Lầu 2",
      totaltax: 50000,
      totalamount: 550000,
      status: "Hoạt động"),
  Check(
      date: DateTime.utc(2020, 11, 19),
      checkno: "1911203",
      tablename: "B3",
      locationname: "Sảnh B",
      totaltax: 100000,
      totalamount: 1100000,
      status: "Hủy"),
  Check(
      date: DateTime.utc(2020, 12, 29),
      checkno: "2912202",
      tablename: "A2",
      locationname: "Sảnh A",
      totaltax: 6300,
      totalamount: 69300,
      status: "Đóng"),
  Check(
      date: DateTime.utc(2020, 12, 20),
      checkno: "2012203",
      tablename: "A5",
      locationname: "Sảnh A",
      totaltax: 50000,
      totalamount: 550000,
      status: "Đóng"),
];

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
