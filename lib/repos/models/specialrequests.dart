class SpecialRequests {
  SpecialRequests({required this.id, required this.name});

  final int id;
  final String name;

  factory SpecialRequests.fromJson(Map<String, dynamic> json) =>
      SpecialRequests(id: json['id'], name: json['name']);
}
