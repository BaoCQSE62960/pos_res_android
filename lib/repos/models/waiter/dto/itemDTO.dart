// ignore_for_file: file_names

import 'package:pos_res_android/repos/models/waiter/dto/specialrequestDTO.dart';

class ItemDTO {
  ItemDTO(
      {required this.itemid,
      required this.itemprice,
      required this.quantity,
      required this.subtotal,
      required this.taxamount,
      required this.amount,
      required this.note,
      required this.listSpecialRequestDTO});

  final String itemid;
  final String itemprice;
  final String quantity;
  final String subtotal;
  final String taxamount;
  final String amount;
  final String note;
  final List<SpecialRequestDTO> listSpecialRequestDTO;

  Map<String, dynamic> toJson() => {
        'itemid': itemid,
        'itemprice': itemprice,
        'quantity': quantity,
        'subtotal': subtotal,
        'taxamount': taxamount,
        'amount': amount,
        'note': note,
        'specialrequestlist': listSpecialRequestDTO
      };
}
