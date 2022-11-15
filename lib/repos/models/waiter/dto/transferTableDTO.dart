import 'package:pos_res_android/repos/models/waiter/dto/detaillistDTO.dart';

class TransferTableDTO {
  TransferTableDTO({required this.locationID});

  final int locationID;

  Map<String, dynamic> toJson() => {'locationid': locationID};
}
