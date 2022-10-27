class Check {
  // final DateInputElement date;
  String note;
  String checkno;
  String tablename;
  String locationname;
  int totaltax;
  int totalamount;
  String status;

  Check({
    required this.note,
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
      note: "19/12/2020",
      checkno: "1912201",
      tablename: "A1",
      locationname: "Sảnh A",
      totaltax: 50000000,
      totalamount: 550000000,
      status: "Hoạt động"),
  Check(
      note: "19/10/2022",
      checkno: "1910221",
      tablename: "L1-01",
      locationname: "Lầu 1",
      totaltax: 72000,
      totalamount: 792000,
      status: "Hoạt động"),
  Check(
      note: "19/12/2021",
      checkno: "19122131",
      tablename: "L2-01",
      locationname: "Lầu 2",
      totaltax: 50000,
      totalamount: 550000,
      status: "Hoạt động"),
  Check(
      note: "19/11/2020",
      checkno: "1911203",
      tablename: "B3",
      locationname: "Sảnh B",
      totaltax: 100000,
      totalamount: 1100000,
      status: "Hủy"),
  Check(
      note: "29/12/2020",
      checkno: "2912202",
      tablename: "A2",
      locationname: "Sảnh A",
      totaltax: 6300,
      totalamount: 69300,
      status: "Đóng"),
  Check(
      note: "20/12/2020",
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
