class Table {
  Table({
    required this.id,
    required this.status,
    required this.tablename,
    required this.checkid,
    required this.totalamount,
    required this.cover,
    required this.isWaiting,
    required this.isReady,
    required this.isRecall,
  });

  int id;
  String status;
  String tablename;
  int checkid;
  int totalamount;
  int cover;
  bool isWaiting;
  bool isReady;
  bool isRecall;

  factory Table.fromJson(Map<String, dynamic> json) {
    return Table(
      id: json['locationid'],
      status: json['status'],
      tablename: json['tableName'],
      checkid: json['checkid'],
      totalamount: json['totalamount'],
      cover: json['cover'],
      isWaiting: json['isWaiting'],
      isReady: json['isReady'],
      isRecall: json['isRecall'],
    );
  }
}

class ListTable {
  final List<Table> list;
  ListTable({required this.list});

  factory ListTable.fromJson(List<dynamic> parseJson) {
    List<Table> list = parseJson.map((e) => Table.fromJson(e)).toList();
    return ListTable(list: list);
  }
}

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
