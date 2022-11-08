class Bill {
  DateTime date;
  String billNo;
  String tableName;
  String locationName;
  int totaltax;
  int totalamount;
  String status;

  Bill({
    required this.date,
    required this.billNo,
    required this.tableName,
    required this.locationName,
    required this.totaltax,
    required this.totalamount,
    required this.status,
  });
}

var bills = <Bill>[
  Bill(
      date: DateTime.utc(2020, 12, 29),
      billNo: "2912202",
      tableName: "A2",
      locationName: "Sảnh A",
      totaltax: 6300,
      totalamount: 69300,
      status: "Hoàn tiền"),
  Bill(
      date: DateTime.utc(2020, 12, 20),
      billNo: "2012205",
      tableName: "A5",
      locationName: "Sảnh A",
      totaltax: 50000,
      totalamount: 550000,
      status: "Đóng"),
];
