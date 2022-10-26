class MajorGroup {
  MajorGroup({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  // var empty = MajorGroup(id: 0, name: '');

  factory MajorGroup.fromJson(Map<String, dynamic> json) => MajorGroup(
        id: json['id'],
        name: json['name'],
      );
}
