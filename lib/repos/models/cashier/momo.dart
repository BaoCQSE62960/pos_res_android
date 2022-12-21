class Momo {
  String partnerCode;
  String requestId;
  num amount;
  String orderId;
  String orderInfo;
  String redirectUrl;
  String ipnUrl;
  String requestType;
  String extraData;
  String lang;
  String signature;

  Momo({
    required this.partnerCode,
    required this.requestId,
    required this.amount,
    required this.orderId,
    required this.orderInfo,
    required this.redirectUrl,
    required this.ipnUrl,
    required this.requestType,
    required this.extraData,
    required this.lang,
    required this.signature,
  });

  factory Momo.fromJson(Map<String, dynamic> json) {
    return Momo(
      partnerCode: json['partnerCode'],
      requestId: json['requestId'],
      amount: num.parse(json['amount']),
      orderId: json['orderId'],
      orderInfo: json['orderInfo'],
      redirectUrl: json['redirectUrl'],
      ipnUrl: json['ipnUrl'],
      requestType: json['requestType'],
      extraData: json['extraData'],
      lang: json['lang'],
      signature: json['signature'],
    );
  }
}

class ListMomo {
  final List<Momo> list;
  ListMomo({required this.list});

  factory ListMomo.fromJson(List<dynamic> parseJson) {
    List<Momo> list = parseJson.map((e) => Momo.fromJson(e)).toList();
    return ListMomo(list: list);
  }
}
