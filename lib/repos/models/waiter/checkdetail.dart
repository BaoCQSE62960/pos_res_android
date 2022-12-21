import 'package:pos_res_android/repos/models/waiter/specialrequests.dart';

class CheckDetail {
  CheckDetail(
      {required this.checkdetailidLocal,
      required this.checkdetailquantityLocal,
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
  double checkdetailquantityLocal;
  final int checkdetailid;
  final int itemid;
  final String itemname;
  double quantity;
  String note;
  final bool isreminded;
  double amount;
  final String status;
  final bool isLocal;
  List<SpecialRequests> specialRequest;

  factory CheckDetail.fromJson(Map<String, dynamic> json) => CheckDetail(
      checkdetailidLocal: -1,
      checkdetailquantityLocal: double.parse(json['quantity'].toString()),
      isLocal: false,
      checkdetailid: json['checkdetailid'],
      itemid: json['itemid'],
      itemname: json['itemname'],
      quantity: double.parse(json['quantity'].toString()),
      note: json['note'] ?? '',
      isreminded: json['isreminded'],
      amount: double.parse(json['subtotal'].toString()),
      status: json['status'],
      specialRequest: (json['specialrequest'] as List)
          .map((e) => SpecialRequests.fromJson(e))
          .toList());
}
