// ignore_for_file: library_prefixes

import 'package:equatable/equatable.dart';
import 'package:pos_res_android/repos/models/waiter/checkdetail.dart';
import 'package:pos_res_android/repos/models/waiter/item.dart';
import 'package:pos_res_android/repos/models/waiter/specialrequests.dart';
import 'package:pos_res_android/repos/models/waiter/voidreason.dart';
import 'package:pos_res_android/screens/Order/widget/buttons/custom_quantity_button.dart'
    as AddOrder;
import 'package:pos_res_android/screens/Order/widget/buttons/custom_quantity_button_change_order.dart'
    as ChangeOrder;

class OrderLayoutEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadData extends OrderLayoutEvent {
  LoadData({required this.checkid, this.tableid, this.searchQuery});

  final int checkid;
  final int? tableid;
  final String? searchQuery;
}

class ChangeMenu extends OrderLayoutEvent {
  ChangeMenu({required this.menuid});

  final int menuid;
}

class ChangeMajor extends OrderLayoutEvent {
  ChangeMajor({required this.majorid});

  final int majorid;
}

class ChangeMode extends OrderLayoutEvent {
  ChangeMode();
}

// ignore: must_be_immutable
class AddItem extends OrderLayoutEvent {
  AddItem({this.item, this.checkDetail});

  Item? item;
  CheckDetail? checkDetail;
}

class UpdateInfo extends OrderLayoutEvent {
  UpdateInfo({required this.guestname, required this.cover});

  final String guestname;
  final int cover;
}

class UpdateNote extends OrderLayoutEvent {
  UpdateNote({required this.note});

  final String note;
}

class LoadSpecialRequestsForItem extends OrderLayoutEvent {
  LoadSpecialRequestsForItem(
      {required this.itemid, required this.checkdetailid});

  final int itemid;
  final int checkdetailid;
}

class SelectSpecialRequestForItem extends OrderLayoutEvent {
  SelectSpecialRequestForItem({required this.specialRequests});

  final SpecialRequests specialRequests;
}

class SelectCheckDetailForChangeOrder extends OrderLayoutEvent {
  SelectCheckDetailForChangeOrder({required this.checkDetail});

  final CheckDetail checkDetail;
}

class SelectPercentForSplitOrder extends OrderLayoutEvent {
  SelectPercentForSplitOrder({required this.percent});

  final int percent;
}

class SelectVoidReason extends OrderLayoutEvent {
  SelectVoidReason({required this.voidReason});

  final VoidReason voidReason;
}

class VoidACheck extends OrderLayoutEvent {
  VoidACheck({required this.checkid});

  final int checkid;
}

class VoidACheckDetail extends OrderLayoutEvent {
  VoidACheckDetail({required this.checkdetailid});

  final int checkdetailid;
}

class ServedACheckDetail extends OrderLayoutEvent {
  ServedACheckDetail({required this.checkdetailid});

  final int checkdetailid;
}

class RemindACheckDetail extends OrderLayoutEvent {
  RemindACheckDetail({required this.checkdetailid});

  final int checkdetailid;
}

class UpdateSpecialRequestForItem extends OrderLayoutEvent {
  UpdateSpecialRequestForItem(
      {required this.checkdetailid, required this.note});

  final int checkdetailid;
  final String note;
}

class UpdateQuantity extends OrderLayoutEvent {
  UpdateQuantity({required this.checkDetailIDLocal, required this.mode});

  final int checkDetailIDLocal;
  final AddOrder.QuantityUpdateMode mode;
}

class UpdateQuantityChangeOrder extends OrderLayoutEvent {
  UpdateQuantityChangeOrder({required this.checkDetailID, required this.mode});

  final int checkDetailID;
  final ChangeOrder.QuantityUpdateMode mode;
}

class SendOrder extends OrderLayoutEvent {
  SendOrder();
}

class RemoveLocalCheckDetail extends OrderLayoutEvent {
  RemoveLocalCheckDetail({required this.checkDetailID});

  final int checkDetailID;
}

class ResetSelectedCheckDetail extends OrderLayoutEvent {
  ResetSelectedCheckDetail();
}
