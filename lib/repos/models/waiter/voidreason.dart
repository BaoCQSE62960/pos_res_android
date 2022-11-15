class VoidReason {
  VoidReason({required this.id, required this.name});

  final int id;
  final String name;

  static VoidReason EMPTY = VoidReason(id: 0, name: '');

  factory VoidReason.fromJson(Map<String, dynamic> json) =>
      VoidReason(id: json['id'], name: json['name']);
}
