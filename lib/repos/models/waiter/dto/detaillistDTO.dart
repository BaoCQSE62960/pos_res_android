// ignore_for_file: file_names

class DetailListItemDTO {
  DetailListItemDTO({required this.id, required this.quantity});

  final int id;
  final double quantity;

  Map<String, dynamic> toJson() => {'id': id, 'quantity': quantity};
}
