class Item {
  Item(
      {required this.id,
      required this.name,
      required this.instock,
      required this.image,
      required this.majorgroupid,
      required this.menuitemid,
      required this.price});

  final int id;
  final String name;
  final int menuitemid;
  final int majorgroupid;
  final String image;
  final int price;
  final bool instock;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
      id: json['id'],
      name: json['name'],
      instock: json['instock'],
      image: json['image'],
      majorgroupid: json['majorgroupid'],
      menuitemid: json['menuitemid'],
      price: json['price']);
}
