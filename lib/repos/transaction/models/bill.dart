class Bill {
  // final DateInputElement date;
  String date;
  String billNo;
  String tableName;
  String locationName;
  int tax;
  int total;
  String status;

  Bill({
    required this.date,
    required this.billNo,
    required this.tableName,
    required this.locationName,
    required this.tax,
    required this.total,
    required this.status,
  });
}

var bills = <Bill>[
  Bill(
      date: "29/12/2020",
      billNo: "2912202",
      tableName: "A2",
      locationName: "Sảnh A",
      tax: 6300,
      total: 69300,
      status: "Hoàn tiền"),
  Bill(
      date: "20/12/2020",
      billNo: "2012205",
      tableName: "A5",
      locationName: "Sảnh A",
      tax: 50000,
      total: 550000,
      status: "Đóng"),
];
