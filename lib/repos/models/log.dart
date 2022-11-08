class CashierLog {
  String shiftname;
  DateTime creationtime;
  String type;
  int amount;
  String fullname;

  CashierLog({
    required this.shiftname,
    required this.creationtime,
    required this.type,
    required this.amount,
    required this.fullname,
  });

  // factory CashierLog.fromJson(Map<String, dynamic> json) => CashierLog(
  //       shiftname: json['shiftname'],
  //       creationtime: json['creationtime'],
  //       type: json['type'],
  //       amount: json['amount'],
  //       fullname: json['fullname'],
  //     );
}

var logs = <CashierLog>[
  CashierLog(
      shiftname: "Ca 2",
      creationtime: DateTime.utc(2020, 12, 29, 13),
      type: "Mở Ca",
      amount: 30000000,
      fullname: "Nguyễn Văn A"),
  CashierLog(
      shiftname: "Ca 2",
      creationtime: DateTime.utc(2020, 12, 29, 15),
      type: "Đóng ca",
      amount: 50000000,
      fullname: "Nguyễn Văn A"),
];
