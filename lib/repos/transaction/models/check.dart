class Check {
  // final DateInputElement date;
  final String date;
  final String checkNo;
  final String tableName;
  final String locationName;
  final double tax;
  final double total;
  final String status;

  Check({
    required this.date,
    required this.checkNo,
    required this.tableName,
    required this.locationName,
    required this.tax,
    required this.total,
    required this.status,
  });

  factory Check.fromJson(Map<String, dynamic> json) => Check(
        date: json['date'],
        checkNo: json['checkNo'],
        tableName: json['tableName'],
        locationName: json['locationName'],
        tax: json['tax'],
        total: json['total'],
        status: json['status'],
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Check &&
          runtimeType == other.runtimeType &&
          date == other.date &&
          checkNo == other.checkNo &&
          tableName == other.tableName &&
          locationName == other.locationName &&
          tax == other.tax &&
          total == other.total &&
          status == other.status;

  @override
  int get hashCode =>
      date.hashCode ^
      checkNo.hashCode ^
      tableName.hashCode ^
      locationName.hashCode ^
      tax.hashCode ^
      total.hashCode ^
      status.hashCode;
}
