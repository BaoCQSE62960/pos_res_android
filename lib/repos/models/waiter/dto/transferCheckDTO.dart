import 'package:pos_res_android/repos/models/waiter/dto/detaillistDTO.dart';

class TransferCheckDTO {
  TransferCheckDTO(
      {required this.currentTableID,
      required this.targetTableID,
      required this.detailList});

  final int currentTableID;
  final int targetTableID;
  final List<DetailListItemDTO> detailList;

  Map<String, dynamic> toJson() =>
      {'id1': currentTableID, 'id2': targetTableID, 'detaillist': detailList};
}
