class Check {
  // final DateInputElement date;
  String date;
  String checkNo;
  String tableName;
  String locationName;
  int tax;
  int total;
  String status;

  Check({
    required this.date,
    required this.checkNo,
    required this.tableName,
    required this.locationName,
    required this.tax,
    required this.total,
    required this.status,
  });
}

var checks = <Check>[
  Check(
      date: "19/12/2020",
      checkNo: "4512786",
      tableName: "A1",
      locationName: "Sảnh A",
      tax: 50000000,
      total: 550000000,
      status: "Hoạt động"),
  Check(
      date: "19/10/2022",
      checkNo: "456",
      tableName: "L1-01",
      locationName: "Lầu 1",
      tax: 72000,
      total: 792000,
      status: "Hoạt động"),
  Check(
      date: "19/12/2021",
      checkNo: "523",
      tableName: "L2-01",
      locationName: "Lầu 2",
      tax: 50000,
      total: 550000,
      status: "Hoạt động"),
  Check(
      date: "19/11/2020",
      checkNo: "896",
      tableName: "B3",
      locationName: "Sảnh B",
      tax: 100000,
      total: 1100000,
      status: "Hủy"),
  Check(
      date: "29/12/2020",
      checkNo: "451542",
      tableName: "A2",
      locationName: "Sảnh A",
      tax: 6300,
      total: 69300,
      status: "Đóng"),
  Check(
      date: "20/12/2020",
      checkNo: "27845",
      tableName: "A5",
      locationName: "Sảnh A",
      tax: 50000,
      total: 550000,
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
