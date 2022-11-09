class TableInfo {
  TableInfo({required this.guestname, required this.cover});

  final String guestname;
  final int cover;

  static TableInfo EMPTY = TableInfo(guestname: '', cover: 0);

  factory TableInfo.fromJson(Map<String, dynamic> json) =>
      TableInfo(guestname: json['guestname'] ?? '', cover: json['cover'] ?? 0);

  Map<String, dynamic> toJson() => {'guestname': guestname, 'cover': cover};
}
