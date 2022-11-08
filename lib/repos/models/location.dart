class Location {
  Location({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['locationid'],
      name: json['name'],
    );
  }
}

class ListLocation {
  final List<Location> list;
  ListLocation({required this.list});

  factory ListLocation.fromJson(List<dynamic> parseJson) {
    List<Location> list = parseJson.map((e) => Location.fromJson(e)).toList();
    return ListLocation(list: list);
  }
}
