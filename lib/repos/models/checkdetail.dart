import 'package:pos_res_android/repos/models/specialrequests.dart';

class CheckDetail {
  CheckDetail(
      {required this.checkdetailidLocal,
      required this.checkdetailid,
      required this.itemid,
      required this.itemname,
      required this.quantity,
      required this.note,
      required this.isreminded,
      required this.amount,
      required this.status,
      required this.specialRequest,
      required this.isLocal});

  final int checkdetailidLocal;
  final int checkdetailid;
  final int itemid;
  final String itemname;
  int quantity;
  final String note;
  final bool isreminded;
  int amount;
  final String status;
  final bool isLocal;
  List<SpecialRequests> specialRequest;

  factory CheckDetail.fromJson(Map<String, dynamic> json) => CheckDetail(
      checkdetailidLocal: -1,
      isLocal: false,
      checkdetailid: json['checkdetailid'],
      itemid: json['itemid'],
      itemname: json['itemname'],
      quantity: json['quantity'],
      note: json['note'],
      isreminded: json['isreminded'],
      amount: json['subtotal'],
      status: json['status'],
      specialRequest: (json['specialrequest'] as List)
          .map((e) => SpecialRequests.fromJson(e))
          .toList());
}
