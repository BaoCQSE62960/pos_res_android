extension ItemStatusX on String {
  bool get isOutofStock => this == 'EMPTY';
  bool get isWarning => this == 'WARNING';
  bool get isInofStock => this == 'INSTOCK';
}

class Item {
  Item(
      {required this.id,
      required this.name,
      required this.status,
      required this.image,
      required this.majorgroupid,
      required this.menuitemid,
      required this.price});

  final int id;
  final String name;
  final int menuitemid;
  final int majorgroupid;
  final String image;
  final num price;
  final String status;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      image: json['image'],
      majorgroupid: json['majorgroupid'],
      menuitemid: json['menuitemid'],
      price: num.parse(json['price']));
}
