import 'package:pos_res_android/repos/models/specialrequest.dart';

class CheckDetail {
  CheckDetail(
      {required this.checkdetailid,
      required this.itemid,
      required this.itemname,
      required this.quantity,
      required this.note,
      required this.isreminded,
      required this.amount,
      required this.status,
      required this.specialRequest});

  final int checkdetailid;
  final int itemid;
  final String itemname;
  final int quantity;
  final String note;
  final bool isreminded;
  final int amount;
  final String status;
  List<SpecialRequest> specialRequest;

  factory CheckDetail.fromJson(Map<String, dynamic> json) => CheckDetail(
      checkdetailid: json['checkdetailid'],
      itemid: json['itemid'],
      itemname: json['itemname'],
      quantity: json['quantity'],
      note: json['note'],
      isreminded: json['isreminded'],
      amount: json['amount'],
      status: json['status'],
      specialRequest: (json['specialrequest'] as List)
          .map((e) => SpecialRequest.fromJson(e))
          .toList());
}
