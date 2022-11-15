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

class PaymentProcessList {
  PaymentProcessList({
    required this.id,
    required this.name,
    required this.amount,
  });

  final int id;
  final String name;
  final num amount;

  factory PaymentProcessList.fromJson(Map<String, dynamic> json) {
    return PaymentProcessList(
      id: json['id'],
      name: json['name'],
      amount: num.parse(json['amount']),
    );
  }
}

class PaymentCheck {
  PaymentCheck({
    required this.checkid,
    required this.list,
  });

  final int checkid;
  final List<PaymentProcessList> list;

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
  final List<PaymentProcessList> list;
  ListPaymentProcess({required this.list});

  factory ListPaymentProcess.fromJson(List<dynamic> parseJson) {
    List<PaymentProcessList> list =
        parseJson.map((e) => PaymentProcessList.fromJson(e)).toList();
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
