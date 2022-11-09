class Menu {
  Menu({required this.id, required this.name, required this.isdefault});

  final int id;
  final String name;
  final bool isdefault;

  factory Menu.fromJson(Map<String, dynamic> json) =>
      Menu(id: json['id'], name: json['name'], isdefault: json['isdefault']);
}
