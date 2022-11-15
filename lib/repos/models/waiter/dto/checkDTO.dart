// ignore_for_file: file_names

import 'package:pos_res_android/repos/models/waiter/dto/itemDTO.dart';

class CheckDTO {
  CheckDTO({required this.checkid, required this.listItemDTO});

  final String checkid;
  final List<ItemDTO> listItemDTO;

  Map<String, dynamic> toJson() =>
      {'checkid': checkid, 'itemlist': listItemDTO};
}
