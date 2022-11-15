class CashierLog {
  int id;
  String shiftname;
  DateTime creationtime;
  String type;
  num amount;
  String fullname;

  CashierLog({
    required this.id,
    required this.shiftname,
    required this.creationtime,
    required this.type,
    required this.amount,
    required this.fullname,
  });

  set setAmount(num newValue) {
    amount = newValue;
  }

  factory CashierLog.fromJson(Map<String, dynamic> json) {
    return CashierLog(
      id: json['id'],
      shiftname: json['shiftname'],
      // creationtime:
      //     DateFormat('yyyy-MM-dd HH:mm:ss.SSSSSS').parse(json['creationtime']),
      creationtime: DateTime.parse(json['creationtime']),
      type: json['type'],
      amount: num.parse(json['amount']),
      fullname: json['fullname'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class CashierLogItem {
  int id;
  num amount;

  CashierLogItem({
    required this.id,
    required this.amount,
  });

  factory CashierLogItem.fromJson(Map<String, dynamic> json) {
    return CashierLogItem(
      id: json['id'],
      amount: num.parse(json['amount']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class ListCashierLog {
  final List<CashierLog> list;
  ListCashierLog({required this.list});

  factory ListCashierLog.fromJson(List<dynamic> parseJson) {
    List<CashierLog> list =
        parseJson.map((e) => CashierLog.fromJson(e)).toList();
    return ListCashierLog(list: list);
  }
}

class CashierLogAmount {
  final List<CashierLogItem> list;
  CashierLogAmount({required this.list});

  factory CashierLogAmount.fromJson(List<dynamic> parseJson) {
    List<CashierLogItem> list =
        parseJson.map((e) => CashierLogItem.fromJson(e)).toList();
    return CashierLogAmount(list: list);
  }
}
