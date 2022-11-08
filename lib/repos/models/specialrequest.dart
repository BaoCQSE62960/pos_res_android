class SpecialRequest {
  SpecialRequest({required this.name});

  final String name;

  factory SpecialRequest.fromJson(Map<String, dynamic> json) =>
      SpecialRequest(name: json['name']);
}
