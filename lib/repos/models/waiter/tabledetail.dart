class TableDetail {
  TableDetail(
      {required this.id,
      required this.status,
      required this.tablename,
      required this.checkid,
      required this.totalamount,
      required this.cover,
      required this.iswaiting,
      required this.isready,
      required this.isrecall});

  final int id;
  final String status;
  final String tablename;
  final int checkid;
  final String totalamount;
  final int cover;
  final bool iswaiting;
  final bool isready;
  final bool isrecall;

  factory TableDetail.fromJson(Map<String, dynamic> json) => TableDetail(
      id: json['id'],
      status: json['status'],
      tablename: json['tablename'],
      checkid: json['checkid'] ?? 0,
      totalamount: json['totalamount'] ?? '',
      cover: json['cover'] ?? 0,
      iswaiting: json['iswaiting'],
      isready: json['isready'],
      isrecall: json['isrecall']);
}
