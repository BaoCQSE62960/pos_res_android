class Payment {
  Payment({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;
  bool isSelected = false;

  set setIsSelected(bool newValue) {
    isSelected = newValue;
  }

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      name: json['name'],
    );
  }
}

class PaymentProcess {
  PaymentProcess(
      {required this.id,
      required this.name,
      required this.amount,
      required this.transactionid});

  final int id;
  final String name;
  final String? transactionid;
  num amount;

  factory PaymentProcess.fromJson(Map<String, dynamic> json) {
    return PaymentProcess(
      transactionid: json['transactionid'],
      id: json['id'],
      name: json['name'],
      amount: num.parse(json['amount']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['amount'] = amount.toString();
    data['transactionid'] = transactionid == '' ? null : transactionid;
    return data;
  }
}

class PaymentCheck {
  PaymentCheck({
    required this.checkid,
    required this.list,
  });

  final int checkid;
  final List<PaymentProcess> list;

  factory PaymentCheck.fromJson(Map<String, dynamic> json) {
    return PaymentCheck(
      checkid: json['checkid'],
      list: json['paymentlist'],
    );
  }
}

class ListPaymentMethod {
  final List<Payment> list;
  ListPaymentMethod({required this.list});

  factory ListPaymentMethod.fromJson(List<dynamic> parseJson) {
    List<Payment> list = parseJson.map((e) => Payment.fromJson(e)).toList();
    return ListPaymentMethod(list: list);
  }
}

class ListPaymentProcess {
  final List<PaymentProcess> list;
  ListPaymentProcess({required this.list});

  factory ListPaymentProcess.fromJson(List<dynamic> parseJson) {
    List<PaymentProcess> list =
        parseJson.map((e) => PaymentProcess.fromJson(e)).toList();
    return ListPaymentProcess(list: list);
  }
}

class ListPaymentCheck {
  final List<PaymentCheck> list;
  ListPaymentCheck({required this.list});

  factory ListPaymentCheck.fromJson(List<dynamic> parseJson) {
    List<PaymentCheck> list =
        parseJson.map((e) => PaymentCheck.fromJson(e)).toList();
    return ListPaymentCheck(list: list);
  }
}
